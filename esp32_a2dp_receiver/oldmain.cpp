#include <Arduino.h>
#include <SPI.h>
#include <mcp2515.h>

#include "esp32_bt_music_receiver.h"

#include <esp_wifi.h>
#include "soc/rtc.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
// #include <SAAB_ICM2.h>
#include <Fonts/Picopixel.h>
#include <Fonts/FreeMono12pt7b.h>


BlootoothA2DSink a2d_sink;

#define USE_CAN
// #define USE_ICM2

#ifdef USE_CAN
struct can_frame canMsg;
MCP2515 mcp2515(5);
#endif

#ifdef USE_ICM2
#define WIDTH 106
#define HEIGHT 64
SAAB_ICM2 display = SAAB_ICM2();
#endif

// I2C Pins
// ws_io_num => GPIO 25,
// data_out_num => GPIO 22
// bck_io_num => GPIO 26,
int mutePin = 2;

void setup()
{
  Serial.begin(115200);
  Serial.println("BOOTED!");

  // Turn off wifi
  esp_wifi_set_mode(WIFI_MODE_NULL);
  // esp_wifi_stop();
  pinMode(mutePin, OUTPUT);

#ifdef USE_ICM2
  Wire.begin(33, 32);
  Wire.setClock(400000);

  if (!display.begin())
  {
    Serial.println(F("ICM2 begin() failed"));
    for (;;)
    {
    }
  }

  // Clean the debris off the display
  display.forceClear();
  display.setFont();
  display.clearDisplay();
  display.setCursor(1, 1);
  display.setTextSize(1);

  display.fillScreen(ICM2_OFF);

  display.fillRect(0, 0, WIDTH, 9, ICM2_ON);
  display.setTextColor(ICM2_OFF);

  display.println("Bluetooth");

  display.setTextColor(ICM2_ON);
  display.setCursor(0, 14);
  display.setTextWrap(false);

  display.println(" Song");
  display.println(" Album");
  display.println(" Artist");

  display.display();

#endif

#ifdef USE_CAN
  SPI.begin();
  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS, CAN_CLOCK::MCP_8MHZ);
  mcp2515.setNormalMode();
#endif

  // Fix the audio clock, this improves audio quality.
  rtc_clk_apll_enable(1, 15, 8, 5, 6);
  a2d_sink.start("SAAB");
}

bool muteState = false;
bool playingStateRequest = true;
bool playingState = false;

String lastContent = "";

long playTime = 0;

void loop()
{   
  // Check if we have connection
  if (a2d_sink.get_conn_state() != ESP_A2D_CONNECTION_STATE_CONNECTED)
  {
    // Set digital mute ON and do not handle events.
    digitalWrite(mutePin, 1);
    
    muteState = true;
    playingState = false;
    return;
  }
  else
  {

    // Wait until playing again
    if (playingState)
    {
      if(muteState){
        muteState = false;
        // Reinit to prevent glitchy noise
        // Set digital mute off.
        delay(50);
        digitalWrite(mutePin, 0);
        Serial.print("ACRC feat: ");
        Serial.println(a2d_sink.get_remote_features(),HEX);
      }
    }else{
      muteState = true;
    }
  }

// Read messages
#ifdef USE_CAN
  if (mcp2515.readMessage(&canMsg) == MCP2515::ERROR_OK)
  {
    if (canMsg.can_id == 0x290)
    {
      int btnData = canMsg.data[3];

      switch (btnData)
      {
      case 0x0:
        // Nothing!
        break;
      case 0x5:
        Serial.println("NEXT");
        esp_avrc_ct_send_passthrough_cmd(10, ESP_AVRC_PT_CMD_FORWARD, ESP_AVRC_PT_CMD_STATE_PRESSED);
        delay(50);
        //NEXT
        break;
      case 0x6:
        Serial.println("PREV");
        esp_avrc_ct_send_passthrough_cmd(11, ESP_AVRC_PT_CMD_BACKWARD, ESP_AVRC_PT_CMD_STATE_PRESSED);
        delay(50);
        //PREV
        break;
      case 0x11:
        Serial.println("PLAY/PAUSE");
        if (playingStateRequest)
        {
          esp_avrc_ct_send_passthrough_cmd(12, ESP_AVRC_PT_CMD_PAUSE, ESP_AVRC_PT_CMD_STATE_PRESSED);
        }
        else
        {
          esp_avrc_ct_send_passthrough_cmd(13, ESP_AVRC_PT_CMD_PLAY, ESP_AVRC_PT_CMD_STATE_PRESSED);
        }
        // Update the boolean
        playingStateRequest = !playingStateRequest;
        delay(50);
        //PLAY/PAUSE
        break;
      }
    }
  }

  // If playing content
  if (a2d_sink.get_audio_state() == 2)
  {
    playingState = true;
    // Determine full screen refresh
    String currentContent = "";
    currentContent = a2d_sink.get_track_name() + " - " + a2d_sink.get_album_name() + " by " + a2d_sink.get_artist_name() + " : " + a2d_sink.get_track_length();

    // Do full refresh
    if (currentContent != lastContent)
    {
      lastContent = currentContent;
      Serial.println(currentContent);
#ifdef USE_ICM2
      // Print to the display
      // Clean the debris off the display
      display.forceClear();
      display.clearDisplay();
      display.setCursor(1, 1);
      display.setTextSize(1);
      display.fillScreen(ICM2_OFF);

      display.fillRect(0, 0, WIDTH, 9, ICM2_ON);
      display.setTextColor(ICM2_OFF);
      // display.setFont(NULL);
      display.println("Bluetooth");

      display.setTextColor(ICM2_ON);
      display.setCursor(0, 14);
      display.setTextWrap(false);

      display.println(a2d_sink.get_track_name());
      display.println(a2d_sink.get_album_name());
      display.println(a2d_sink.get_artist_name());

      display.display();
#endif
    }

#ifdef USE_ICM2
    // Draw the time bar
    if (millis() - playTime >= 500)
    {
      playTime = millis();

      // Font for tiny timecode
      display.setFont(&Picopixel);

      // Blank this whoel bottom section
      display.fillRect(0, HEIGHT - 12, WIDTH, 12, ICM2_OFF);

      // Tasty rectangles
      long val = a2d_sink.get_track_pos().toInt();
      long toVal = a2d_sink.get_track_length().toInt();

      if (val > toVal)
      {
        val = 0;
      }

      long mapX = map(val, 0, toVal, 0, WIDTH - 3);
      display.drawRect(0, HEIGHT - 6, WIDTH, 6, ICM2_ON);
      display.fillRect(2, HEIGHT - 4, WIDTH - 3, 2, ICM2_OFF);
      display.fillRect(2, HEIGHT - 4, mapX, 2, ICM2_ON);

      // Make timecode text
      String timeCodeText = "";
      String totalTimeText = "";

      // Draw the time text over the top
      char buf[21];
      unsigned long allSeconds = val / 1000;
      int runHours = allSeconds / 3600;
      int secsRemaining = allSeconds % 3600;
      int runMinutes = secsRemaining / 60;
      int runSeconds = secsRemaining % 60;

      if (runHours != 0)
      {
        sprintf(buf, "%02d:%02d:%02d", runHours, runMinutes, runSeconds);
        timeCodeText += buf;
      }
      else
      {
        sprintf(buf, "%02d:%02d", runMinutes, runSeconds);
        timeCodeText += buf;
      }

      // Also create the total time text
      allSeconds = toVal / 1000;
      runHours = allSeconds / 3600;
      secsRemaining = allSeconds % 3600;
      runMinutes = secsRemaining / 60;
      runSeconds = secsRemaining % 60;

      if (runHours != 0)
      {
        sprintf(buf, "%02d:%02d:%02d", runHours, runMinutes, runSeconds);
        totalTimeText += buf;
      }
      else
      {
        sprintf(buf, "%02d:%02d", runMinutes, runSeconds);
        totalTimeText += buf;
      }

      // Set cursor pos to left sidee
      display.setCursor(1, HEIGHT - 8);
      display.print(timeCodeText);
      // Set cursor pos to right size
      int16_t x1, y1;
      uint16_t w, h;

      display.getTextBounds(totalTimeText, 6, HEIGHT - 8, &x1, &y1, &w, &h);
      display.setCursor(WIDTH - w - 1, HEIGHT - h - 3);
      display.print(totalTimeText);

      display.display();
      display.setFont();
    }
#endif
  }
  else
  {
    playingState = false;
  }
  // delay(100);
#endif
}
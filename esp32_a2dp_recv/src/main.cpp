#include <Arduino.h>
#include <SPI.h>
#include "esp32_bt_music_receiver.h"
#include <mcp2515.h>
#include <esp_wifi.h>
#include "soc/rtc.h"
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <SAAB_ICM2.h>
#include <Fonts/Picopixel.h>
#include <Fonts/FreeMono12pt7b.h>

// List of AVRC passthrough commands, hoping to find one that can trigger
// ok google or SIRI input.
// #define AVRC_ID_SELECT      0x00    /* select */
// #define AVRC_ID_UP          0x01    /* up */
// #define AVRC_ID_DOWN        0x02    /* down */
// #define AVRC_ID_LEFT        0x03    /* left */
// #define AVRC_ID_RIGHT       0x04    /* right */
// #define AVRC_ID_RIGHT_UP    0x05    /* right-up */
// #define AVRC_ID_RIGHT_DOWN  0x06    /* right-down */
// #define AVRC_ID_LEFT_UP     0x07    /* left-up */
// #define AVRC_ID_LEFT_DOWN   0x08    /* left-down */
// #define AVRC_ID_ROOT_MENU   0x09    /* root menu */
// #define AVRC_ID_SETUP_MENU  0x0A    /* setup menu */
// #define AVRC_ID_CONT_MENU   0x0B    /* contents menu */
// #define AVRC_ID_FAV_MENU    0x0C    /* favorite menu */
// #define AVRC_ID_EXIT        0x0D    /* exit */
// #define AVRC_ID_0           0x20    /* 0 */
// #define AVRC_ID_1           0x21    /* 1 */
// #define AVRC_ID_2           0x22    /* 2 */
// #define AVRC_ID_3           0x23    /* 3 */
// #define AVRC_ID_4           0x24    /* 4 */
// #define AVRC_ID_5           0x25    /* 5 */
// #define AVRC_ID_6           0x26    /* 6 */
// #define AVRC_ID_7           0x27    /* 7 */
// #define AVRC_ID_8           0x28    /* 8 */
// #define AVRC_ID_9           0x29    /* 9 */
// #define AVRC_ID_DOT         0x2A    /* dot */
// #define AVRC_ID_ENTER       0x2B    /* enter */
// #define AVRC_ID_CLEAR       0x2C    /* clear */
// #define AVRC_ID_CHAN_UP     0x30    /* channel up */
// #define AVRC_ID_CHAN_DOWN   0x31    /* channel down */
// #define AVRC_ID_PREV_CHAN   0x32    /* previous channel */
// #define AVRC_ID_SOUND_SEL   0x33    /* sound select */
// #define AVRC_ID_INPUT_SEL   0x34    /* input select */
// #define AVRC_ID_DISP_INFO   0x35    /* display information */
// #define AVRC_ID_HELP        0x36    /* help */
// #define AVRC_ID_PAGE_UP     0x37    /* page up */
// #define AVRC_ID_PAGE_DOWN   0x38    /* page down */
// #define AVRC_ID_POWER       0x40    /* power */
// #define AVRC_ID_VOL_UP      0x41    /* volume up */
// #define AVRC_ID_VOL_DOWN    0x42    /* volume down */
// #define AVRC_ID_MUTE        0x43    /* mute */
// #define AVRC_ID_PLAY        0x44    /* play */
// #define AVRC_ID_STOP        0x45    /* stop */
// #define AVRC_ID_PAUSE       0x46    /* pause */
// #define AVRC_ID_RECORD      0x47    /* record */
// #define AVRC_ID_REWIND      0x48    /* rewind */
// #define AVRC_ID_FAST_FOR    0x49    /* fast forward */
// #define AVRC_ID_EJECT       0x4A    /* eject */
// #define AVRC_ID_FORWARD     0x4B    /* forward */
// #define AVRC_ID_BACKWARD    0x4C    /* backward */
// #define AVRC_ID_ANGLE       0x50    /* angle */
// #define AVRC_ID_SUBPICT     0x51    /* subpicture */
// #define AVRC_ID_F1          0x71    /* F1 */
// #define AVRC_ID_F2          0x72    /* F2 */
// #define AVRC_ID_F3          0x73    /* F3 */
// #define AVRC_ID_F4          0x74    /* F4 */
// #define AVRC_ID_F5          0x75    /* F5 */
// #define AVRC_ID_VENDOR      0x7E    /* vendor unique */
// #define AVRC_KEYPRESSED_RELEASE 0x80


BlootoothA2DSink a2d_sink;

#define USE_CAN
#define USE_ICM2

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

void setup()
{
  Serial.begin(115200);
  Serial.println("BOOTED!");

  // Turn off wifi
  esp_wifi_set_mode(WIFI_MODE_NULL);
  // esp_wifi_stop();

#ifdef USE_ICM2
  Wire.begin(33,32);

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
	display.setCursor(1,1);
	display.setTextSize(1);
	
  display.fillScreen(ICM2_OFF);

	display.fillRect(0,0,WIDTH,9,ICM2_ON);
	display.setTextColor(ICM2_OFF);
	
  display.println("Bluetooth");

	display.setTextColor(ICM2_ON);
	display.setCursor(0,14);
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

  // Fix the audio clock
  rtc_clk_apll_enable(1, 15, 8, 5, 6);
  a2d_sink.start("SAAB");
}

bool playingStateRequest = false;
bool playingState = false;
bool pressed = false;
String lastContent = "";

long playTime = 0;
long startPlayTime = millis();

void loop()
{

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
      display.setCursor(1,1);
      display.setTextSize(1);
      display.fillScreen(ICM2_OFF);

      display.fillRect(0,0,WIDTH,9,ICM2_ON);
      display.setTextColor(ICM2_OFF);
      // display.setFont(NULL);
      display.println("Bluetooth");

      display.setTextColor(ICM2_ON);
      display.setCursor(0,14);
      display.setTextWrap(false);
      
      display.println(a2d_sink.get_track_name());
      display.println(a2d_sink.get_album_name());
      display.println(a2d_sink.get_artist_name());   

      display.display();
      #endif
    }

    #ifdef USE_ICM2
    // Draw the time bar
    if(millis() - playTime >= 500)
    {
      playTime = millis();

      // Font for tiny timecode
      display.setFont(&Picopixel);

      // Blank this whoel bottom section
      display.fillRect(0,HEIGHT-12,WIDTH,12,ICM2_OFF);

      // Tasty rectangles
      long val = a2d_sink.get_track_pos().toInt();
      long toVal = a2d_sink.get_track_length().toInt();    

      if(val > toVal)
      {
        val = 0;
      }

      long mapX = map(val,0,toVal,0,WIDTH-3);
      display.drawRect(0,HEIGHT-6,WIDTH,6,ICM2_ON);
      display.fillRect(2,HEIGHT-4,WIDTH-3,2,ICM2_OFF);
      display.fillRect(2,HEIGHT-4,mapX,2,ICM2_ON);

      // Make timecode text
      String timeCodeText = "";
      String totalTimeText = "";

      // Draw the time text over the top
      char buf[21];
      unsigned long allSeconds=val/1000;
      int runHours= allSeconds/3600;
      int secsRemaining=allSeconds%3600;
      int runMinutes=secsRemaining/60;
      int runSeconds=secsRemaining%60;
      
      if(runHours != 0){
        sprintf(buf,"%02d:%02d:%02d",runHours,runMinutes,runSeconds);
        timeCodeText += buf;
      }else{
        sprintf(buf,"%02d:%02d",runMinutes,runSeconds);
        timeCodeText += buf;
      }

      // Also create the total time text
      allSeconds=toVal/1000;
      runHours= allSeconds/3600;
      secsRemaining=allSeconds%3600;
      runMinutes=secsRemaining/60;
      runSeconds=secsRemaining%60;
      
      if(runHours != 0){
        sprintf(buf,"%02d:%02d:%02d",runHours,runMinutes,runSeconds);
        totalTimeText += buf;
      }else{
        sprintf(buf,"%02d:%02d",runMinutes,runSeconds);
        totalTimeText += buf;
      }

      // Set cursor pos to left sidee
      display.setCursor(1,HEIGHT-8);
      display.print(timeCodeText);
      // Set cursor pos to right size
      int16_t  x1, y1;
      uint16_t w, h;

      display.getTextBounds(totalTimeText,6,HEIGHT-8,&x1,&y1,&w,&h);
      display.setCursor(WIDTH - w - 1,HEIGHT - h - 3);
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
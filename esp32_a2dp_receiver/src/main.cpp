#include <Arduino.h>
#include <SPI.h>
#include <mcp2515.h>
#include "esp32_bt_music_receiver.h"
#include <esp_wifi.h>
#include "soc/rtc.h"
#include <Wire.h>


BTSink a2d_sink;

#define USE_CAN

#ifdef USE_CAN
struct can_frame canMsg;
MCP2515 mcp2515(5);
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

  delay(3000);

  // Turn off wifi
  esp_wifi_set_mode(WIFI_MODE_NULL);
  // esp_wifi_stop();
  pinMode(mutePin, OUTPUT);

#ifdef USE_CAN
  SPI.begin();
  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS, CAN_CLOCK::MCP_8MHZ);
  mcp2515.setNormalMode();
#endif

  Serial.println("Starting BT STACK...");

  // Fix the audio clock, this improves audio quality.
  rtc_clk_apll_enable(1, 15, 8, 5, 6);
  a2d_sink.start("SAAB");

  // Wait for stack up
  while(a2d_sink.stackUpComplete == false)
  {
    Serial.print(",");
    delay(50);
  }
  Serial.println("BT STACK UP!");

  // Wait for 5 seconds and then attempt reconnect 
  delay(5000); 
  Serial.println("Connecting to last device...");
  a2d_sink.reconn_last();

  while(a2d_sink.get_conn_state() != ESP_A2D_CONNECTION_STATE_CONNECTED)
  {
    Serial.print(".");
    delay(1000);
  }
  Serial.println("Connected!");

  // Wait for the CALLS to be available  

  // // // Wait for 10 seconds and trigger google assistant
  // delay(10000);
  // Serial.println("Pressing next song...");
  // esp_avrc_ct_send_passthrough_cmd(10, ESP_AVRC_PT_CMD_FORWARD, ESP_AVRC_PT_CMD_STATE_PRESSED);
  
  // esp_hf_client_start_voice_recognition();
  // delay(5000);
  // esp_hf_client_stop_voice_recognition();
}

bool muteState = false;
bool playingStateRequest = true;
bool playingState = false;

String lastContent = "";

long playTime = 0;
uint32_t lastVoiceReqTime = millis();
uint32_t voiceReqFreq = 1000;

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
      case 0x04:
        Serial.println("VOICE REQ");
        if(millis() - lastVoiceReqTime > voiceReqFreq){
          esp_hf_client_start_voice_recognition();
          delay(50);
          lastVoiceReqTime = millis();
        }
      }
    }
  }

  // If playing content
  if (a2d_sink.get_audio_state() == 2)
  {
    playingState = true;
    // Determine full screen refresh
    String currentContent = "";

    // currentContent = a2d_sink.get_track_name() + " - " + a2d_sink.get_album_name() + " by " + a2d_sink.get_artist_name() + " : " + a2d_sink.get_track_length();
    currentContent = a2d_sink.audio_trackname + " - " + a2d_sink.audio_trackalbum + " by " + a2d_sink.audio_trackartist + " : " + a2d_sink.audio_tracklength;

    // Do full refresh
    if (currentContent != lastContent)
    {
      lastContent = currentContent;
      Serial.println(currentContent);
    }
  }
  else
  {
    playingState = false;
  }
  // delay(100);
#endif
}
#include <Arduino.h>
#include <SPI.h>
#include "esp32_bt_music_receiver.h"
#include <mcp2515.h>
#include <esp_wifi.h>
#include "soc/rtc.h"

BlootoothA2DSink a2d_sink;

#define USE_CAN

#ifdef USE_CAN
  struct can_frame canMsg;
  MCP2515 mcp2515(5);
#endif

// I2C Pins
// ws_io_num => GPIO 25,
// data_out_num => GPIO 22
// bck_io_num => GPIO 26,

void setup() {
  Serial.begin(115200);
  Serial.println("BOOTED!");

  // Turn off wifi
  esp_wifi_set_mode(WIFI_MODE_NULL);
  // esp_wifi_stop();

#ifdef USE_CAN
  SPI.begin();
  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS,CAN_CLOCK::MCP_8MHZ);
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

void loop() {

  // Read messages
  #ifdef USE_CAN
  if (mcp2515.readMessage(&canMsg) == MCP2515::ERROR_OK) {
    if(canMsg.can_id == 0x290)
    {
      int btnData = canMsg.data[3];

      switch(btnData)
      {
        case 0x0:
          // Nothing!
          break;
        case 0x5:
          Serial.println("NEXT");
          esp_avrc_ct_send_passthrough_cmd(10,ESP_AVRC_PT_CMD_FORWARD,ESP_AVRC_PT_CMD_STATE_PRESSED);
          delay(50);
          //NEXT
          break;
        case 0x6:
          Serial.println("PREV");
          esp_avrc_ct_send_passthrough_cmd(11,ESP_AVRC_PT_CMD_BACKWARD,ESP_AVRC_PT_CMD_STATE_PRESSED);
          delay(50);
          //PREV
          break;
        case 0x11:
          Serial.println("PLAY/PAUSE");
          if(playingStateRequest)
          {
            esp_avrc_ct_send_passthrough_cmd(12,ESP_AVRC_PT_CMD_PAUSE,ESP_AVRC_PT_CMD_STATE_PRESSED);
          }else{
            esp_avrc_ct_send_passthrough_cmd(13,ESP_AVRC_PT_CMD_PLAY,ESP_AVRC_PT_CMD_STATE_PRESSED);
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
  if(a2d_sink.get_audio_state() == 2)
  {
    playingState = true;
    String currentContent = "";
    currentContent = a2d_sink.get_track_name() + " - " + a2d_sink.get_album_name() + " by " + a2d_sink.get_artist_name();

    if(currentContent != lastContent)
    {
      lastContent = currentContent;
      Serial.println(currentContent);
    }
  }else{
    playingState = false;
  }
  #endif
}
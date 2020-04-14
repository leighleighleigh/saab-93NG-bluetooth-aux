#include <Arduino.h>
#include <SPI.h>
#include "esp32_bt_music_receiver.h"
#include <mcp2515.h>

BlootoothA2DSink a2d_sink;


struct can_frame canMsg;
MCP2515 mcp2515(5);

void setup() {
  Serial.begin(115200);
  SPI.begin();

  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS,CAN_CLOCK::MCP_8MHZ);
  mcp2515.setNormalMode();
  // mcp2515.setLoopbackMode();

  // SETUP EXTERNAL DAC OUTPUT
  static const i2s_config_t i2s_config = {
      .mode = (i2s_mode_t) (I2S_MODE_MASTER | I2S_MODE_TX | I2S_MODE_DAC_BUILT_IN),
      .sample_rate = 44100, // corrected by info from bluetooth
      .bits_per_sample = (i2s_bits_per_sample_t) 16, /* the DAC module will only take the 8bits from MSB */
      .channel_format = I2S_CHANNEL_FMT_RIGHT_LEFT,
      .communication_format = I2S_COMM_FORMAT_I2S_MSB,
      .intr_alloc_flags = 0, // default interrupt priority
      .dma_buf_count = 8,
      .dma_buf_len = 64,
      .use_apll = false
  };

  a2d_sink.set_i2s_config(i2s_config);  
  a2d_sink.start("SAAB Bluetooth Devboard");  
}

bool isPlaying = false;
bool pressed = false;
String lastContent = "";

void loop() {

  // Read messages
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
          delay(100);
          //NEXT
          break;
        case 0x6:
          Serial.println("PREV");
          esp_avrc_ct_send_passthrough_cmd(11,ESP_AVRC_PT_CMD_BACKWARD,ESP_AVRC_PT_CMD_STATE_PRESSED);
          delay(100);
          //PREV
          break;
        case 0x11:
          Serial.println("PLAY/PAUSE");
          if(isPlaying)
          {
            esp_avrc_ct_send_passthrough_cmd(12,ESP_AVRC_PT_CMD_PAUSE,ESP_AVRC_PT_CMD_STATE_PRESSED);
          }else{
            esp_avrc_ct_send_passthrough_cmd(13,ESP_AVRC_PT_CMD_PLAY,ESP_AVRC_PT_CMD_STATE_PRESSED);
          }
          delay(100);
          //PLAY/PAUSE
          break;
      }    
    }
  }

  // If playing content
  if(a2d_sink.get_audio_state() == 2)
  {
    isPlaying = true;
    String currentContent = "";
    currentContent = a2d_sink.get_track_name() + " - " + a2d_sink.get_album_name() + " by " + a2d_sink.get_artist_name();

    if(currentContent != lastContent)
    {
      lastContent = currentContent;
      Serial.println(currentContent);
    }
  }else{
    isPlaying = false;
  }
}
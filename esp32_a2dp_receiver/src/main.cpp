#include <Arduino.h>
#include <SPI.h>
#include <mcp2515.h>
#include <esp_wifi.h>
#include "soc/rtc.h"
#include <Wire.h>
#include "BluetoothA2DPSink.h"

BluetoothA2DPSink a2dp_sink;

// Connect CAN_H to LS GMLAN1 (can be found on the ICM harness (pin 1), or solder directly to ICM connector PCB pads). 
// Leave CAN_L unconnected. 
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


void setup() {
  // Enable serial
  Serial.begin(115200);
  Serial.println("BOOTED!");

  // Turn off wifi
  esp_wifi_set_mode(WIFI_MODE_NULL);
  // esp_wifi_stop();
  pinMode(mutePin, OUTPUT);

  // Setup CAN
  #ifdef USE_CAN
  SPI.begin();
  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS, CAN_CLOCK::MCP_8MHZ);
  mcp2515.setNormalMode();
  #endif

  // Setup UDA1334A DAC
  static const i2s_config_t i2s_config = {
    .mode = (i2s_mode_t) (I2S_MODE_MASTER | I2S_MODE_TX),
      .sample_rate = 44100,
      .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,
      .channel_format = I2S_CHANNEL_FMT_RIGHT_LEFT,
      .communication_format = (i2s_comm_format_t) (I2S_COMM_FORMAT_I2S | I2S_COMM_FORMAT_I2S_MSB),
      .intr_alloc_flags = 0, // default interrupt priority
      .dma_buf_count = 8,
      .dma_buf_len = 64,
      .use_apll = true,
      .tx_desc_auto_clear = true
    };
    // Fix the audio clock, this improves audio quality.
    rtc_clk_apll_enable(1, 15, 8, 5, 6);
    a2dp_sink.set_i2s_config(i2s_config);

  // Start the A2DP sink
  a2dp_sink.start("Saab 9-3");  
  Serial.println("BT STACK UP!");
}

bool muteState = false;
bool playingStateRequest = true;
bool playingState = false;

String lastContent = "";

long playTime = 0;
uint32_t lastVoiceReqTime = millis();
uint32_t voiceReqFreq = 1000;

void loop() {
  // Check if we have connection
  if (a2dp_sink.get_connection_state() != ESP_A2D_CONNECTION_STATE_CONNECTED)
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
        //Serial.print("ACRC feat: ");
        //Serial.println(a2dp_sink.get_remote_features(),HEX);
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
        a2dp_sink.next();
        delay(50);
        //NEXT
        break;
      case 0x6:
        Serial.println("PREV");
        a2dp_sink.previous();
        delay(50);
        //PREV
        break;
      case 0x11:
        Serial.println("PLAY/PAUSE");
        if (playingStateRequest)
        {
          a2dp_sink.pause();
        }
        else
        {
          a2dp_sink.play();
        }
        // Update the boolean
        playingStateRequest = !playingStateRequest;
        delay(50);
        //PLAY/PAUSE
        break;

      /*
      case 0x04:
        Serial.println("VOICE REQ");
        if(millis() - lastVoiceReqTime > voiceReqFreq){
          esp_hf_client_start_voice_recognition();
          delay(50);
          lastVoiceReqTime = millis();
        }
        */

      }
    }
  }

  // If playing content
  if (a2dp_sink.get_audio_state() == 2)
  {
    playingState = true;
    // Determine full screen refresh
    String currentContent = "";

    //currentContent = a2dp_sink.audio_trackname + " - " + a2dp_sink.audio_trackalbum + " by " + a2dp_sink.audio_trackartist + " : " + a2dp_sink.audio_tracklength;

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
  #endif
}
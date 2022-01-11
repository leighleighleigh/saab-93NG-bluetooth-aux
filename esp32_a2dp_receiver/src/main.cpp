#include <Arduino.h>
#include <SPI.h>
#include <mcp2515.h>
#include <esp_hf_client_api.h>
#include "soc/rtc.h"
#include <Wire.h>
#include "BluetoothA2DPSink.h"

BluetoothA2DPSink a2dp_sink;

// Use CAN for steering wheel controls
// #define USE_CAN
// Start playing audio immediately after connecting/reconnecting to phone
#define RESUME_AUDIO_ON_CONNECTION

#ifdef USE_CAN
struct can_frame canMsg;
MCP2515 mcp2515(5);
#endif

// I2C Pins
// ws_io_num => GPIO 25,
// data_out_num => GPIO 22
// bck_io_num => GPIO 26,
int mutePin = 2;

// Metadata
// 0x1 - Song Title
// 0x2 - Artist
// 0x4 - Album
void avrc_metadata_callback(uint8_t data1, const uint8_t *data2) {
  Serial.printf("AVRC metadata rsp: attribute id 0x%x, %s\n", data1, data2);
}

// HFP
static const char *BT_HF_TAG = "BT_HF";
const char *c_hf_evt_str[] = {
    "CONNECTION_STATE_EVT",              /*!< connection state changed event */
    "AUDIO_STATE_EVT",                   /*!< audio connection state change event */
    "VR_STATE_CHANGE_EVT",                /*!< voice recognition state changed */
    "CALL_IND_EVT",                      /*!< call indication event */
    "CALL_SETUP_IND_EVT",                /*!< call setup indication event */
    "CALL_HELD_IND_EVT",                 /*!< call held indicator event */
    "NETWORK_STATE_EVT",                 /*!< network state change event */
    "SIGNAL_STRENGTH_IND_EVT",           /*!< signal strength indication event */
    "ROAMING_STATUS_IND_EVT",            /*!< roaming status indication event */
    "BATTERY_LEVEL_IND_EVT",             /*!< battery level indication event */
    "CURRENT_OPERATOR_EVT",              /*!< current operator name event */
    "RESP_AND_HOLD_EVT",                 /*!< response and hold event */
    "CLIP_EVT",                          /*!< Calling Line Identification notification event */
    "CALL_WAITING_EVT",                  /*!< call waiting notification */
    "CLCC_EVT",                          /*!< listing current calls event */
    "VOLUME_CONTROL_EVT",                /*!< audio volume control event */
    "AT_RESPONSE",                       /*!< audio volume control event */
    "SUBSCRIBER_INFO_EVT",               /*!< subscriber information event */
    "INBAND_RING_TONE_EVT",              /*!< in-band ring tone settings */
    "LAST_VOICE_TAG_NUMBER_EVT",         /*!< requested number from AG event */
    "RING_IND_EVT",                      /*!< ring indication event */
};
void bt_hf_client_cb(esp_hf_client_cb_event_t event, esp_hf_client_cb_param_t *param)
{
    if (event <= ESP_HF_CLIENT_RING_IND_EVT) {
        ESP_LOGE(BT_HF_TAG, "APP HFP event: %s", c_hf_evt_str[event]);
    } else {
        ESP_LOGE(BT_HF_TAG, "APP HFP invalid event %d", event);
    }
}


void setup() {
  // Enable serial
  Serial.begin(115200);
  Serial.println("BOOTED!");

  pinMode(mutePin, OUTPUT);

  // Setup CAN
  #ifdef USE_CAN
  SPI.begin();
  mcp2515.reset();
  mcp2515.setBitrate(CAN_33KBPS, CAN_CLOCK::MCP_8MHZ);
  mcp2515.setNormalMode();
  #endif

  // Change pins
  static const i2s_pin_config_t pin_config = {
      .bck_io_num = 4, // 26
      .ws_io_num = 15, // 25
      .data_out_num = 2, // 22
      .data_in_num = I2S_PIN_NO_CHANGE
  };
  a2dp_sink.set_pin_config(pin_config);

  // Setup UDA1334A DAC
  static const i2s_config_t i2s_config = {
    .mode = (i2s_mode_t) (I2S_MODE_MASTER | I2S_MODE_TX),
      .sample_rate = 44100,
      .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,
      .channel_format = I2S_CHANNEL_FMT_RIGHT_LEFT,
      .communication_format = (i2s_comm_format_t) (I2S_COMM_FORMAT_STAND_MSB),
      .intr_alloc_flags = 0, // default interrupt priority
      .dma_buf_count = 8,
      .dma_buf_len = 64,
      .use_apll = true,
      .tx_desc_auto_clear = true
    };
    a2dp_sink.set_i2s_config(i2s_config);

  // Enable auto-reconnect
  // See for details: https://github.com/pschatzmann/ESP32-A2DP/wiki/Auto-Reconnect
  a2dp_sink.set_auto_reconnect(true, false, 1000);

  // Swap audio channels due to this bug: https://github.com/espressif/esp-idf/issues/3399
  // (or is it a bug on my UDA1334A board?)
  // Set to false if left and right channels are swapped for you
  a2dp_sink.set_swap_lr_channels(true);

  // Start the A2DP sink
  a2dp_sink.start("ESP32 DEV");  

  // Metadata
  a2dp_sink.set_avrc_metadata_callback(avrc_metadata_callback);

  // HFP
  esp_hf_client_init();
  esp_hf_client_register_callback(bt_hf_client_cb);
  
  Serial.println("BT STACK UP!");
}

bool muteState = false;
bool playingStateRequest = true;
bool playingState = false;

#ifdef RESUME_AUDIO_ON_CONNECTION
bool resumeAudio = true;
#endif

String lastContent = "";

long playTime = 0;
uint32_t lastVoiceReqTime = millis();
uint32_t voiceReqFreq = 1000;

void loop() {
  // Check if we have connection
  if (a2dp_sink.get_connection_state() != ESP_A2D_CONNECTION_STATE_CONNECTED)
  {
    #ifdef RESUME_AUDIO_ON_CONNECTION
    // If there is no connection, set resumeAudio to true, so that once there is connection we resume audio playback
    if(resumeAudio == false) resumeAudio = true;
    #endif
    
    // Set digital mute ON and do not handle events.
    digitalWrite(mutePin, 1);
    
    muteState = true;
    playingState = false;

    return;
  }
  else
  {
    #ifdef RESUME_AUDIO_ON_CONNECTION
    // Once connected, resume audio playback
    if(resumeAudio == true) 
    {
      // Wait for A2DP to initialize fully before resuming playback (otherwise it might not play)
      delay(1000);
      a2dp_sink.play();
      resumeAudio = false;
    }
    #endif

    // Wait until playing again
    if (playingState)
    {
      if(muteState){
        muteState = false;
        // Reinit to prevent glitchy noise
        // Set digital mute off.
        delay(50);
        digitalWrite(mutePin, 0);
      }
    }else{
      muteState = true;
    }
  }

// Read messages
// 
// CAN database can be found here:
// https://www.trionictuning.com/forum/viewtopic.php?f=46&t=5763
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

      // ESP HF Client
      // https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/bluetooth/esp_hf_client.html
      //
      // Voice Recognition
      case 0x04:
        Serial.println("VOICE REQ");
        if(millis() - lastVoiceReqTime > voiceReqFreq){
          esp_hf_client_start_voice_recognition();
          delay(50);
          lastVoiceReqTime = millis();
        }

      // Answer phone call
      // Need a way to detect if we are in an active call, to be able to hang up the phone. 
      case 0x12:
        Serial.println("ANSWER CALL");
        esp_hf_client_answer_call();
        delay(50);
        break;
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
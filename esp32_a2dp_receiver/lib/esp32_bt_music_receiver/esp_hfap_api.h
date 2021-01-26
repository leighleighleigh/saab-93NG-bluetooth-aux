#include <stdint.h>
#include <stdbool.h>
#include "esp_err.h"

#include "esp_hf_client_api.h"

#ifdef ARDUINO_ARCH_ESP32
#include "esp32-hal-log.h"
#include "esp32-hal-bt.h"
#endif

#define BT_HF_TAG "ESP_HF"

void bt_app_hf_client_cb(esp_hf_client_cb_event_t event, esp_hf_client_cb_param_t *param);
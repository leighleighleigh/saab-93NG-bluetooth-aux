#include "esp_hfap_api.h"

/* callback for HF_CLIENT */
void bt_app_hf_client_cb(esp_hf_client_cb_event_t event, esp_hf_client_cb_param_t *param)
{
    if (event > ESP_HF_CLIENT_RING_IND_EVT) {
        ESP_LOGE(BT_HF_TAG, "APP HFP invalid event %d", event);
    }

    // switch (event) {
    //     case ESP_HF_CLIENT_CONNECTION_STATE_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--connection state %s, peer feats 0x%x, chld_feats 0x%x",
    //                 c_connection_state_str[param->conn_stat.state],
    //                 param->conn_stat.peer_feat,
    //                 param->conn_stat.chld_feat);
    //         // memcpy(peer_addr,param->conn_stat.remote_bda,ESP_BD_ADDR_LEN);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_AUDIO_STATE_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--audio state %s",
    //                 c_audio_state_str[param->audio_stat.state]);
    // #if CONFIG_BTDM_CTRL_BR_EDR_SCO_DATA_PATH_HCI
    //         if (param->audio_stat.state == ESP_HF_CLIENT_AUDIO_STATE_CONNECTED ||
    //             param->audio_stat.state == ESP_HF_CLIENT_AUDIO_STATE_CONNECTED_MSBC) {
    //             esp_hf_client_register_data_callback(bt_app_hf_client_incoming_cb,
    //                                                 bt_app_hf_client_outgoing_cb);
    //             bt_app_hf_client_audio_open();
    //         } else if (param->audio_stat.state == ESP_HF_CLIENT_AUDIO_STATE_DISCONNECTED) {
    //             bt_app_hf_client_audio_close();
    //         }
    // #endif /* #if CONFIG_BTDM_CTRL_BR_EDR_SCO_DATA_PATH_HCI */
    //         break;
    //     }

    //     case ESP_HF_CLIENT_BVRA_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--VR state %s",
    //                 c_vr_state_str[param->bvra.value]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_SERVICE_AVAILABILITY_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--NETWORK STATE %s",
    //                 c_service_availability_status_str[param->service_availability.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_ROAMING_STATUS_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--ROAMING: %s",
    //                 c_roaming_status_str[param->roaming.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_SIGNAL_STRENGTH_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "-- signal strength: %d",
    //                 param->signal_strength.value);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_BATTERY_LEVEL_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--battery level %d",
    //                 param->battery_level.value);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_COPS_CURRENT_OPERATOR_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--operator name: %s",
    //                 param->cops.name);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_CALL_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--Call indicator %s",
    //                 c_call_str[param->call.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_CALL_SETUP_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--Call setup indicator %s",
    //                 c_call_setup_str[param->call_setup.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CIND_CALL_HELD_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--Call held indicator %s",
    //                 c_call_held_str[param->call_held.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_BTRH_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--response and hold %s",
    //                 c_resp_and_hold_str[param->btrh.status]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CLIP_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--clip number %s",
    //                 (param->clip.number == NULL) ? "NULL" : (param->clip.number));
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CCWA_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--call_waiting %s",
    //                 (param->ccwa.number == NULL) ? "NULL" : (param->ccwa.number));
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CLCC_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--Current call: idx %d, dir %s, state %s, mpty %s, number %s",
    //                 param->clcc.idx,
    //                 c_call_dir_str[param->clcc.dir],
    //                 c_call_state_str[param->clcc.status],
    //                 c_call_mpty_type_str[param->clcc.mpty],
    //                 (param->clcc.number == NULL) ? "NULL" : (param->clcc.number));
    //         break;
    //     }

    //     case ESP_HF_CLIENT_VOLUME_CONTROL_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--volume_target: %s, volume %d",
    //                 c_volume_control_target_str[param->volume_control.type],
    //                 param->volume_control.volume);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_AT_RESPONSE_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--AT response event, code %d, cme %d",
    //                 param->at_response.code, param->at_response.cme);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_CNUM_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--subscriber type %s, number %s",
    //                 c_subscriber_service_type_str[param->cnum.type],
    //                 (param->cnum.number == NULL) ? "NULL" : param->cnum.number);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_BSIR_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--inband ring state %s",
    //                 c_inband_ring_state_str[param->bsir.state]);
    //         break;
    //     }

    //     case ESP_HF_CLIENT_BINP_EVT:
    //     {
    //         ESP_LOGI(BT_HF_TAG, "--last voice tag number: %s",
    //                 (param->binp.number == NULL) ? "NULL" : param->binp.number);
    //         break;
    //     }

    //     default:
    //         ESP_LOGE(BT_HF_TAG, "HF_CLIENT EVT: %d", event);
    //         break;
    // }
}

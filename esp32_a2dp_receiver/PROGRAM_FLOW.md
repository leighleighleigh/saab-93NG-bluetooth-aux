# Flow of the program as of calling start() on the BTSink object
## start()
Sets the bt name
### calls init_bluetooth()
 - calls btStart,esp_bluedroid_init, esp_bluedroid_enable
 - This sets up the bluetooth stack.
### calls app_task_start_up()
 - This creates the xTaskQueue, and sets up the app_task_handler_2 on a loop 

### dispatches av_hdl_stack_evt_2 cb on event BT_APP_EVT_STACK_UP
 - this redirects to av_hdl_stack_evt, which on BT_APP_EVT_STACK_UP:
    - sets device name with esp_bt_dev_set_device_name()
    - **registers the A2DP sink**
        - assigns the audio data callback
        - inits it
    - **initialises the avrcp controller**
        - registers the app_rc_ct_callback_2
    - sets the bt discoverable

### calls i2s_driver_install()
### calls i2s_set_pin()

# AVRCP callback app_rc_ct_callback_2
Is a callback that listens for different AVRC Events, and then dispatches app tasks
to the handler av_hdl_avrc_evt_2

# AVRCP av_hdl_avrc_evt_2
Redirects to av_hdl_avrc_evt.
This listens to AVRC connection states, audio metadata etc.
Very useful callback.
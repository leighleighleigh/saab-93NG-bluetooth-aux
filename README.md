# saab-93NG-bluetooth-aux
A module to augment the Aux-In functionality of SAAB 93NG's (2002/3+), to add Bluetooth media playback and steering wheel media control support.

# Project Layout
- /saab_bluetooth_aux_kit
  - This is the PCB which all the modules will solder onto, for easy assembly.
- /93ng-blue-aux 
  - This is the OLD KiCAD 5 project.
- /esp32_a2dp_reciever  
  - PIO project, the software flashed to the ESP32 module to provide bluetooth audio -> I2S functionality.
  - Also handles CAN bus messages, for steering wheel Play/Pause/Next/Previous

# Project status
Bought the following modules and built a working prototype!
- ESP32 NodeMCU Board
- Adafruit I2S to Stereo DAC
- MCP2515 CAN-bus to SPI interface module

Currently writing a new stack using only the ESP-IDF SDK, to allow for simultaneous phone call handling etc.

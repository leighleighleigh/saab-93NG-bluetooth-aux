# saab-93NG-bluetooth-aux
A module to augment the Aux-In functionality of SAAB 93NG's (2002/3+), to add Bluetooth media playback and steering wheel media control support.

# Project Layout
- /93ng-blue-aux 
  - This is the KiCad 5 project!
- /esp32_a2dp_recv  
  - PIO project, the software flashed to the ESP32 module to provide bluetooth audio -> I2S functionality.
  - Also handles CAN bus messages.

# Project status
~~Designing the board and ordering parts to prototype with.~~
Bought the following modules and built a working prototype!
- ESP32 NodeMCU Board
- Adafruit I2S to Stereo DAC
- MCP2515 CAN-bus to SPI interface module 


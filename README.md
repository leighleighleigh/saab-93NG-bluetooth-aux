# saab-93NG-bluetooth-aux
A module to augment the Aux-In functionality of SAAB 93NG's (2002/3+), to add Bluetooth media playback and steering wheel media control support.

# First prototype!
![Imgur](https://i.imgur.com/RzdHh4H.jpg)

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

# Notes:
- CAN H connects to LS GMLAN1 (wire can be found on the ICM connector pin 1, or solder directly to ICM connector PCB pad).
  - Leave CAN L and LS GMLAN2 disconnected.

- 5V, GND, AUX Left, AUX right can be soldered on the EHU PCB. All pads are clearly marked.

- Instead of using 12V, the EHU 5V line can be used. 
  - It turns off after ~10-15 seconds after locking the car with the remote. 
  - 5V wakes up as soon as you unlock the car.

- Using EHU 5V will cause some audible Bluetooth interference. 
  - Use an isolated 5V-5V DC-DC converter to eliminate it (CC3-0505SF-E would be pin-compatible and would fit nicely on the bluetooth aux kit PCB)

#Some notes on EHU 5V line
- I have experienced massive current draw from the battery when using this 5V line previously, while experimenting with a generic Bluetooth Aux module. I tried it again with this project and everything is fine.
- My guess is that my first experiment had a ground loop, and this either caused current to flow through the ground loop, draining the battery, or it confused the EHU and prevented it to go into sleep.
- To solve the ground loop, I left AUX GND disconnected on the EHU end.

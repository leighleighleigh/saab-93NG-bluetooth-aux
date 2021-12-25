# saab-93NG-bluetooth-aux
A module to augment the Aux-In functionality of SAAB 93NG's (2002/3+), to add Bluetooth media playback and steering wheel media control support.

# Features
 - Bluetooth music playback through the wired aux port
 - Steering wheel button controls
  - Play / Pause
  - Next / Previous
  - Voice Assistant
  - Accept incoming phone call 

# First prototype!
<img src="https://i.imgur.com/RzdHh4H.jpg" width="315" height="auto">

# Prototype parts
 - ESP32 NodeMCU Board (30-pin variant)
 - Adafruit I2S to Stereo DAC (UDA1334)
 - MCP2515 CAN-bus to SPI interface module

# Project Layout
- /saab_bluetooth_aux_kit
  - This is the PCB which all the modules will solder onto, for easy assembly.
- /esp32_a2dp_reciever  
  - PIO project, the software flashed to the ESP32 module to provide bluetooth audio -> I2S functionality.
  - Also handles CAN bus messages, for steering wheel Play/Pause/Next/Previous
  
# Notes for building your own (by [jokubasver](https://github.com/jokubasver))
- CAN H connects to LS GMLAN1 (green wire, it can be found on the ICM connector pin 1, or solder directly to ICM connector PCB pad).
- CAN L connects to GND
- Connect a 4.7k resistor between CAN H and CAN L
  - So to make it simple - Since the whole Bluetooth Aux board is getting GND from the AUX connection, I connected GND from the MCP2515 module to CAN L, and I connected a 4.7k resistor across CAN H and CAN L on the MCP2515 module.

- Everything also works if I leave CAN L disconnected and not use the 4.7k resistor. CAN L can be left floating as described here: https://electronics.stackexchange.com/questions/139562/single-wire-can-saab-9-3-i-bus-gmlan#comment670941_139882
  - Question is - which is the proper way? Leave out the terminating resistor and leave CAN L floating? Or connect CAN L to GND and use a 4.7k terminating resistor? Both connection variants seem to work fine.

- Instead of using 12V, the EHU 5V line can be used.
  - It turns off after ~10-15 seconds after locking the car with the remote. 
  - 5V wakes up as soon as you unlock the car.
  - This requires the use of an isolated 5V-5V DC-DC converter (see below)

- 5V, GND, AUX Left, AUX right can be soldered on the EHU PCB. All pads are clearly marked.

- Using EHU 5V will cause some audible Bluetooth interference. 
  - Use an isolated 5V-5V DC-DC converter to eliminate it (CC3-0505SF-E would be pin-compatible and would fit nicely on the bluetooth aux kit PCB)
  - I am personally using AM1SS-0505SJZ together with capacitors and inductors that are shown in the datasheet's example schematic. 

- **Warning on EHU 5V line**
  - I have experienced massive current draw from the battery when using this 5V line previously, while experimenting with a generic Bluetooth Aux module. I tried it again with this project and everything is fine.
  - My guess is that my first experiment had a ground loop, and this either caused current to flow through the ground loop, draining the battery, or it confused the EHU and prevented it to go into sleep.
  - Therefore, I highly suggest you use an isolated DC-DC converter (whether you are using 12V, or 5V from the EHU)

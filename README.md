# saab-93NG-bluetooth-aux
## (development branch)
A module to augment the Aux-In functionality of SAAB 93NG's (2002/3+), to add Bluetooth media playback and steering wheel media control support.

# Development branch goals
All the features of the master branch, but using alternative hardware modules.
Key hardware change involved using the internal CAN controller of the ESP32, with only a CAN transceiver module needed externally.

# Hardware
 - `ESP32` NodeMCU Development Board, **30-pin variant** (same as master branch)
 - `PCM5102` DAC Module
 - `TJA1050` CAN Transceiver Module
 - `VXO7805-500-M-TR DC-DC` 12V -> 5V Power Supply Module. 
   - This is in a ***4-SMD Module*** package, of which there are plenty alternatives to choose from.

![modules.jpg](./media/modules.jpg)

# Project Layout
- /esp32_a2dp_reciever  
  - PlatformIO project, the software flashed to the ESP32 module.

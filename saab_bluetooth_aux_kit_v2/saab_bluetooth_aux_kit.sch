EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4300 5000 0    50   Input ~ 10
GND
Text GLabel 4300 5100 0    50   Input ~ 10
5VDC
Text GLabel 5850 5100 2    50   Input ~ 10
3VDC
Text GLabel 5850 5000 2    50   Input ~ 10
GND
Text GLabel 5850 4400 2    50   Input ~ 0
SPI_CS
Text GLabel 5850 4300 2    50   Input ~ 0
SPI_SCLK
Text GLabel 5850 4200 2    50   Input ~ 0
SPI_MISO
Text GLabel 5850 3700 2    50   Input ~ 0
SPI_MOSI
Text GLabel 4300 4400 0    50   Input ~ 0
I2S_WSEL
Text GLabel 5850 3800 2    50   Input ~ 0
I2S_DIN
Text GLabel 4300 4500 0    50   Input ~ 0
I2S_BCLK
$Comp
L Connector:Barrel_Jack J1
U 1 1 5EB35333
P 2600 1300
F 0 "J1" H 2657 1625 50  0000 C CNN
F 1 "Barrel_Jack" H 2657 1534 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 2650 1260 50  0001 C CNN
F 3 "~" H 2650 1260 50  0001 C CNN
	1    2600 1300
	1    0    0    -1  
$EndComp
Text GLabel 7150 4550 0    50   Input ~ 0
I2S_WSEL
Text GLabel 7150 4450 0    50   Input ~ 0
I2S_DIN
Text GLabel 7150 4650 0    50   Input ~ 0
I2S_BCLK
$Comp
L Regulator_Linear:MCP1703A-3302_SOT223 U4
U 1 1 5EED9837
P 2750 2650
F 0 "U4" H 2750 2892 50  0000 C CNN
F 1 "MCP1703A-3302_SOT223" H 2750 2801 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2750 2850 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 2750 2600 50  0001 C CNN
	1    2750 2650
	1    0    0    -1  
$EndComp
Text GLabel 2900 1400 2    50   Input ~ 10
GND
Text GLabel 2900 1200 2    50   Input ~ 10
VIN_12V
Text GLabel 2450 2650 0    50   Input ~ 10
VIN_12V
Text GLabel 2750 2950 2    50   Input ~ 10
GND
Text GLabel 3050 2650 2    50   Input ~ 10
3.3VDC
Text GLabel 7150 3850 0    50   Input ~ 10
3.3VDC
Text GLabel 7150 3950 0    50   Input ~ 10
GND
Text GLabel 7150 4100 0    50   Input ~ 10
3.3VDC
$Comp
L Audio:PCM5100 U?
U 1 1 5F32AE7E
P 8650 4100
F 0 "U?" H 8650 4881 50  0000 C CNN
F 1 "PCM5100" H 8650 4790 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 8600 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/pcm5100.pdf" H 8600 4850 50  0001 C CNN
	1    8650 4100
	1    0    0    -1  
$EndComp
$Comp
L custom_symbols:MAX9720 U?
U 1 1 5F331B0A
P 9950 4100
F 0 "U?" H 9950 4815 50  0000 C CNN
F 1 "MAX9720" H 9950 4724 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 9800 4050 50  0001 C CNN
F 3 "" H 9800 4050 50  0001 C CNN
	1    9950 4100
	1    0    0    -1  
$EndComp
$Comp
L RF_Module:ESP32-WROOM-32U U?
U 1 1 5F332B27
P 5500 1650
F 0 "U?" H 5500 3231 50  0000 C CNN
F 1 "ESP32-WROOM-32U" H 5500 3140 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32U" H 5500 150 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5200 1700 50  0001 C CNN
	1    5500 1650
	1    0    0    -1  
$EndComp
$EndSCHEMATC

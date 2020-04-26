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
Text Notes 900  2550 0    118  ~ 24
This is a simple board which interconnects several off-the-shelf modules, \nto bring bluetooth audio to your SAAB 9-3!\n\nModules needed:\n- ESP32 NodeMCU Dev Board\n- MCP2515 SPI Interface \n- Adafruit I2S Stereo Interface\n- DC-DC converter by TDK-lambda.
$Comp
L custom_symbols:ESP32-WROOM-DEVKIT U2
U 1 1 5EA5CF06
P 5100 4250
F 0 "U2" H 5075 2982 118 0000 C CNN
F 1 "ESP32-WROOM-DEVKIT" H 5075 3175 118 0000 C CNN
F 2 "custom_footprints:ESP32-WROOM-30GPIO" H 5100 4250 118 0001 C CNN
F 3 "" H 5100 4250 118 0001 C CNN
	1    5100 4250
	-1   0    0    1   
$EndComp
$Comp
L custom_symbols:MCP2515_MODULE U3
U 1 1 5EA5DFB8
P 6800 3750
F 0 "U3" V 6846 3272 50  0000 R CNN
F 1 "MCP2515_MODULE" V 6755 3272 50  0000 R CNN
F 2 "" H 6750 3750 50  0001 C CNN
F 3 "" H 6750 3750 50  0001 C CNN
	1    6800 3750
	0    -1   -1   0   
$EndComp
$Comp
L custom_symbols:UDA1334A_BREAKOUT U4
U 1 1 5EA5F0CB
P 7200 5500
F 0 "U4" H 7878 5546 50  0000 L CNN
F 1 "UDA1334A_BREAKOUT" H 7878 5455 50  0000 L CNN
F 2 "custom_footprints:UDA1334A-Breakout" H 7200 5500 50  0001 C CNN
F 3 "" H 7200 5500 50  0001 C CNN
	1    7200 5500
	1    0    0    -1  
$EndComp
$Comp
L custom_symbols:CC3-0505SF-E U1
U 1 1 5EA608C5
P 3100 3700
F 0 "U1" H 3100 4125 50  0000 C CNN
F 1 "CC3-0505SF-E" H 3100 4034 50  0000 C CNN
F 2 "custom_footprints:CC3-1205SF-E" H 3100 3700 50  0001 C CNN
F 3 "" H 3100 3700 50  0001 C CNN
	1    3100 3700
	1    0    0    -1  
$EndComp
Text GLabel 3600 3500 2    50   Input ~ 10
5VDC
Text GLabel 3600 3700 2    50   Input ~ 10
GND
Text GLabel 5900 3800 2    50   Input ~ 10
GND
Text GLabel 5900 3700 2    50   Input ~ 10
5VDC
Text GLabel 7200 4150 3    50   Input ~ 10
5VDC
Text GLabel 7100 4150 3    50   Input ~ 10
GND
Text GLabel 4350 3700 0    50   Input ~ 10
3VDC
Text GLabel 4350 3800 0    50   Input ~ 10
GND
Text GLabel 7000 4150 3    50   Input ~ 0
SPI_CS
Text GLabel 4350 4400 0    50   Input ~ 0
SPI_CS
Text GLabel 6700 4150 3    50   Input ~ 0
SPI_SCLK
Text GLabel 4350 4500 0    50   Input ~ 0
SPI_SCLK
Text GLabel 6900 4150 3    50   Input ~ 0
SPI_MISO
Text GLabel 4350 4600 0    50   Input ~ 0
SPI_MISO
Text GLabel 4350 5100 0    50   Input ~ 0
SPI_MOSI
Text GLabel 6800 4150 3    50   Input ~ 0
SPI_MOSI
Text GLabel 6800 5950 3    50   Input ~ 10
3VDC
Text GLabel 7000 5950 3    50   Input ~ 10
GND
Text GLabel 7100 5950 3    50   Input ~ 0
I2S_WSEL
Text GLabel 5900 4400 2    50   Input ~ 0
I2S_WSEL
Text GLabel 7200 5950 3    50   Input ~ 0
I2S_DIN
Text GLabel 4350 5000 0    50   Input ~ 0
I2S_DIN
Text GLabel 7300 5950 3    50   Input ~ 0
I2S_BCLK
Text GLabel 5900 4300 2    50   Input ~ 0
I2S_BCLK
Text GLabel 7050 5050 1    50   Input ~ 10
GND
Text GLabel 7250 5050 1    50   Input ~ 10
GND
Text GLabel 7450 5050 2    50   Input ~ 10
3VDC
$EndSCHEMATC

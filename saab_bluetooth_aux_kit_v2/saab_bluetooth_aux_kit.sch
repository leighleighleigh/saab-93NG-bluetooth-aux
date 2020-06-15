EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L custom_symbols:ESP32-WROOM-DEVKIT U2
U 1 1 5EA5CF06
P 5100 4550
F 0 "U2" H 5075 3282 118 0000 C CNN
F 1 "ESP32-WROOM-30GPIO" H 5075 3475 118 0000 C CNN
F 2 "custom_footprints:ESP32-WROOM-30GPIO" H 5100 4550 118 0001 C CNN
F 3 "" H 5100 4550 118 0001 C CNN
	1    5100 4550
	1    0    0    -1  
$EndComp
Text GLabel 3450 1950 2    50   Input ~ 10
5VDC
Text GLabel 3450 2150 2    50   Input ~ 10
GND
Text GLabel 4300 5000 0    50   Input ~ 10
GND
Text GLabel 4300 5100 0    50   Input ~ 10
5VDC
Text GLabel 5850 5100 2    50   Input ~ 10
3VDC
Text GLabel 5850 5000 2    50   Input ~ 10
GND
Text GLabel 8150 1450 0    50   Input ~ 0
SPI_CS
Text GLabel 5850 4400 2    50   Input ~ 0
SPI_CS
Text GLabel 8150 1550 0    50   Input ~ 0
SPI_SCLK
Text GLabel 5850 4300 2    50   Input ~ 0
SPI_SCLK
Text GLabel 8150 1350 0    50   Input ~ 0
SPI_MISO
Text GLabel 5850 4200 2    50   Input ~ 0
SPI_MISO
Text GLabel 5850 3700 2    50   Input ~ 0
SPI_MOSI
Text GLabel 8150 1250 0    50   Input ~ 0
SPI_MOSI
Text GLabel 7300 5050 0    50   Input ~ 10
GND
Text GLabel 7300 3700 0    50   Input ~ 0
I2S_WSEL
Text GLabel 4300 4400 0    50   Input ~ 0
I2S_WSEL
Text GLabel 7300 3800 0    50   Input ~ 0
I2S_DIN
Text GLabel 5850 3800 2    50   Input ~ 0
I2S_DIN
Text GLabel 7300 3600 0    50   Input ~ 0
I2S_BCLK
Text GLabel 4300 4500 0    50   Input ~ 0
I2S_BCLK
Text GLabel 7300 4300 0    50   Input ~ 10
GND
Text GLabel 7300 4400 0    50   Input ~ 10
GND
$Comp
L Connector:Barrel_Jack J1
U 1 1 5EB35333
P 1750 2150
F 0 "J1" H 1807 2475 50  0000 C CNN
F 1 "Barrel_Jack" H 1807 2384 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 1800 2110 50  0001 C CNN
F 3 "~" H 1800 2110 50  0001 C CNN
	1    1750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2050 2450 2050
Wire Wire Line
	2450 2050 2450 1950
Wire Wire Line
	2050 2250 2150 2250
Wire Wire Line
	2150 2250 2150 2350
Wire Wire Line
	2150 2350 2450 2350
Wire Wire Line
	2450 2250 2450 2350
Wire Wire Line
	3450 2250 3450 2150
Wire Wire Line
	3050 1950 3450 1950
Wire Wire Line
	2450 2250 2750 2250
$Comp
L Regulator_Linear:MCP1703A-5002_SOT223 U1
U 1 1 5ED69E86
P 2750 1950
F 0 "U1" H 2750 2192 50  0000 C CNN
F 1 "MCP1703A-5002_SOT223" H 2750 2101 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2750 2150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 2750 1900 50  0001 C CNN
	1    2750 1950
	1    0    0    -1  
$EndComp
Connection ~ 2750 2250
Wire Wire Line
	2750 2250 3450 2250
$Comp
L Interface_CAN_LIN:MCP2515-xST U3
U 1 1 5ED6B86A
P 8750 1850
F 0 "U3" H 8750 2831 50  0000 C CNN
F 1 "MCP2515-xST" H 8750 2740 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 8750 950 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21801e.pdf" H 8850 1050 50  0001 C CNN
	1    8750 1850
	1    0    0    -1  
$EndComp
$Comp
L Interface_CAN_LIN:MCP2551-I-SN U5
U 1 1 5ED6D1AD
P 10300 1800
F 0 "U5" H 10300 2381 50  0000 C CNN
F 1 "MCP2551-I-P" H 10300 2290 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 10300 1300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/21667d.pdf" H 10300 1800 50  0001 C CNN
	1    10300 1800
	1    0    0    -1  
$EndComp
Text GLabel 8750 2650 2    50   Input ~ 10
GND
Text GLabel 10300 2200 2    50   Input ~ 10
GND
Text GLabel 8750 1050 2    50   Input ~ 10
5VDC
Text GLabel 10300 1400 2    50   Input ~ 10
5VDC
Wire Wire Line
	9350 1250 9600 1250
Wire Wire Line
	9600 1250 9600 1700
Wire Wire Line
	9600 1700 9800 1700
Wire Wire Line
	9800 1600 9550 1600
Wire Wire Line
	9550 1600 9550 1350
Wire Wire Line
	9550 1350 9350 1350
$Comp
L Device:R_Small R2
U 1 1 5ED6F29E
P 9800 2250
F 0 "R2" H 9859 2296 50  0000 L CNN
F 1 "10k" H 9859 2205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9800 2250 50  0001 C CNN
F 3 "~" H 9800 2250 50  0001 C CNN
	1    9800 2250
	1    0    0    -1  
$EndComp
Text GLabel 9800 2350 2    50   Input ~ 10
GND
Wire Wire Line
	9800 2150 9800 2000
$Comp
L Device:R_Small R1
U 1 1 5ED769A1
P 9350 2550
F 0 "R1" H 9409 2596 50  0000 L CNN
F 1 "10k" H 9409 2505 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9350 2550 50  0001 C CNN
F 3 "~" H 9350 2550 50  0001 C CNN
	1    9350 2550
	1    0    0    -1  
$EndComp
Text GLabel 9350 2650 2    50   Input ~ 10
5VDC
$Comp
L Device:Crystal Y1
U 1 1 5ED7BB04
P 7150 2100
F 0 "Y1" V 7104 2231 50  0000 L CNN
F 1 "Crystal" V 7195 2231 50  0000 L CNN
F 2 "Crystal:Crystal_SMD_SeikoEpson_MA505-2Pin_12.7x5.1mm" H 7150 2100 50  0001 C CNN
F 3 "~" H 7150 2100 50  0001 C CNN
	1    7150 2100
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5ED7C91E
P 6850 2250
F 0 "C2" V 6621 2250 50  0000 C CNN
F 1 "27pF" V 6712 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 2250 50  0001 C CNN
F 3 "~" H 6850 2250 50  0001 C CNN
	1    6850 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	6950 1950 7150 1950
Wire Wire Line
	7150 2250 6950 2250
Wire Wire Line
	6750 1950 6700 1950
Wire Wire Line
	6700 1950 6700 2100
Wire Wire Line
	6700 2250 6750 2250
Wire Wire Line
	6700 2100 6650 2100
Connection ~ 6700 2100
Wire Wire Line
	6700 2100 6700 2250
Text GLabel 6650 2100 0    50   Input ~ 10
GND
Wire Wire Line
	7450 2050 7450 1950
Wire Wire Line
	7450 1950 7150 1950
Wire Wire Line
	7450 2050 8150 2050
Connection ~ 7150 1950
Wire Wire Line
	7150 2250 7600 2250
Wire Wire Line
	7600 2250 7600 2150
Wire Wire Line
	7600 2150 8150 2150
Connection ~ 7150 2250
Wire Notes Line
	6350 750  10900 750 
Wire Notes Line
	10900 750  10900 2800
Wire Notes Line
	10900 2800 6350 2800
Wire Notes Line
	6350 2800 6350 750 
Text Notes 6400 850  0    50   ~ 0
CAN INTERFACE
$Sheet
S 7300 3450 2000 1700
U 5EE7716E
F0 "UDA1334 I2S" 50
F1 "uda1334_submodule.sch" 50
F2 "BCK" I L 7300 3600 50 
F3 "WS" I L 7300 3700 50 
F4 "DATAIN" I L 7300 3800 50 
F5 "PLL0" I L 7300 3900 50 
F6 "SYSCLK_IN" I L 7300 4000 50 
F7 "DEEM" I L 7300 4100 50 
F8 "MUTE" I L 7300 4200 50 
F9 "SFOR0" I L 7300 4300 50 
F10 "SFOR1" I L 7300 4400 50 
F11 "GND" I L 7300 5050 50 
F12 "VIN" I L 7300 4950 50 
$EndSheet
Text GLabel 7300 4950 0    50   Input ~ 10
VIN_12V
Text GLabel 2150 2050 1    50   Input ~ 10
VIN_12V
$Comp
L Device:C_Small C1
U 1 1 5ED7C478
P 6850 1950
F 0 "C1" V 6621 1950 50  0000 C CNN
F 1 "27pF" V 6712 1950 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1950 50  0001 C CNN
F 3 "~" H 6850 1950 50  0001 C CNN
	1    6850 1950
	0    1    1    0   
$EndComp
$EndSCHEMATC

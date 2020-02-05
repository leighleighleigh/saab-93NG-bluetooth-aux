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
$Comp
L RF_Module:ESP32-WROOM-32D U1
U 1 1 5E395DE5
P 2500 4550
F 0 "U1" H 2500 6131 50  0000 C CNN
F 1 "ESP32-WROOM-32D" H 2500 6040 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 2500 3050 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 2200 4600 50  0001 C CNN
	1    2500 4550
	1    0    0    -1  
$EndComp
$Comp
L custom_symbols:MC33897 U3
U 1 1 5E397DCA
P 6850 5350
F 0 "U3" H 6850 5450 50  0000 C CNN
F 1 "MC33897" H 6850 5350 50  0000 C CNN
F 2 "custom_footprints:MC33897" H 6900 5300 50  0001 C CNN
F 3 "" H 6900 5300 50  0001 C CNN
	1    6850 5350
	1    0    0    -1  
$EndComp
$Comp
L custom_symbols:BM62SPKS1MC2-0001AA U?
U 1 1 5E39ABB5
P 7550 3200
F 0 "U?" H 7575 4375 50  0000 C CNN
F 1 "BM62SPKS1MC2-0001AA" H 7575 4284 50  0000 C CNN
F 2 "" H 7550 3200 50  0001 C CNN
F 3 "" H 7550 3200 50  0001 C CNN
	1    7550 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5E3A7C97
P 1750 2000
F 0 "J?" V 1812 2044 50  0000 L CNN
F 1 "12V INPUT" V 1903 2044 50  0000 L CNN
F 2 "" H 1750 2000 50  0001 C CNN
F 3 "~" H 1750 2000 50  0001 C CNN
	1    1750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 2000 2200 2000
Wire Wire Line
	2200 2000 2200 1800
$Comp
L Device:C_Small C?
U 1 1 5E3AE258
P 3050 1900
F 0 "C?" V 2821 1900 50  0000 C CNN
F 1 "0.1uF" V 2912 1900 50  0000 C CNN
F 2 "" H 3050 1900 50  0001 C CNN
F 3 "~" H 3050 1900 50  0001 C CNN
	1    3050 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2000 3050 2100
Text GLabel 3050 1800 2    50   Input ~ 0
3.3V
Text GLabel 3050 2100 2    50   Input ~ 0
GND
Text GLabel 1450 3350 0    50   Input ~ 0
3.3V
Text GLabel 2500 3150 0    50   Input ~ 0
3.3V
Text GLabel 2500 5950 0    50   Input ~ 0
GND
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 5E3BB7CF
P 3350 2800
F 0 "J?" V 3412 2944 50  0000 L CNN
F 1 "ESP32 UART" V 3503 2944 50  0000 L CNN
F 2 "" H 3350 2800 50  0001 C CNN
F 3 "~" H 3350 2800 50  0001 C CNN
	1    3350 2800
	0    1    1    0   
$EndComp
Text GLabel 3250 3000 0    50   Input ~ 0
GND
Wire Wire Line
	3350 3000 3350 3450
Wire Wire Line
	3350 3450 3100 3450
Wire Wire Line
	3450 3000 3450 3650
Wire Wire Line
	3450 3650 3100 3650
$Comp
L Connector:Conn_01x04_Male J?
U 1 1 5E3BD260
P 4350 2800
F 0 "J?" V 4412 2944 50  0000 L CNN
F 1 "ESP32 JTAG" V 4503 2944 50  0000 L CNN
F 2 "" H 4350 2800 50  0001 C CNN
F 3 "~" H 4350 2800 50  0001 C CNN
	1    4350 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 4150 4450 4150
Wire Wire Line
	3100 3950 4350 3950
Wire Wire Line
	3100 4050 4250 4050
Wire Wire Line
	3100 4250 4150 4250
$Comp
L Switch:SW_SPDT SW?
U 1 1 5E3C03CA
P 3750 3350
F 0 "SW?" H 3750 3635 50  0000 C CNN
F 1 "ESP32 BOOT OPTION" H 3750 3544 50  0000 C CNN
F 2 "" H 3750 3350 50  0001 C CNN
F 3 "~" H 3750 3350 50  0001 C CNN
	1    3750 3350
	1    0    0    -1  
$EndComp
Text GLabel 3950 3450 3    50   Input ~ 0
GND
Wire Wire Line
	3100 3350 3550 3350
$Comp
L Device:R_Small R?
U 1 1 5E3C4F43
P 4150 3300
F 0 "R?" H 4209 3346 50  0000 L CNN
F 1 "100" H 4209 3255 50  0000 L CNN
F 2 "" H 4150 3300 50  0001 C CNN
F 3 "~" H 4150 3300 50  0001 C CNN
	1    4150 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E3C64CE
P 4250 3550
F 0 "R?" H 4309 3596 50  0000 L CNN
F 1 "100" H 4309 3505 50  0000 L CNN
F 2 "" H 4250 3550 50  0001 C CNN
F 3 "~" H 4250 3550 50  0001 C CNN
	1    4250 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E3C64D8
P 4350 3750
F 0 "R?" H 4409 3796 50  0000 L CNN
F 1 "100" H 4409 3705 50  0000 L CNN
F 2 "" H 4350 3750 50  0001 C CNN
F 3 "~" H 4350 3750 50  0001 C CNN
	1    4350 3750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E3C64E2
P 4450 4000
F 0 "R?" H 4509 4046 50  0000 L CNN
F 1 "100" H 4509 3955 50  0000 L CNN
F 2 "" H 4450 4000 50  0001 C CNN
F 3 "~" H 4450 4000 50  0001 C CNN
	1    4450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3200 4150 3000
Wire Wire Line
	4250 3000 4250 3450
Wire Wire Line
	4350 3000 4350 3650
Wire Wire Line
	4450 3000 4450 3900
Wire Wire Line
	4450 4150 4450 4100
Wire Wire Line
	4350 3950 4350 3850
Wire Wire Line
	4250 4050 4250 3650
Wire Wire Line
	4150 4250 4150 3400
$Comp
L Device:R_Small R?
U 1 1 5E3CF5F4
P 1650 3350
F 0 "R?" V 1454 3350 50  0000 C CNN
F 1 "1k" V 1545 3350 50  0000 C CNN
F 2 "" H 1650 3350 50  0001 C CNN
F 3 "~" H 1650 3350 50  0001 C CNN
	1    1650 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 3350 1900 3350
Wire Wire Line
	1550 3350 1450 3350
$Comp
L custom_symbols:BA33DD0T U?
U 1 1 5E3D3413
P 2500 1500
F 0 "U?" V 2488 1322 50  0000 R CNN
F 1 "BA33DD0T" V 2397 1322 50  0000 R CNN
F 2 "" H 2500 1500 50  0001 C CNN
F 3 "https://au.mouser.com/datasheet/2/348/baxxdd0-e-208708.pdf" H 2500 1500 50  0001 C CNN
	1    2500 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 1800 2400 1800
Wire Wire Line
	2600 1800 3050 1800
Wire Wire Line
	2500 1800 2500 2100
Wire Wire Line
	1950 2100 2500 2100
Wire Wire Line
	2500 2100 3050 2100
Connection ~ 2500 2100
Wire Notes Line
	1650 1150 3350 1150
Wire Notes Line
	3350 1150 3350 2200
Wire Notes Line
	3350 2200 1650 2200
Wire Notes Line
	1650 2200 1650 1150
Text Notes 1700 1250 0    50   ~ 0
POWER SUPPLY
Text Notes 1700 1450 0    50   ~ 0
12V TO 3.3V\n2A OUTPUT
Wire Notes Line
	1100 2600 5100 2600
Wire Notes Line
	5100 2600 5100 6100
Wire Notes Line
	5100 6100 1100 6100
Wire Notes Line
	1100 6100 1100 2600
Text Notes 1150 2900 0    50   ~ 0
MCU\nESP32 BASED\nARDUINO-COMPATIBLE
Text GLabel 3200 4450 2    50   Input ~ 0
MC33_TX
Text GLabel 3200 4350 2    50   Input ~ 0
MC33_RX
Wire Wire Line
	3100 4350 3200 4350
Wire Wire Line
	3100 4450 3200 4450
Text GLabel 3250 5450 2    50   Input ~ 0
BM62_TX
Text GLabel 3250 5350 2    50   Input ~ 0
BM62_RX
Wire Wire Line
	3100 5350 3250 5350
Wire Wire Line
	3100 5450 3250 5450
Text GLabel 5700 5500 0    50   Input ~ 0
MC33_TX
Text GLabel 5700 5600 0    50   Input ~ 0
MC33_RX
Text GLabel 3100 4550 2    50   Input ~ 0
MC33_MODE0
Text GLabel 3100 4650 2    50   Input ~ 0
MC33_MODE1
Text GLabel 6250 5050 0    50   Input ~ 0
MC33_MODE0
Text GLabel 6250 5150 0    50   Input ~ 0
MC33_MODE1
Text GLabel 5900 5900 0    50   Input ~ 0
3.3V
$Comp
L Device:R_Small R?
U 1 1 5E3FEA50
P 6150 5700
F 0 "R?" H 6209 5746 50  0000 L CNN
F 1 "2.7k" H 6209 5655 50  0000 L CNN
F 2 "" H 6150 5700 50  0001 C CNN
F 3 "~" H 6150 5700 50  0001 C CNN
	1    6150 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E3FEC80
P 5900 5600
F 0 "R?" H 5841 5554 50  0000 R CNN
F 1 "10k" H 5841 5645 50  0000 R CNN
F 2 "" H 5900 5600 50  0001 C CNN
F 3 "~" H 5900 5600 50  0001 C CNN
	1    5900 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 5600 6150 5600
Wire Wire Line
	6150 5600 5700 5600
Connection ~ 6150 5600
Wire Wire Line
	5700 5500 5900 5500
Wire Wire Line
	5900 5500 6250 5500
Connection ~ 5900 5500
Wire Wire Line
	5900 5700 5900 5900
Wire Wire Line
	5900 5900 6150 5900
Wire Wire Line
	6150 5900 6150 5800
Text GLabel 7700 5700 2    50   Input ~ 0
3.3V
Wire Wire Line
	6700 5850 6800 5850
Connection ~ 6800 5850
Wire Wire Line
	6800 5850 6900 5850
Text Notes 3700 4550 0    50   ~ 0
NOTE: USING ESP32 \nCAN CONTROLLER (SJA1000)
$Comp
L Diode:MMBZxx D?
U 1 1 5E40B3B3
P 8850 5250
F 0 "D?" H 9037 5296 50  0000 L CNN
F 1 "MMBZ15VDLT1" H 9037 5205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9000 5150 50  0001 L CNN
F 3 "http://www.onsemi.com/pub/Collateral/MMBZ5V6ALT1-D.PDF" V 8750 5250 50  0001 C CNN
	1    8850 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:D D?
U 1 1 5E40BAD4
P 7650 5450
F 0 "D?" V 7604 5529 50  0000 L CNN
F 1 "D" V 7695 5529 50  0000 L CNN
F 2 "" H 7650 5450 50  0001 C CNN
F 3 "~" H 7650 5450 50  0001 C CNN
	1    7650 5450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5E40C9A1
P 7850 5200
F 0 "R?" H 7909 5246 50  0000 L CNN
F 1 "6.49k" H 7909 5155 50  0000 L CNN
F 2 "" H 7850 5200 50  0001 C CNN
F 3 "~" H 7850 5200 50  0001 C CNN
	1    7850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5050 7850 5050
Wire Wire Line
	7850 5050 7850 5100
Wire Wire Line
	7850 5300 7850 5400
Wire Wire Line
	7850 5400 7500 5400
$Comp
L Device:L_Small L?
U 1 1 5E40E59B
P 7950 5050
F 0 "L?" V 8135 5050 50  0000 C CNN
F 1 "47uH" V 8044 5050 50  0000 C CNN
F 2 "" H 7950 5050 50  0001 C CNN
F 3 "~" H 7950 5050 50  0001 C CNN
	1    7950 5050
	0    -1   -1   0   
$EndComp
Connection ~ 7850 5050
$Comp
L Device:R_Small R?
U 1 1 5E40EAF0
P 7950 4750
F 0 "R?" V 8146 4750 50  0000 C CNN
F 1 "1k" V 8055 4750 50  0000 C CNN
F 2 "" H 7950 4750 50  0001 C CNN
F 3 "~" H 7950 4750 50  0001 C CNN
	1    7950 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7850 4750 7850 5050
Wire Wire Line
	8050 4750 8050 5050
$Comp
L Device:C_Small C?
U 1 1 5E410D36
P 7550 4850
F 0 "C?" H 7458 4804 50  0000 R CNN
F 1 "0.1uF" H 7458 4895 50  0000 R CNN
F 2 "" H 7550 4850 50  0001 C CNN
F 3 "~" H 7550 4850 50  0001 C CNN
	1    7550 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 4750 7850 4750
Connection ~ 7850 4750
Wire Wire Line
	7550 4950 7550 5300
Wire Wire Line
	7550 5300 7500 5300
Wire Wire Line
	7550 5300 7650 5300
Connection ~ 7550 5300
Wire Wire Line
	7500 5700 7650 5700
Wire Wire Line
	7650 5600 7650 5700
Wire Wire Line
	7650 5700 7700 5700
Connection ~ 7650 5700
Text GLabel 7550 5850 3    50   Input ~ 0
GND
Wire Wire Line
	7500 5600 7550 5600
Wire Wire Line
	7550 5600 7550 5850
Wire Wire Line
	7550 5850 6900 5850
Connection ~ 6900 5850
$Comp
L Device:C_Small C?
U 1 1 5E42115E
P 8250 5150
F 0 "C?" H 8158 5104 50  0000 R CNN
F 1 "47pF" H 8158 5195 50  0000 R CNN
F 2 "" H 8250 5150 50  0001 C CNN
F 3 "~" H 8250 5150 50  0001 C CNN
	1    8250 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	8050 5050 8250 5050
Connection ~ 8050 5050
Wire Wire Line
	8250 5250 8250 5850
Wire Wire Line
	8250 5850 7550 5850
Connection ~ 7550 5850
Connection ~ 8250 5050
Wire Wire Line
	8250 5050 8750 5050
Connection ~ 8750 5050
Wire Wire Line
	8750 5050 8950 5050
Wire Wire Line
	8850 5450 8850 5850
Wire Wire Line
	8850 5850 8250 5850
Connection ~ 8250 5850
Wire Wire Line
	8950 5050 8950 4900
Connection ~ 8950 5050
Text GLabel 8950 4900 0    50   Input ~ 0
SW_CAN
Wire Notes Line
	5200 6100 9650 6100
Wire Notes Line
	9650 6100 9650 4450
Wire Notes Line
	9650 4450 5200 4450
Wire Notes Line
	5200 4450 5200 6100
Text Notes 5250 4650 0    50   ~ 0
Single Wire CAN Transceiver\n33.33 kbps
Text GLabel 9000 3350 2    50   Input ~ 0
BM62_RX
Text GLabel 9000 3450 2    50   Input ~ 0
BM62_TX
Text GLabel 3250 5150 2    50   Input ~ 0
BM62_MCU_WAKE
Text GLabel 3250 5250 2    50   Input ~ 0
BM62_BT_WAKE
Wire Wire Line
	3100 5150 3250 5150
Wire Wire Line
	3250 5250 3100 5250
Text GLabel 6650 2250 0    50   Input ~ 0
BM62_MCU_WAKE
Text GLabel 8250 2750 2    50   Input ~ 0
BM62_BT_WAKE
Text GLabel 8250 2450 2    50   Input ~ 0
GND
Text GLabel 8250 3850 2    50   Input ~ 0
GND
$Comp
L Connector:AudioJack3 J?
U 1 1 5E43F21A
P 5600 2950
F 0 "J?" H 5582 3275 50  0000 C CNN
F 1 "AUX OUT" H 5582 3184 50  0000 C CNN
F 2 "" H 5600 2950 50  0001 C CNN
F 3 "~" H 5600 2950 50  0001 C CNN
	1    5600 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3050 6900 3050
Wire Wire Line
	5800 2850 5900 2850
Wire Wire Line
	5900 2850 5900 3000
Wire Wire Line
	5900 3000 6900 3000
Wire Wire Line
	6900 3000 6900 2950
Wire Wire Line
	6900 2850 6850 2850
Wire Wire Line
	6850 2850 6850 2950
Wire Wire Line
	6850 2950 5800 2950
$Comp
L Connector:AudioJack3 J?
U 1 1 5E4599C5
P 5600 3550
F 0 "J?" H 5582 3875 50  0000 C CNN
F 1 "MIC IN" H 5582 3784 50  0000 C CNN
F 2 "" H 5600 3550 50  0001 C CNN
F 3 "~" H 5600 3550 50  0001 C CNN
	1    5600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3550 5800 3650
Wire Wire Line
	5800 3450 6750 3450
Wire Wire Line
	6750 3450 6750 3350
Wire Wire Line
	6750 3350 6900 3350
Wire Wire Line
	6900 3250 6700 3250
Wire Wire Line
	6700 3250 6700 3550
Wire Wire Line
	6700 3550 5800 3550
Connection ~ 5800 3550
$Comp
L Device:C_Small C?
U 1 1 5E45FD4C
P 6500 3500
F 0 "C?" V 6729 3500 50  0000 C CNN
F 1 "4.7uF" V 6638 3500 50  0000 C CNN
F 2 "" H 6500 3500 50  0001 C CNN
F 3 "~" H 6500 3500 50  0001 C CNN
	1    6500 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 3450 6800 3500
Wire Wire Line
	6800 3500 6600 3500
Wire Wire Line
	6800 3450 6900 3450
Text GLabel 6400 3500 0    50   Input ~ 0
GND
$Comp
L Connector:TestPoint TP?
U 1 1 5E46516A
P 9000 3350
F 0 "TP?" H 9058 3468 50  0000 L CNN
F 1 "BM62_TX" H 9058 3377 50  0000 L CNN
F 2 "" H 9200 3350 50  0001 C CNN
F 3 "~" H 9200 3350 50  0001 C CNN
	1    9000 3350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E46A6AB
P 9000 3450
F 0 "TP?" H 8942 3476 50  0000 R CNN
F 1 "BM62_RX" H 8942 3567 50  0000 R CNN
F 2 "" H 9200 3450 50  0001 C CNN
F 3 "~" H 9200 3450 50  0001 C CNN
	1    9000 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	9000 3350 8250 3350
Wire Wire Line
	8250 3450 9000 3450
$Comp
L Connector:TestPoint TP?
U 1 1 5E47DF3A
P 6700 2250
F 0 "TP?" H 6758 2368 50  0000 L CNN
F 1 "TX_COND" H 6758 2277 50  0000 L CNN
F 2 "" H 6900 2250 50  0001 C CNN
F 3 "~" H 6900 2250 50  0001 C CNN
	1    6700 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 2250 6700 2250
Connection ~ 6700 2250
Wire Wire Line
	6700 2250 6650 2250
$Comp
L Connector:TestPoint TP?
U 1 1 5E480A36
P 6700 3950
F 0 "TP?" V 6650 3950 50  0000 C CNN
F 1 "FWD" V 6750 3950 50  0000 C CNN
F 2 "" H 6900 3950 50  0001 C CNN
F 3 "~" H 6900 3950 50  0001 C CNN
	1    6700 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6700 3950 6900 3950
$Comp
L Connector:TestPoint TP?
U 1 1 5E483497
P 8350 3150
F 0 "TP?" V 8304 3338 50  0000 L CNN
F 1 "PLAY/PAUSE" V 8395 3338 50  0000 L CNN
F 2 "" H 8550 3150 50  0001 C CNN
F 3 "~" H 8550 3150 50  0001 C CNN
	1    8350 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 3150 8350 3150
$Comp
L Connector:TestPoint TP?
U 1 1 5E4863CC
P 8250 3250
F 0 "TP?" V 8204 3438 50  0000 L CNN
F 1 "REV" V 8295 3438 50  0000 L CNN
F 2 "" H 8450 3250 50  0001 C CNN
F 3 "~" H 8450 3250 50  0001 C CNN
	1    8250 3250
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP?
U 1 1 5E486CEC
P 8450 3550
F 0 "TP?" V 8404 3738 50  0000 L CNN
F 1 "VOL-" V 8495 3738 50  0000 L CNN
F 2 "" H 8650 3550 50  0001 C CNN
F 3 "~" H 8650 3550 50  0001 C CNN
	1    8450 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 3550 8450 3550
$Comp
L Connector:TestPoint TP?
U 1 1 5E48E99A
P 8250 3650
F 0 "TP?" V 8204 3838 50  0000 L CNN
F 1 "VOL+" V 8295 3838 50  0000 L CNN
F 2 "" H 8450 3650 50  0001 C CNN
F 3 "~" H 8450 3650 50  0001 C CNN
	1    8250 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	6900 3650 6900 3700
$Comp
L Device:R_Small R?
U 1 1 5E4A3DEC
P 6800 3750
F 0 "R?" V 6604 3750 50  0000 C CNN
F 1 "1k" V 6695 3750 50  0000 C CNN
F 2 "" H 6800 3750 50  0001 C CNN
F 3 "~" H 6800 3750 50  0001 C CNN
	1    6800 3750
	0    1    1    0   
$EndComp
Text GLabel 6700 3750 0    50   Input ~ 0
3.3V
Text GLabel 8250 2250 2    50   Input ~ 0
3.3V
$Comp
L Device:LED D?
U 1 1 5E4B1E05
P 9100 2850
F 0 "D?" H 9093 3066 50  0000 C CNN
F 1 "LED" H 9093 2975 50  0000 C CNN
F 2 "" H 9100 2850 50  0001 C CNN
F 3 "~" H 9100 2850 50  0001 C CNN
	1    9100 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D?
U 1 1 5E4B28C1
P 8650 2950
F 0 "D?" H 8643 3166 50  0000 C CNN
F 1 "LED" H 8643 3075 50  0000 C CNN
F 2 "" H 8650 2950 50  0001 C CNN
F 3 "~" H 8650 2950 50  0001 C CNN
	1    8650 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2550 9250 2550
Wire Wire Line
	9250 2550 9250 2850
Wire Wire Line
	9250 2850 9250 2950
Wire Wire Line
	9250 2950 8800 2950
Connection ~ 9250 2850
Wire Wire Line
	8950 2850 8250 2850
Wire Wire Line
	8250 2950 8500 2950
Wire Notes Line
	5200 4350 9650 4350
Wire Notes Line
	9650 4350 9650 1900
Wire Notes Line
	9650 1900 5200 1900
Wire Notes Line
	5200 1900 5200 4350
Text Notes 5250 2000 0    50   ~ 0
BLUETOOTH AUDIO MODULE
$EndSCHEMATC

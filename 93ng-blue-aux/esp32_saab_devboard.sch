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
L 93ng-blue-aux-rescue:ESP32-WROOM-32D-RF_Module U1
U 1 1 5E395DE5
P 2150 4600
F 0 "U1" H 2150 4600 50  0000 C CNN
F 1 "ESP32-WROOM-32D" V 1600 3700 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32" H 2150 3100 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 1850 4650 50  0001 C CNN
F 4 "ESP32-WROOM-32D" H 2150 4600 50  0001 C CNN "manf#"
	1    2150 4600
	1    0    0    -1  
$EndComp
Text GLabel 2150 3200 1    50   Input ~ 0
3.3V
Text GLabel 2150 6000 0    50   Input ~ 0
GND
Text GLabel 3150 3750 0    50   Input ~ 0
GND
Text Notes 1150 1500 0    50   ~ 0
POWER SUPPLY
Text Notes 1150 1700 0    50   ~ 0
12V TO 3.3V LDO\n1A OUTPUT
Text Notes 1150 2900 0    50   ~ 0
MCU\nESP32 BASED\nARDUINO-COMPATIBLE
Text Notes 3450 6000 1    50   ~ 0
NOTE: USING ESP32 \nCAN CONTROLLER (SJA1000)
Text GLabel 2900 3400 2    50   Input ~ 0
ESP32_BOOT
$Comp
L Interface_USB:CP2102N-A01-GQFN28 U5
U 1 1 5E52271F
P 7750 2950
F 0 "U5" V 7200 1800 50  0000 C CNN
F 1 "CP2102N-A01-GQFN28" V 7300 2200 50  0000 C CNN
F 2 "Package_DFN_QFN:QFN-28-1EP_5x5mm_P0.5mm_EP3.35x3.35mm" H 8200 1750 50  0001 L CNN
F 3 "https://www.silabs.com/documents/public/data-sheets/cp2102n-datasheet.pdf" H 7800 2200 50  0001 C CNN
F 4 "CP2102N-A02-GQFN24" V 7750 2950 50  0001 C CNN "manf#"
	1    7750 2950
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 J3
U 1 1 5E53E2D6
P 5900 2000
F 0 "J3" V 5350 1950 50  0000 L CNN
F 1 "USB_C_Receptacle_USB2.0" V 5450 1500 50  0000 L CNN
F 2 "Connector_USB:USB_C_Receptacle_Amphenol_12401610E4-2A" H 6050 2000 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 6050 2000 50  0001 C CNN
F 4 "12401610E4#2A" V 5900 2000 50  0001 C CNN "manf#"
	1    5900 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 2600 6000 2600
Wire Wire Line
	5700 2600 5800 2600
Text GLabel 5950 2600 3    50   Input ~ 10
USB_D-
Text GLabel 5750 2600 3    50   Input ~ 10
USB_D+
Text GLabel 7250 2350 0    50   Input ~ 10
USB_D+
Text GLabel 7250 2450 0    50   Input ~ 10
USB_D-
Text GLabel 6500 2900 3    50   Input ~ 10
USB_VBUS
Text GLabel 7200 2250 0    50   Input ~ 10
USB_VBUS
Text GLabel 6200 2600 3    50   Input ~ 10
USB_CC2
Text GLabel 6300 2600 3    50   Input ~ 10
USB_CC1
Text GLabel 5000 2000 0    50   Input ~ 0
GND
Text GLabel 5000 1700 0    50   Input ~ 0
GND
Text GLabel 7750 4250 0    50   Input ~ 0
GND
Wire Wire Line
	3100 2150 3250 2150
Connection ~ 2400 2150
Wire Wire Line
	2400 2150 2500 2150
Wire Wire Line
	2800 2450 3250 2450
Connection ~ 2800 2450
Wire Wire Line
	2400 2450 2800 2450
$Comp
L Device:CP C1
U 1 1 5E4E29F0
P 2400 2300
F 0 "C1" H 2350 2350 50  0000 L CNN
F 1 "10uF" H 2300 2250 50  0000 L CNN
F 2 "Capacitor_SMD:C_2010_5025Metric_Pad1.52x2.65mm_HandSolder" H 2438 2150 50  0001 C CNN
F 3 "~" H 2400 2300 50  0001 C CNN
	1    2400 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 2150 2250 2150
Connection ~ 2400 2450
$Comp
L Regulator_Linear:NCP1117-3.3_SOT223 U2
U 1 1 5E527169
P 2800 2150
F 0 "U2" H 2800 2392 50  0000 C CNN
F 1 "NCP1117-3.3_SOT223" H 2800 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 2800 2350 50  0001 C CNN
F 3 "http://www.onsemi.com/pub_link/Collateral/NCP1117-D.PDF" H 2900 1900 50  0001 C CNN
	1    2800 2150
	1    0    0    -1  
$EndComp
Text GLabel 3250 2450 2    50   Input ~ 0
GND
Text GLabel 3250 2150 2    50   Input ~ 0
3.3V
$Comp
L Device:C_Small C2
U 1 1 5E3AE258
P 3250 2300
F 0 "C2" H 3250 2350 50  0000 C CNN
F 1 "10uF" H 3250 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 2300 50  0001 C CNN
F 3 "~" H 3250 2300 50  0001 C CNN
	1    3250 2300
	1    0    0    -1  
$EndComp
Text GLabel 1700 2150 0    50   Input ~ 10
USB_VBUS
Wire Wire Line
	1600 2350 1750 2350
Wire Wire Line
	2150 2250 2250 2250
Wire Wire Line
	2250 2250 2250 2150
Wire Wire Line
	1600 2450 2400 2450
Wire Wire Line
	1700 2150 1750 2150
$Comp
L Switch:SW_SPDT SW1
U 1 1 5E560A61
P 1950 2250
F 0 "SW1" H 1950 1925 50  0000 C CNN
F 1 "PWR IN SELECT" H 1950 2016 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1950 2250 50  0001 C CNN
F 3 "~" H 1950 2250 50  0001 C CNN
	1    1950 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 5E577671
P 2800 1750
F 0 "R2" V 2593 1750 50  0000 C CNN
F 1 "2k" V 2684 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2730 1750 50  0001 C CNN
F 3 "~" H 2800 1750 50  0001 C CNN
	1    2800 1750
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5E5753FB
P 3100 1750
F 0 "D2" H 3093 1495 50  0000 C CNN
F 1 "PWR_LED" H 3093 1586 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3100 1750 50  0001 C CNN
F 3 "~" H 3100 1750 50  0001 C CNN
	1    3100 1750
	-1   0    0    1   
$EndComp
Text GLabel 2650 1750 0    50   Input ~ 0
3.3V
Text GLabel 3250 1750 2    50   Input ~ 0
GND
Wire Notes Line
	1100 1400 1100 6100
$Comp
L Diode:1N5819 D4
U 1 1 5E5B490D
P 6500 2750
F 0 "D4" H 6650 2650 50  0000 R CNN
F 1 "1N5819" H 6450 2650 50  0000 R CNN
F 2 "Diode_SMD:D_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6500 2575 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 6500 2750 50  0001 C CNN
	1    6500 2750
	0    -1   -1   0   
$EndComp
Wire Notes Line
	3550 1400 3550 6100
Wire Notes Line
	1100 2600 3550 2600
Text GLabel 1550 3400 1    50   Input ~ 0
ESP32_EN
Wire Wire Line
	2750 3500 2900 3500
Wire Wire Line
	2900 3500 2900 3850
Wire Wire Line
	2900 3850 3150 3850
Wire Wire Line
	2750 3700 2850 3700
Wire Wire Line
	2850 3700 2850 3900
Wire Wire Line
	2850 3900 3150 3900
Wire Wire Line
	3150 3900 3150 3950
Text Notes 4700 2950 0    50   ~ 0
USB3.1 CC PULLDOWNS
Text Notes 4700 1500 0    50   ~ 0
USB TYPE C PORT
Text Notes 6750 1500 0    50   ~ 0
USB-UART INTERFACE
Text GLabel 8250 2350 2    50   Input ~ 0
DTR
Text GLabel 8250 1950 2    50   Input ~ 0
RTS
Wire Notes Line
	4650 4450 4650 1400
Text GLabel 2900 3500 2    50   Input ~ 0
ESP32_TX
Text GLabel 3150 3950 1    50   Input ~ 0
ESP32_RX
Text GLabel 8450 2150 2    50   Input ~ 0
ESP32_RX
Text GLabel 8250 2050 2    50   Input ~ 0
ESP32_TX
Wire Wire Line
	3250 2200 3250 2150
Wire Wire Line
	3250 2400 3250 2450
$Comp
L Device:C_Small C6
U 1 1 5E7E4E63
P 2300 3200
F 0 "C6" V 2350 3200 50  0000 C CNN
F 1 "10uF" V 2200 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2300 3200 50  0001 C CNN
F 3 "~" H 2300 3200 50  0001 C CNN
	1    2300 3200
	0    1    1    0   
$EndComp
Text GLabel 2450 3200 1    50   Input ~ 0
GND
$Comp
L Device:C_Small C8
U 1 1 5E7EA5F0
P 7750 1550
F 0 "C8" H 7650 1550 50  0000 C CNN
F 1 "10uF" H 7600 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7750 1550 50  0001 C CNN
F 3 "~" H 7750 1550 50  0001 C CNN
	1    7750 1550
	-1   0    0    1   
$EndComp
Text GLabel 7000 2100 0    50   Input ~ 0
GND
Text GLabel 7650 1650 0    50   Input ~ 0
3.3V
Wire Wire Line
	7750 1650 7650 1650
Connection ~ 7750 1650
$Comp
L Device:C_Small C7
U 1 1 5E808D1B
P 7100 2100
F 0 "C7" V 7200 2100 50  0000 C CNN
F 1 "10uF" V 7050 2100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7100 2100 50  0001 C CNN
F 3 "~" H 7100 2100 50  0001 C CNN
	1    7100 2100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7200 2250 7250 2250
$Comp
L Device:R_Small R12
U 1 1 5E80E7BC
P 8350 2150
F 0 "R12" V 8350 2150 50  0000 C CNN
F 1 "470" V 8400 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8350 2150 50  0001 C CNN
F 3 "~" H 8350 2150 50  0001 C CNN
	1    8350 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7200 2100 7200 2250
Text GLabel 7750 1450 2    50   Input ~ 0
GND
$Comp
L Device:R_Small R11
U 1 1 5E8233FF
P 7250 1950
F 0 "R11" H 7350 1850 50  0000 C CNN
F 1 "1K" H 7350 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7250 1950 50  0001 C CNN
F 3 "~" H 7250 1950 50  0001 C CNN
	1    7250 1950
	-1   0    0    1   
$EndComp
Text GLabel 7250 1850 1    50   Input ~ 0
3.3V
Text Notes 3600 1750 0    50   ~ 0
ESP32 \nAUTO-BOOTMODE\nSELECTOR\nTHINGY
Text GLabel 2900 3150 1    50   Input ~ 0
3.3V
$Comp
L Device:R_Small R4
U 1 1 5E6E993E
P 2900 3250
F 0 "R4" H 2959 3296 50  0000 L CNN
F 1 "5k" H 2959 3205 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2900 3250 50  0001 C CNN
F 3 "~" H 2900 3250 50  0001 C CNN
	1    2900 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3550 4350 3550
$Comp
L Device:R_Small R8
U 1 1 5E72BC1C
P 4350 3450
F 0 "R8" H 4409 3496 50  0000 L CNN
F 1 "12K" H 4409 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4350 3450 50  0001 C CNN
F 3 "~" H 4350 3450 50  0001 C CNN
	1    4350 3450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:S8050 Q2
U 1 1 5E7204FE
P 4150 3350
F 0 "Q2" H 4341 3304 50  0000 L CNN
F 1 "S8050" H 4341 3395 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4350 3275 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 4150 3350 50  0001 L CNN
F 4 "MMS8050-H-TP" H 4150 3350 50  0001 C CNN "manf#"
	1    4150 3350
	-1   0    0    1   
$EndComp
Text GLabel 4350 3550 2    50   Input ~ 0
RTS
Text GLabel 4050 3550 3    50   Input ~ 0
ESP32_BOOT
Text GLabel 4150 2300 1    50   Input ~ 0
ESP32_EN
Wire Wire Line
	4050 2700 3850 2700
Wire Wire Line
	4050 3150 4050 2700
Wire Wire Line
	4150 2700 4150 3550
$Comp
L Device:R_Small R5
U 1 1 5E72B818
P 3850 2600
F 0 "R5" H 3909 2646 50  0000 L CNN
F 1 "12K" H 3909 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3850 2600 50  0001 C CNN
F 3 "~" H 3850 2600 50  0001 C CNN
	1    3850 2600
	1    0    0    -1  
$EndComp
Text GLabel 3850 2700 0    50   Input ~ 0
DTR
$Comp
L Transistor_BJT:S8050 Q1
U 1 1 5E6515ED
P 4050 2500
F 0 "Q1" H 4240 2546 50  0000 L CNN
F 1 "S8050" H 4240 2455 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4250 2425 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 4050 2500 50  0001 L CNN
F 4 "MMS8050-H-TP" H 4050 2500 50  0001 C CNN "manf#"
	1    4050 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5E3B2A1D
P 1400 2450
F 0 "J1" H 1500 2350 50  0000 C CNN
F 1 "12V INPUT" H 1150 2500 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 1400 2450 50  0001 C CNN
F 3 "~" H 1400 2450 50  0001 C CNN
	1    1400 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5E885C76
P 1250 3300
F 0 "R1" H 1309 3346 50  0000 L CNN
F 1 "12K" H 1309 3255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1250 3300 50  0001 C CNN
F 3 "~" H 1250 3300 50  0001 C CNN
	1    1250 3300
	1    0    0    -1  
$EndComp
Text GLabel 1250 3200 1    50   Input ~ 0
3.3V
Wire Wire Line
	1250 3400 1550 3400
Text GLabel 1250 3600 3    50   Input ~ 0
GND
$Comp
L Device:C_Small C3
U 1 1 5E88C58C
P 1250 3500
F 0 "C3" H 1342 3546 50  0000 L CNN
F 1 "1nF" H 1342 3455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1250 3500 50  0001 C CNN
F 3 "~" H 1250 3500 50  0001 C CNN
	1    1250 3500
	1    0    0    -1  
$EndComp
Connection ~ 1250 3400
$Comp
L Device:R_Small R3
U 1 1 5E8924BA
P 2850 3600
F 0 "R3" V 2900 3600 50  0000 C CNN
F 1 "5k" V 2850 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2850 3600 50  0001 C CNN
F 3 "~" H 2850 3600 50  0001 C CNN
	1    2850 3600
	0    -1   -1   0   
$EndComp
Text GLabel 2950 3600 2    50   Input ~ 0
GND
Wire Wire Line
	2750 3400 2900 3400
Wire Wire Line
	2900 3400 2900 3350
Wire Wire Line
	2400 3200 2450 3200
Wire Wire Line
	2150 3200 2200 3200
Wire Notes Line
	8950 4450 8950 1400
Wire Notes Line
	3550 4450 8950 4450
Wire Notes Line
	1100 1400 8950 1400
Text GLabel 5150 3900 3    50   Input ~ 10
USB_CC2
Text GLabel 5050 3900 3    50   Input ~ 10
USB_CC1
$Comp
L Device:R_Small R13
U 1 1 5E56B54F
P 5050 3550
F 0 "R13" V 5000 3550 50  0000 C CNN
F 1 "5.1k" V 4950 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5050 3550 50  0001 C CNN
F 3 "~" H 5050 3550 50  0001 C CNN
	1    5050 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R14
U 1 1 5E56C633
P 5150 3550
F 0 "R14" V 5250 3550 50  0000 C CNN
F 1 "5.1k" V 5300 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5150 3550 50  0001 C CNN
F 3 "~" H 5150 3550 50  0001 C CNN
	1    5150 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3900 5050 3650
Wire Wire Line
	5150 3650 5150 3900
Text GLabel 5100 3200 1    50   Input ~ 0
GND
Wire Wire Line
	5050 3450 5050 3200
Wire Wire Line
	5050 3200 5150 3200
Wire Wire Line
	5150 3200 5150 3450
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5E3BB7CF
P 3350 3850
F 0 "J2" V 3400 3550 50  0000 L CNN
F 1 "ESP32 UART" V 3300 3550 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3350 3850 50  0001 C CNN
F 3 "~" H 3350 3850 50  0001 C CNN
	1    3350 3850
	-1   0    0    1   
$EndComp
Text GLabel 2150 2250 1    50   Input ~ 0
V_IN
Text GLabel 2750 4000 2    50   Input ~ 0
SPI_MISO
Text GLabel 2750 4100 2    50   Input ~ 0
SPI_MOSI
Text GLabel 2750 4200 2    50   Input ~ 0
SPI_CLK
Text GLabel 2750 4300 2    50   Input ~ 0
SPI_CS
Text GLabel 2750 5500 2    50   Input ~ 0
IO33
Text GLabel 2750 4400 2    50   Input ~ 0
IO16
Text GLabel 2750 4500 2    50   Input ~ 0
IO17
Text GLabel 2750 4600 2    50   Input ~ 0
IO18
Text GLabel 2750 4700 2    50   Input ~ 0
IO19
Text GLabel 2750 4800 2    50   Input ~ 0
IO21
Text GLabel 2750 4900 2    50   Input ~ 0
IO22
Text GLabel 2750 5000 2    50   Input ~ 0
IO23
Text GLabel 2750 5100 2    50   Input ~ 0
IO25
Text GLabel 2750 5200 2    50   Input ~ 0
IO26
Text GLabel 2750 5300 2    50   Input ~ 0
IO27
Text GLabel 2750 5400 2    50   Input ~ 0
IO32
$Comp
L Connector_Generic:Conn_02x10_Counter_Clockwise J4
U 1 1 5E572F76
P 4350 5400
F 0 "J4" H 4400 6017 50  0000 C CNN
F 1 "Conn_02x10_Counter_Clockwise" H 4400 5926 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 4350 5400 50  0001 C CNN
F 3 "~" H 4350 5400 50  0001 C CNN
	1    4350 5400
	1    0    0    -1  
$EndComp
Text Notes 3600 4600 0    50   ~ 10
DAUGHTERBOARD INTERFACE
Text GLabel 4150 5000 0    50   Input ~ 0
V_IN
Text GLabel 4150 5100 0    50   Input ~ 0
GND
Text GLabel 4150 5300 0    50   Input ~ 0
GND
Text GLabel 4150 5200 0    50   Input ~ 0
3.3V
Text GLabel 4150 5400 0    50   Input ~ 0
SPI_MISO
Text GLabel 4150 5500 0    50   Input ~ 0
SPI_MOSI
Text GLabel 4150 5600 0    50   Input ~ 0
SPI_CLK
Text GLabel 4150 5700 0    50   Input ~ 0
SPI_CS
Text GLabel 4150 5800 0    50   Input ~ 0
IO16
Text GLabel 4150 5900 0    50   Input ~ 0
IO17
Text GLabel 4650 5000 2    50   Input ~ 0
IO33
Text GLabel 4650 5900 2    50   Input ~ 0
IO18
Text GLabel 4650 5800 2    50   Input ~ 0
IO19
Text GLabel 4650 5700 2    50   Input ~ 0
IO21
Text GLabel 4650 5600 2    50   Input ~ 0
IO22
Text GLabel 4650 5500 2    50   Input ~ 0
IO23
Text GLabel 4650 5400 2    50   Input ~ 0
IO25
Text GLabel 4650 5300 2    50   Input ~ 0
IO26
Text GLabel 4650 5200 2    50   Input ~ 0
IO27
Text GLabel 4650 5100 2    50   Input ~ 0
IO32
Wire Notes Line
	5100 6100 5100 4450
Wire Notes Line
	1100 6100 5100 6100
Wire Notes Line
	4650 2750 5650 2750
Wire Notes Line
	5650 2750 5650 4450
Wire Notes Line
	6700 1400 6700 4450
$EndSCHEMATC

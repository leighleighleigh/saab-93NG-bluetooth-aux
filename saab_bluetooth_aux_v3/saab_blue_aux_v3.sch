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
Text GLabel 3800 5000 2    50   Input ~ 0
VDD_3.3V
$Comp
L Regulator_Linear:MCP1703A-3302_SOT223 U2
U 1 1 5E2845BD
P 3300 5000
F 0 "U2" H 3300 5242 50  0000 C CNN
F 1 "MCP1703A-3302_SOT223" H 3300 5151 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3300 5200 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20005122B.pdf" H 3300 4950 50  0001 C CNN
	1    3300 5000
	1    0    0    -1  
$EndComp
Text Notes 3000 4700 0    50   ~ 10
3.3V SUPPLY LDO
$Comp
L Switch:SW_Push SW1
U 1 1 5F3DA732
P 6650 5800
F 0 "SW1" H 6650 6085 50  0000 C CNN
F 1 "SW_EN" H 6650 5994 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_SPST_NO_Alps_SKRK" H 6650 6000 50  0001 C CNN
F 3 "~" H 6650 6000 50  0001 C CNN
	1    6650 5800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5F3DB8C4
P 7150 5800
F 0 "R4" V 6954 5800 50  0000 C CNN
F 1 "1k" V 7045 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 5800 50  0001 C CNN
F 3 "~" H 7150 5800 50  0001 C CNN
	1    7150 5800
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5F3DC1F8
P 6950 5800
F 0 "R2" V 6754 5800 50  0000 C CNN
F 1 "470" V 6845 5800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 5800 50  0001 C CNN
F 3 "~" H 6950 5800 50  0001 C CNN
	1    6950 5800
	0    1    1    0   
$EndComp
Text GLabel 6000 3650 2    50   Input ~ 0
GND
Wire Wire Line
	5300 3650 5800 3650
Text GLabel 5300 6450 2    50   Input ~ 0
GND
Text GLabel 7250 5800 2    50   Input ~ 0
VDD_3.3V
Text GLabel 6450 5800 0    50   Input ~ 0
GND
Text GLabel 7050 5800 1    50   Input ~ 0
EN
Text GLabel 4700 3850 0    50   Input ~ 0
EN
$Comp
L Switch:SW_Push SW2
U 1 1 5F41B4C9
P 6650 6200
F 0 "SW2" H 6650 6485 50  0000 C CNN
F 1 "SW_FLASH" H 6650 6394 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_SPST_NO_Alps_SKRK" H 6650 6400 50  0001 C CNN
F 3 "~" H 6650 6400 50  0001 C CNN
	1    6650 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F41B4CF
P 7150 6200
F 0 "R5" V 6954 6200 50  0000 C CNN
F 1 "1k" V 7045 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7150 6200 50  0001 C CNN
F 3 "~" H 7150 6200 50  0001 C CNN
	1    7150 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F41B4D5
P 6950 6200
F 0 "R3" V 6754 6200 50  0000 C CNN
F 1 "470" V 6845 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6950 6200 50  0001 C CNN
F 3 "~" H 6950 6200 50  0001 C CNN
	1    6950 6200
	0    1    1    0   
$EndComp
Text GLabel 7250 6200 2    50   Input ~ 0
VDD_3.3V
Text GLabel 6450 6200 0    50   Input ~ 0
GND
Text GLabel 7050 6200 1    50   Input ~ 0
IO0
Text GLabel 5900 3850 2    50   Input ~ 0
IO0
$Comp
L Connector:USB_B_Micro J2
U 1 1 5F431498
P 10150 4050
F 0 "J2" H 10207 4517 50  0000 C CNN
F 1 "USB_B_Micro" H 10207 4426 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Molex-105017-0001" H 10300 4000 50  0001 C CNN
F 3 "~" H 10300 4000 50  0001 C CNN
	1    10150 4050
	-1   0    0    1   
$EndComp
$Comp
L Diode:1N5819 D10
U 1 1 5F43801F
P 9050 4400
F 0 "D10" H 9050 4184 50  0000 C CNN
F 1 "1N5819" H 9050 4275 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 9050 4225 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 9050 4400 50  0001 C CNN
	1    9050 4400
	0    -1   -1   0   
$EndComp
Text GLabel 9050 4550 3    50   Input ~ 0
VIN
Text GLabel 10250 3650 1    50   Input ~ 0
GND
Wire Wire Line
	10250 3650 10150 3650
$Comp
L Device:LED_Small D9
U 1 1 5F455DEF
P 6450 4050
F 0 "D9" H 6450 3845 50  0000 C CNN
F 1 "LED_IO2" H 6450 3936 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6450 4050 50  0001 C CNN
F 3 "~" V 6450 4050 50  0001 C CNN
	1    6450 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5F457718
P 6250 4050
F 0 "R6" V 6054 4050 50  0000 C CNN
F 1 "470" V 6145 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6250 4050 50  0001 C CNN
F 3 "~" H 6250 4050 50  0001 C CNN
	1    6250 4050
	0    1    1    0   
$EndComp
Text GLabel 6550 4050 2    50   Input ~ 0
GND
Wire Wire Line
	6150 4050 5900 4050
Text GLabel 3150 3400 2    50   Input ~ 0
GND
Text GLabel 3550 3800 2    50   Input ~ 0
RX_ESP32_CAN
Text GLabel 3550 3900 2    50   Input ~ 0
TX_ESP32_CAN
$Comp
L Interface_CAN_LIN:SN65HVD232 U7
U 1 1 5F4AC516
P 3150 3800
F 0 "U7" H 3150 4281 50  0000 C CNN
F 1 "SN65HVD232" H 3150 4190 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 3150 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn65hvd230.pdf" H 3050 4200 50  0001 C CNN
	1    3150 3800
	-1   0    0    1   
$EndComp
Text GLabel 3150 4100 0    50   Input ~ 0
VDD_3.3V
Text GLabel 2750 3700 0    50   Input ~ 0
CAN_L
Text GLabel 2750 3800 0    50   Input ~ 0
CAN_H
Text GLabel 5900 4350 2    50   Input ~ 0
TX_ESP32_CAN
Text GLabel 5900 4250 2    50   Input ~ 0
RX_ESP32_CAN
Wire Notes Line
	2400 4450 4250 4450
Wire Notes Line
	6150 6600 4300 6600
Wire Notes Line
	4300 6600 4300 3200
Text Notes 4350 3300 0    50   ~ 0
ESP32 MODULE
Text GLabel 2750 5000 0    50   Input ~ 0
VIN
Wire Wire Line
	2750 5000 3000 5000
$Comp
L Device:C_Small C2
U 1 1 5F3AD68D
P 2750 5250
F 0 "C2" H 2842 5296 50  0000 L CNN
F 1 "1uF" H 2842 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2750 5250 50  0001 C CNN
F 3 "~" H 2750 5250 50  0001 C CNN
	1    2750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5350 3300 5350
Wire Wire Line
	3300 5350 3300 5300
$Comp
L Device:C_Small C5
U 1 1 5F3B03A3
P 3700 5250
F 0 "C5" H 3792 5296 50  0000 L CNN
F 1 "1uF" H 3792 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 5250 50  0001 C CNN
F 3 "~" H 3700 5250 50  0001 C CNN
	1    3700 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 3700 5350
Wire Wire Line
	2750 5000 2750 5150
Connection ~ 3300 5350
Wire Wire Line
	3700 5150 3700 5000
Wire Wire Line
	3700 5000 3600 5000
Wire Wire Line
	3700 5000 3800 5000
Connection ~ 3700 5000
Wire Notes Line
	4250 4500 2250 4500
Text GLabel 5300 3650 0    50   Input ~ 0
VDD_3.3V
$Comp
L Device:C_Small C6
U 1 1 5F43E696
P 5900 3500
F 0 "C6" V 5671 3500 50  0000 C CNN
F 1 "1uF" V 5762 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5900 3500 50  0001 C CNN
F 3 "~" H 5900 3500 50  0001 C CNN
	1    5900 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	6000 3500 6000 3650
Wire Wire Line
	5800 3650 5800 3500
$Comp
L Device:C_Small C3
U 1 1 5F44B61F
P 3250 4100
F 0 "C3" V 3479 4100 50  0000 C CNN
F 1 "1uF" V 3388 4100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3250 4100 50  0001 C CNN
F 3 "~" H 3250 4100 50  0001 C CNN
	1    3250 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5F452337
P 5900 3650
F 0 "C7" V 5671 3650 50  0000 C CNN
F 1 "10uF" V 5762 3650 50  0000 C CNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-6032-20_AVX-F_Pad2.25x2.35mm_HandSolder" H 5900 3650 50  0001 C CNN
F 3 "~" H 5900 3650 50  0001 C CNN
	1    5900 3650
	0    1    1    0   
$EndComp
Connection ~ 5800 3650
Text GLabel 3350 4100 2    50   Input ~ 0
GND
$Comp
L Transistor_FET:BSS138 Q2
U 1 1 5F4B97ED
P 8850 5850
F 0 "Q2" H 9054 5896 50  0000 L CNN
F 1 "BSS138" H 9054 5805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 9050 5775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 8850 5850 50  0001 L CNN
	1    8850 5850
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:BSS138 Q1
U 1 1 5F4B9C1D
P 8200 5850
F 0 "Q1" H 8404 5804 50  0000 L CNN
F 1 "BSS138" H 8404 5895 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8400 5775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/BS/BSS138.pdf" H 8200 5850 50  0001 L CNN
	1    8200 5850
	0    -1   1    0   
$EndComp
Text GLabel 9050 5950 2    50   Input ~ 0
EN
Text GLabel 8000 5950 0    50   Input ~ 0
IO0
Wire Wire Line
	8400 5950 8400 5650
Wire Wire Line
	8400 5650 8850 5650
Wire Wire Line
	8650 5950 8600 5950
Wire Wire Line
	8600 5950 8600 5600
Wire Wire Line
	8600 5600 8200 5600
Wire Wire Line
	8200 5600 8200 5650
Text GLabel 8850 5650 1    50   Input ~ 0
DTR
Text GLabel 8200 5600 1    50   Input ~ 0
RTS
Text GLabel 7700 4750 3    50   Input ~ 0
RTS
Text GLabel 7900 4750 3    50   Input ~ 0
DTR
Wire Notes Line
	2250 4500 2250 5400
Wire Notes Line
	2250 5400 4250 5400
Wire Notes Line
	4250 5400 4250 4500
Text GLabel 7600 4750 3    50   Input ~ 0
RX_ESP32
Text GLabel 5900 4150 2    50   Input ~ 0
RX_ESP32
Text GLabel 7500 4750 3    50   Input ~ 0
TX_ESP32
Text GLabel 5900 3950 2    50   Input ~ 0
TX_ESP32
$Comp
L Interface_USB:CY7C65213-28PVXI U5
U 1 1 5F4096C8
P 7900 4250
F 0 "U5" H 7950 5231 50  0000 C CNN
F 1 "CY7C65213-28PVXI" H 7950 5140 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 7900 3350 50  0001 C CNN
F 3 "http://www.cypress.com/file/139881/download" H 5400 4750 50  0001 C CNN
	1    7900 4250
	0    -1   -1   0   
$EndComp
Text GLabel 8700 4550 3    50   Input ~ 0
GND
Wire Wire Line
	8700 4150 8700 4250
Connection ~ 8700 4250
Wire Wire Line
	8700 4250 8700 4350
Connection ~ 8700 4350
Wire Wire Line
	8700 4350 8700 4550
Text GLabel 9850 4050 0    50   Input ~ 0
USB_DP
Text GLabel 9850 3950 0    50   Input ~ 0
USB_DM
Text GLabel 7400 3650 1    50   Input ~ 0
USB_DM
Text GLabel 7300 3650 1    50   Input ~ 0
USB_DP
$Comp
L Device:C_Small C4
U 1 1 5F4A26B9
P 8300 4850
F 0 "C4" H 8392 4896 50  0000 L CNN
F 1 "1uF" H 8392 4805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 4850 50  0001 C CNN
F 3 "~" H 8300 4850 50  0001 C CNN
	1    8300 4850
	1    0    0    -1  
$EndComp
Text GLabel 8300 4950 3    50   Input ~ 0
GND
Text GLabel 9050 4250 1    50   Input ~ 0
VBUS
Text GLabel 7100 4250 3    50   Input ~ 0
VBUS
Wire Wire Line
	7100 4250 7100 4150
$Comp
L Device:LED D12
U 1 1 5F4CCE75
P 8550 3350
F 0 "D12" H 8543 3095 50  0000 C CNN
F 1 "LED0" H 8543 3186 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 3350 50  0001 C CNN
F 3 "~" H 8550 3350 50  0001 C CNN
	1    8550 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5F4DC411
P 8200 3550
F 0 "R7" V 8004 3550 50  0000 C CNN
F 1 "1k" V 8095 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 3550 50  0001 C CNN
F 3 "~" H 8200 3550 50  0001 C CNN
	1    8200 3550
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5F4DD357
P 8300 3550
F 0 "R8" V 8104 3550 50  0000 C CNN
F 1 "1k" V 8195 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8300 3550 50  0001 C CNN
F 3 "~" H 8300 3550 50  0001 C CNN
	1    8300 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	8300 3450 8400 3450
Wire Wire Line
	8400 3350 8200 3350
Wire Wire Line
	8200 3350 8200 3450
Text GLabel 8700 3400 2    50   Input ~ 0
VBUS
Wire Wire Line
	8700 3450 8700 3350
$Comp
L Device:LED D13
U 1 1 5F4CA031
P 8550 3450
F 0 "D13" H 8543 3195 50  0000 C CNN
F 1 "LED0" H 8543 3286 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8550 3450 50  0001 C CNN
F 3 "~" H 8550 3450 50  0001 C CNN
	1    8550 3450
	1    0    0    -1  
$EndComp
Wire Notes Line
	6150 6600 6150 6400
Wire Notes Line
	6150 6400 10750 6400
Wire Notes Line
	10750 6400 10750 3200
Wire Notes Line
	4300 3200 10750 3200
Wire Wire Line
	9050 4250 9850 4250
Text GLabel 3300 5350 3    50   Input ~ 0
GND
Text GLabel 2900 2950 0    50   Input ~ 0
CAN_H
Text GLabel 2900 3050 0    50   Input ~ 0
CAN_L
$Comp
L Connector:Screw_Terminal_01x02 I-BUS1
U 1 1 5F317B0C
P 3100 2950
F 0 "I-BUS1" H 3180 2942 50  0000 L CNN
F 1 "Screw_Terminal_01x02" H 3180 2851 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_MKDS-1,5-2-5.08_1x02_P5.08mm_Horizontal" H 3100 2950 50  0001 C CNN
F 3 "~" H 3100 2950 50  0001 C CNN
	1    3100 2950
	1    0    0    -1  
$EndComp
Text Notes 6800 5500 0    50   ~ 0
NOTE: MIGHT NEED 10K's HERE
Text Notes 8400 5450 0    50   ~ 0
NOTE: NO IDEA IF THIS WILL WORK LMAO
Wire Wire Line
	4700 4050 5700 4050
Wire Wire Line
	4700 4150 5600 4150
Text GLabel 5900 5350 2    50   Input ~ 0
I2S_DIN
Text GLabel 5900 5550 2    50   Input ~ 0
I2S_WSEL
Text GLabel 5900 5650 2    50   Input ~ 0
I2S_BCLK
Wire Notes Line
	2400 4450 2400 2850
Wire Notes Line
	2400 2850 4250 2850
Wire Notes Line
	4250 2850 4250 4450
$Comp
L Connector:Barrel_Jack J1
U 1 1 5F3E3D29
P 3000 6050
F 0 "J1" H 3057 6375 50  0000 C CNN
F 1 "Barrel_Jack" H 3057 6284 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Wuerth_6941xx301002" H 3050 6010 50  0001 C CNN
F 3 "~" H 3050 6010 50  0001 C CNN
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N5819 D1
U 1 1 5F3E41C1
P 3450 5950
F 0 "D1" H 3450 5734 50  0000 C CNN
F 1 "1N5819" H 3450 5825 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 3450 5775 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88525/1n5817.pdf" H 3450 5950 50  0001 C CNN
	1    3450 5950
	-1   0    0    1   
$EndComp
Text GLabel 3300 6150 2    50   Input ~ 0
GND
Text GLabel 3600 5950 2    50   Input ~ 0
VIN
Text GLabel 8600 2400 2    50   Input ~ 0
I2S_DIN
Text GLabel 8600 2500 2    50   Input ~ 0
I2S_WSEL
Text GLabel 8600 2300 2    50   Input ~ 0
I2S_BCLK
$Comp
L RF_Module:ESP32-WROOM-32U U6
U 1 1 5F3FAEB2
P 5300 5050
F 0 "U6" H 5300 6631 50  0000 C CNN
F 1 "ESP32-WROOM-32U" H 5300 6540 50  0000 C CNN
F 2 "RF_Module:ESP32-WROOM-32U" H 5300 3550 50  0001 C CNN
F 3 "https://www.espressif.com/sites/default/files/documentation/esp32-wroom-32d_esp32-wroom-32u_datasheet_en.pdf" H 5000 5100 50  0001 C CNN
	1    5300 5050
	1    0    0    -1  
$EndComp
Text GLabel 6100 2300 1    50   Input ~ 0
GND
$Comp
L Device:C_Small C10
U 1 1 5F4272B3
P 6350 2500
F 0 "C10" V 6579 2500 50  0000 C CNN
F 1 "1uF" V 6488 2500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6350 2500 50  0001 C CNN
F 3 "~" H 6350 2500 50  0001 C CNN
	1    6350 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5F42486D
P 6350 2400
F 0 "C9" V 6579 2400 50  0000 C CNN
F 1 "1uF" V 6488 2400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6350 2400 50  0001 C CNN
F 3 "~" H 6350 2400 50  0001 C CNN
	1    6350 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 2500 7600 2500
Wire Wire Line
	7600 2400 6450 2400
$Comp
L Connector:AudioJack3 J3
U 1 1 5F44C9FF
P 5900 2400
F 0 "J3" V 5836 2588 50  0000 L CNN
F 1 "AudioJack3" V 5927 2588 50  0000 L CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ-3523-SMT_Horizontal" H 5900 2400 50  0001 C CNN
F 3 "~" H 5900 2400 50  0001 C CNN
	1    5900 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2400 6100 2400
Wire Wire Line
	6100 2500 6250 2500
NoConn ~ 8600 2200
$Comp
L Device:C_Small C11
U 1 1 5F48C02E
P 6850 1500
F 0 "C11" V 6621 1500 50  0000 C CNN
F 1 "100nF" V 6712 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1500 50  0001 C CNN
F 3 "~" H 6850 1500 50  0001 C CNN
	1    6850 1500
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5F4922A6
P 6850 1700
F 0 "C12" V 6621 1700 50  0000 C CNN
F 1 "100nF" V 6712 1700 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6850 1700 50  0001 C CNN
F 3 "~" H 6850 1700 50  0001 C CNN
	1    6850 1700
	-1   0    0    1   
$EndComp
$Comp
L Device:CP_Small C1
U 1 1 5F49628A
P 6500 1500
F 0 "C1" H 6588 1546 50  0000 L CNN
F 1 "10uF" H 6588 1455 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6500 1500 50  0001 C CNN
F 3 "~" H 6500 1500 50  0001 C CNN
	1    6500 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C8
U 1 1 5F4964EE
P 6500 1700
F 0 "C8" H 6412 1654 50  0000 R CNN
F 1 "10uF" H 6412 1745 50  0000 R CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6500 1700 50  0001 C CNN
F 3 "~" H 6500 1700 50  0001 C CNN
	1    6500 1700
	-1   0    0    1   
$EndComp
Wire Wire Line
	6500 1400 6850 1400
Wire Wire Line
	6850 1600 6500 1600
Connection ~ 6850 1600
Connection ~ 6500 1600
Wire Wire Line
	6500 1600 6300 1600
Text GLabel 6300 1800 0    50   Input ~ 0
VDD_3.3V
Wire Wire Line
	6300 1800 6500 1800
Connection ~ 6500 1800
Wire Wire Line
	6500 1800 6850 1800
Wire Wire Line
	6850 1400 7300 1400
Wire Wire Line
	7300 1400 7300 1700
Wire Wire Line
	7300 1700 7600 1700
Connection ~ 6850 1400
$Comp
L power:GNDD #PWR0101
U 1 1 5F4A78A4
P 6300 1600
F 0 "#PWR0101" H 6300 1350 50  0001 C CNN
F 1 "GNDD" V 6304 1490 50  0000 R CNN
F 2 "" H 6300 1600 50  0001 C CNN
F 3 "" H 6300 1600 50  0001 C CNN
	1    6300 1600
	0    1    1    0   
$EndComp
$Comp
L power:GNDD #PWR0102
U 1 1 5F4A7ADB
P 8100 1400
F 0 "#PWR0102" H 8100 1150 50  0001 C CNN
F 1 "GNDD" H 8104 1245 50  0000 C CNN
F 2 "" H 8100 1400 50  0001 C CNN
F 3 "" H 8100 1400 50  0001 C CNN
	1    8100 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GNDD #PWR0103
U 1 1 5F4A837F
P 8600 1700
F 0 "#PWR0103" H 8600 1450 50  0001 C CNN
F 1 "GNDD" V 8604 1590 50  0000 R CNN
F 2 "" H 8600 1700 50  0001 C CNN
F 3 "" H 8600 1700 50  0001 C CNN
	1    8600 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDD #PWR0104
U 1 1 5F4A8C64
P 8600 2000
F 0 "#PWR0104" H 8600 1750 50  0001 C CNN
F 1 "GNDD" V 8604 1890 50  0000 R CNN
F 2 "" H 8600 2000 50  0001 C CNN
F 3 "" H 8600 2000 50  0001 C CNN
	1    8600 2000
	0    -1   -1   0   
$EndComp
Text GLabel 8100 2700 3    50   Input ~ 0
VDD_3.3V
$Comp
L Device:R R1
U 1 1 5F4B2380
P 9050 1750
F 0 "R1" H 9120 1796 50  0000 L CNN
F 1 "10K" H 9120 1705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8980 1750 50  0001 C CNN
F 3 "~" H 9050 1750 50  0001 C CNN
	1    9050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1900 9050 1900
Text GLabel 9050 1600 2    50   Input ~ 0
VDD_3.3V
Text GLabel 6550 2850 0    50   Input ~ 0
GND
$Comp
L Device:CP_Small C13
U 1 1 5F4C115A
P 6950 1000
F 0 "C13" H 6862 954 50  0000 R CNN
F 1 "47uF" H 6862 1045 50  0000 R CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 6950 1000 50  0001 C CNN
F 3 "~" H 6950 1000 50  0001 C CNN
	1    6950 1000
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5F4C1725
P 7200 1000
F 0 "C14" V 6971 1000 50  0000 C CNN
F 1 "100nF" V 7062 1000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7200 1000 50  0001 C CNN
F 3 "~" H 7200 1000 50  0001 C CNN
	1    7200 1000
	-1   0    0    1   
$EndComp
$Comp
L power:GNDD #PWR0105
U 1 1 5F4C1B0B
P 6550 900
F 0 "#PWR0105" H 6550 650 50  0001 C CNN
F 1 "GNDD" V 6554 790 50  0000 R CNN
F 2 "" H 6550 900 50  0001 C CNN
F 3 "" H 6550 900 50  0001 C CNN
	1    6550 900 
	0    1    1    0   
$EndComp
Wire Wire Line
	8000 900  8000 1400
Connection ~ 7200 900 
Wire Wire Line
	7200 900  8000 900 
Wire Wire Line
	6550 900  6950 900 
Connection ~ 6950 900 
Wire Wire Line
	6950 900  7200 900 
$Comp
L power:VDDA #PWR0106
U 1 1 5F4C8814
P 8000 2700
F 0 "#PWR0106" H 8000 2550 50  0001 C CNN
F 1 "VDDA" H 8018 2873 50  0000 C CNN
F 2 "" H 8000 2700 50  0001 C CNN
F 3 "" H 8000 2700 50  0001 C CNN
	1    8000 2700
	-1   0    0    1   
$EndComp
$Comp
L power:VDDA #PWR0107
U 1 1 5F4C98D7
P 7500 1100
F 0 "#PWR0107" H 7500 950 50  0001 C CNN
F 1 "VDDA" V 7517 1228 50  0000 L CNN
F 2 "" H 7500 1100 50  0001 C CNN
F 3 "" H 7500 1100 50  0001 C CNN
	1    7500 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 1100 7200 1100
Connection ~ 7200 1100
Wire Wire Line
	7200 1100 6950 1100
Wire Wire Line
	6950 1100 6550 1100
Connection ~ 6950 1100
Text GLabel 6550 1100 0    50   Input ~ 0
VDD_3.3V
$Comp
L Device:CP_Small C15
U 1 1 5F4D5ADE
P 7500 1400
F 0 "C15" H 7412 1354 50  0000 R CNN
F 1 "10uF" H 7412 1445 50  0000 R CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 7500 1400 50  0001 C CNN
F 3 "~" H 7500 1400 50  0001 C CNN
	1    7500 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 1400 8200 1150
Wire Wire Line
	8200 1150 7850 1150
Wire Wire Line
	7850 1150 7850 1300
Wire Wire Line
	7850 1300 7500 1300
Wire Wire Line
	7500 1500 7500 1600
Wire Wire Line
	7500 1600 7600 1600
$Comp
L Device:C_Small C16
U 1 1 5F4DCE4A
P 8200 1050
F 0 "C16" V 7971 1050 50  0000 C CNN
F 1 "100nF" V 8062 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8200 1050 50  0001 C CNN
F 3 "~" H 8200 1050 50  0001 C CNN
	1    8200 1050
	-1   0    0    1   
$EndComp
Connection ~ 8200 1150
$Comp
L Device:CP_Small C17
U 1 1 5F4DD606
P 8450 1050
F 0 "C17" H 8538 1096 50  0000 L CNN
F 1 "47uF" H 8538 1005 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 8450 1050 50  0001 C CNN
F 3 "~" H 8450 1050 50  0001 C CNN
	1    8450 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1150 8200 1150
Wire Wire Line
	8200 950  8450 950 
Wire Wire Line
	8450 1150 8850 1150
Connection ~ 8450 1150
$Comp
L power:GNDD #PWR0108
U 1 1 5F4E497B
P 8850 1150
F 0 "#PWR0108" H 8850 900 50  0001 C CNN
F 1 "GNDD" V 8854 1040 50  0000 R CNN
F 2 "" H 8850 1150 50  0001 C CNN
F 3 "" H 8850 1150 50  0001 C CNN
	1    8850 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8200 2700 8300 2700
Wire Wire Line
	8750 950  8450 950 
Connection ~ 8450 950 
Text GLabel 8750 950  2    50   Input ~ 0
VDD_3.3V
$Comp
L power:GNDD #PWR0109
U 1 1 5F4ED7D1
P 6550 2850
F 0 "#PWR0109" H 6550 2600 50  0001 C CNN
F 1 "GNDD" V 6554 2740 50  0000 R CNN
F 2 "" H 6550 2850 50  0001 C CNN
F 3 "" H 6550 2850 50  0001 C CNN
	1    6550 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP_Small C18
U 1 1 5F50A79A
P 7350 2050
F 0 "C18" H 7262 2004 50  0000 R CNN
F 1 "10uF" H 7262 2095 50  0000 R CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.3" H 7350 2050 50  0001 C CNN
F 3 "~" H 7350 2050 50  0001 C CNN
	1    7350 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 1900 7350 1900
Wire Wire Line
	7350 1900 7350 1950
Wire Wire Line
	7350 2150 7350 2200
Wire Wire Line
	7350 2200 7600 2200
Text GLabel 8300 2700 2    50   Input ~ 0
VDD_3.3V
$Comp
L Audio:PCM5100 U1
U 1 1 5F369615
P 8100 2100
F 0 "U1" H 8100 1219 50  0000 C CNN
F 1 "PCM5100" H 8100 1310 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 8050 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/pcm5100.pdf" H 8050 2850 50  0001 C CNN
	1    8100 2100
	-1   0    0    1   
$EndComp
$EndSCHEMATC
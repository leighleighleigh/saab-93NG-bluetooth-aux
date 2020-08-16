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
$Comp
L Connector_Generic:Conn_01x08 J3
U 1 1 5F374BE1
P 5400 7350
F 0 "J3" V 5525 7296 50  0000 C CNN
F 1 "Conn_01x08" V 5616 7296 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5400 7350 50  0001 C CNN
F 3 "~" H 5400 7350 50  0001 C CNN
	1    5400 7350
	0    1    1    0   
$EndComp
Text GLabel 5600 7150 1    50   Input ~ 0
VDD_3.3V
Text GLabel 5700 7150 1    50   Input ~ 0
GND
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
Text GLabel 5200 7150 1    50   Input ~ 0
I2S_DIN
Text GLabel 5100 7150 1    50   Input ~ 0
I2S_WSEL
Text GLabel 5000 7150 1    50   Input ~ 0
I2S_BCLK
Wire Wire Line
	5900 5950 5400 5950
Wire Wire Line
	5400 5950 5400 7150
Wire Wire Line
	5900 5850 5500 5850
Wire Wire Line
	5500 5850 5500 7150
Wire Wire Line
	5900 5750 5350 5750
Wire Wire Line
	5350 5750 5350 7150
Wire Wire Line
	5350 7150 5300 7150
Wire Notes Line
	4850 6650 5850 6650
Wire Notes Line
	5850 6650 5850 7650
Wire Notes Line
	5850 7650 4850 7650
Wire Notes Line
	4850 7650 4850 6650
$Comp
L Audio:PCM5100 U1
U 1 1 5F369615
P 8750 2050
F 0 "U1" H 8750 1169 50  0000 C CNN
F 1 "PCM5100" H 8750 1260 50  0000 C CNN
F 2 "Package_SO:TSSOP-20_4.4x6.5mm_P0.65mm" H 8700 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/pcm5100.pdf" H 8700 2800 50  0001 C CNN
	1    8750 2050
	-1   0    0    1   
$EndComp
$Comp
L max9720:MAX9720 U3
U 1 1 5F36A9E0
P 6350 2050
F 0 "U3" H 6350 2765 50  0000 C CNN
F 1 "MAX9720" H 6350 2674 50  0000 C CNN
F 2 "Package_SO:TSSOP-16_4.4x5mm_P0.65mm" H 6200 2000 50  0001 C CNN
F 3 "" H 6200 2000 50  0001 C CNN
	1    6350 2050
	1    0    0    -1  
$EndComp
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
Wire Wire Line
	6750 1800 7700 1800
Wire Wire Line
	7700 1800 7700 1450
Wire Wire Line
	6750 2000 7800 2000
Wire Wire Line
	7800 2000 7800 1450
Wire Wire Line
	8250 2350 7100 2350
Wire Wire Line
	7100 2450 8250 2450
Text GLabel 8650 2650 0    50   Input ~ 0
VDD_3.3V
Text GLabel 5950 1800 0    50   Input ~ 0
VDD_3.3V
Text GLabel 8850 1350 2    50   Input ~ 0
GND
$Comp
L Device:C_Small C?
U 1 1 5F42486D
P 7000 2350
F 0 "C?" V 7229 2350 50  0000 C CNN
F 1 "1uF" V 7138 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 2350 50  0001 C CNN
F 3 "~" H 7000 2350 50  0001 C CNN
	1    7000 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F4272B3
P 7000 2450
F 0 "C?" V 7229 2450 50  0000 C CNN
F 1 "1uF" V 7138 2450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7000 2450 50  0001 C CNN
F 3 "~" H 7000 2450 50  0001 C CNN
	1    7000 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6750 2300 6900 2300
Wire Wire Line
	6900 2300 6900 2350
Wire Wire Line
	6900 2450 6900 2500
Wire Wire Line
	6900 2500 6750 2500
$Comp
L Device:R_Small R?
U 1 1 5F42AD83
P 5950 2600
F 0 "R?" V 5754 2600 50  0000 C CNN
F 1 "10k" V 5845 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5950 2600 50  0001 C CNN
F 3 "~" H 5950 2600 50  0001 C CNN
	1    5950 2600
	-1   0    0    1   
$EndComp
Text GLabel 5950 2700 0    50   Input ~ 0
VDD_3.3V
$Comp
L Device:C_Small C?
U 1 1 5F42CC63
P 5600 2100
F 0 "C?" V 5829 2100 50  0000 C CNN
F 1 "1uF" V 5738 2100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5600 2100 50  0001 C CNN
F 3 "~" H 5600 2100 50  0001 C CNN
	1    5600 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2000 5600 2000
Wire Wire Line
	5600 2200 5950 2200
$Comp
L Device:C_Small C?
U 1 1 5F42F0DF
P 5350 2300
F 0 "C?" V 5579 2300 50  0000 C CNN
F 1 "1uF" V 5488 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5350 2300 50  0001 C CNN
F 3 "~" H 5350 2300 50  0001 C CNN
	1    5350 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 2300 5900 2300
Wire Wire Line
	6750 2100 6400 2100
Wire Wire Line
	6400 2250 5900 2250
Wire Wire Line
	5900 2250 5900 2300
Wire Wire Line
	6400 2100 6400 2250
Connection ~ 5900 2300
Wire Wire Line
	5900 2300 5450 2300
Text GLabel 5250 2300 0    50   Input ~ 0
GND
Wire Wire Line
	5950 2100 6350 2100
Wire Wire Line
	6350 2100 6350 2200
Wire Wire Line
	6350 2200 6750 2200
$Comp
L Connector:AudioJack3 J?
U 1 1 5F44C9FF
P 7800 1250
F 0 "J?" V 7736 1438 50  0000 L CNN
F 1 "AudioJack3" V 7827 1438 50  0000 L CNN
F 2 "" H 7800 1250 50  0001 C CNN
F 3 "~" H 7800 1250 50  0001 C CNN
	1    7800 1250
	0    1    1    0   
$EndComp
Text GLabel 6750 2200 2    50   Input ~ 0
GND
Text GLabel 7900 1450 3    50   Input ~ 0
GND
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	5150 2650 4850 2650
Wire Wire Line
	4850 2650 4850 2450
Wire Wire Line
	4850 2450 4850 2150
Wire Wire Line
	4750 2150 4850 2150
Wire Wire Line
	4750 2450 4850 2450
Wire Wire Line
	4850 2150 4850 1950
Connection ~ 4850 2150
Connection ~ 4850 2450
Wire Wire Line
	4150 2450 4150 2550
Wire Wire Line
	5150 3050 3550 3050
Wire Wire Line
	3550 3050 3550 2450
Wire Wire Line
	3550 2450 3550 2150
Wire Wire Line
	3550 2150 3650 2150
Wire Wire Line
	3650 2450 3550 2450
Wire Wire Line
	3550 2450 3350 2450
Wire Wire Line
	3350 2450 3350 2550
Connection ~ 3550 2450
Wire Wire Line
	1600 5850 1600 5950
Wire Wire Line
	1800 5850 1800 5950
Wire Wire Line
	2000 5850 2000 5950
Wire Wire Line
	2200 5850 2200 5950
Wire Wire Line
	2400 5850 2400 5950
Wire Wire Line
	1300 5850 1300 5950
Wire Wire Line
	7350 4450 7450 4450
Wire Wire Line
	7350 4550 7350 4450
Wire Wire Line
	7350 4450 7250 4450
Connection ~ 7350 4450
Wire Wire Line
	7350 5250 7450 5250
Wire Wire Line
	7350 5350 7350 5250
Wire Wire Line
	7350 5250 7250 5250
Connection ~ 7350 5250
Wire Wire Line
	7850 4450 7950 4450
Wire Wire Line
	7950 4450 7950 4550
Wire Wire Line
	7950 4450 8350 4450
Connection ~ 7950 4450
Text Label 8050 4450 0    70   ~ 0
OUTL
Wire Wire Line
	7850 5250 7950 5250
Wire Wire Line
	7950 5250 7950 5350
Wire Wire Line
	7950 5250 8350 5250
Connection ~ 7950 5250
Text Label 8050 5250 0    70   ~ 0
OUTR
Wire Wire Line
	6450 6050 6450 6150
Wire Wire Line
	6450 6050 6600 6050
Wire Wire Line
	6750 6050 6750 6150
Wire Wire Line
	3200 5350 2200 5350
Wire Wire Line
	2200 5350 2200 5450
Wire Wire Line
	3200 5250 2000 5250
Wire Wire Line
	2000 5250 2000 5450
Wire Wire Line
	3200 5050 1800 5050
Wire Wire Line
	1800 5050 1800 5450
Wire Wire Line
	3200 4950 1600 4950
Wire Wire Line
	1600 4950 1600 5450
Wire Wire Line
	3200 5450 2400 5450
Wire Wire Line
	3200 4450 1300 4450
Wire Wire Line
	1300 4450 1300 5450
Wire Wire Line
	4850 1750 4850 1450
Wire Wire Line
	5150 2950 4050 2950
Wire Wire Line
	4050 2950 4050 2450
Wire Wire Line
	4050 2450 4050 2150
Wire Wire Line
	3950 2150 4050 2150
Wire Wire Line
	3950 2450 4050 2450
Wire Wire Line
	4050 2150 4050 1450
Connection ~ 4050 2450
Connection ~ 4050 2150
Wire Wire Line
	5150 2750 4350 2750
Wire Wire Line
	4350 2750 4350 2450
Wire Wire Line
	4350 2450 4350 2150
Wire Wire Line
	4350 2150 4450 2150
Wire Wire Line
	4450 2450 4350 2450
Wire Wire Line
	4350 2050 4350 2150
Connection ~ 4350 2450
Connection ~ 4350 2150
Wire Wire Line
	6450 6450 6450 6550
Wire Wire Line
	6750 6450 6750 6550
Wire Wire Line
	7950 5650 7950 5850
Wire Wire Line
	7350 5750 7350 5850
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C8
U 1 1 F1C90C04
P 4550 2450
F 0 "C8" V 4460 2499 50  0000 C CNN
F 1 "0.1uF" V 4640 2499 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2450 50  0001 C CNN
F 3 "" H 4550 2450 50  0001 C CNN
	1    4550 2450
	0    1    1    0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C6
U 1 1 DAA3AADF
P 3750 2450
F 0 "C6" V 3660 2499 50  0000 C CNN
F 1 "0.1uF" V 3840 2499 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 2450 50  0001 C CNN
F 3 "" H 3750 2450 50  0001 C CNN
	1    3750 2450
	0    1    1    0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0101
U 1 1 BABD3B23
P 3350 2650
F 0 "#U$0101" H 3350 2650 50  0001 C CNN
F 1 "GND" H 3290 2550 42  0000 L BNN
F 2 "" H 3350 2650 50  0001 C CNN
F 3 "" H 3350 2650 50  0001 C CNN
	1    3350 2650
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0102
U 1 1 A8B04D1A
P 4150 2650
F 0 "#U$0102" H 4150 2650 50  0001 C CNN
F 1 "GND" H 4090 2550 42  0000 L BNN
F 2 "" H 4150 2650 50  0001 C CNN
F 3 "" H 4150 2650 50  0001 C CNN
	1    4150 2650
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C13
U 1 1 CAD96FCD
P 7950 4750
F 0 "C13" V 7860 4799 50  0000 C CNN
F 1 "0.01uF" V 8040 4799 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 4750 50  0001 C CNN
F 3 "" H 7950 4750 50  0001 C CNN
	1    7950 4750
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR0805_NOOUTLINE R9
U 1 1 5C720D13
P 7350 4750
F 0 "R9" H 7350 4850 50  0000 C CNN
F 1 "220k" H 7350 4750 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 4750 50  0001 C CNN
F 3 "" H 7350 4750 50  0001 C CNN
	1    7350 4750
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR0805_NOOUTLINE R11
U 1 1 A2882DFC
P 7650 4450
F 0 "R11" H 7650 4550 50  0000 C CNN
F 1 "100" H 7650 4450 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 4450 50  0001 C CNN
F 3 "" H 7650 4450 50  0001 C CNN
	1    7650 4450
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR0805_NOOUTLINE R10
U 1 1 7D14E752
P 7350 5550
F 0 "R10" H 7350 5650 50  0000 C CNN
F 1 "220k" H 7350 5550 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7350 5550 50  0001 C CNN
F 3 "" H 7350 5550 50  0001 C CNN
	1    7350 5550
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR0805_NOOUTLINE R12
U 1 1 ACB3C639
P 7650 5250
F 0 "R12" H 7650 5350 50  0000 C CNN
F 1 "100" H 7650 5250 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7650 5250 50  0001 C CNN
F 3 "" H 7650 5250 50  0001 C CNN
	1    7650 5250
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C9
U 1 1 F7AEDC46
P 6450 6350
F 0 "C9" V 6360 6399 50  0000 C CNN
F 1 "0.1uF" V 6540 6399 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6450 6350 50  0001 C CNN
F 3 "" H 6450 6350 50  0001 C CNN
	1    6450 6350
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0103
U 1 1 D0458224
P 2000 6050
F 0 "#U$0103" H 2000 6050 50  0001 C CNN
F 1 "GND" H 1940 5950 42  0000 L BNN
F 2 "" H 2000 6050 50  0001 C CNN
F 3 "" H 2000 6050 50  0001 C CNN
	1    2000 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0104
U 1 1 41A0958E
P 2200 6050
F 0 "#U$0104" H 2200 6050 50  0001 C CNN
F 1 "GND" H 2140 5950 42  0000 L BNN
F 2 "" H 2200 6050 50  0001 C CNN
F 3 "" H 2200 6050 50  0001 C CNN
	1    2200 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0105
U 1 1 48FA5267
P 1800 6050
F 0 "#U$0105" H 1800 6050 50  0001 C CNN
F 1 "GND" H 1740 5950 42  0000 L BNN
F 2 "" H 1800 6050 50  0001 C CNN
F 3 "" H 1800 6050 50  0001 C CNN
	1    1800 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0106
U 1 1 205CF6AB
P 1600 6050
F 0 "#U$0106" H 1600 6050 50  0001 C CNN
F 1 "GND" H 1540 5950 42  0000 L BNN
F 2 "" H 1600 6050 50  0001 C CNN
F 3 "" H 1600 6050 50  0001 C CNN
	1    1600 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C7
U 1 1 99D41F3B
P 4550 2150
F 0 "C7" V 4460 2199 50  0000 C CNN
F 1 "10uF" V 4640 2199 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4550 2150 50  0001 C CNN
F 3 "" H 4550 2150 50  0001 C CNN
	1    4550 2150
	0    1    1    0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C5
U 1 1 D8933479
P 3750 2150
F 0 "C5" V 3660 2199 50  0000 C CNN
F 1 "10uF" V 3840 2199 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3750 2150 50  0001 C CNN
F 3 "" H 3750 2150 50  0001 C CNN
	1    3750 2150
	0    1    1    0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C10
U 1 1 09CD1EDC
P 6750 6350
F 0 "C10" V 6660 6399 50  0000 C CNN
F 1 "10uF" V 6840 6399 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 6750 6350 50  0001 C CNN
F 3 "" H 6750 6350 50  0001 C CNN
	1    6750 6350
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:FERRITE0805 FB2
U 1 1 AA5C5500
P 4850 1850
F 0 "FB2" H 4800 1925 42  0000 L BNN
F 1 "Ferrite" H 4800 1725 42  0000 L BNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-2012-12_Kemet-R_Pad1.30x1.05mm_HandSolder" H 4850 1850 50  0001 C CNN
F 3 "" H 4850 1850 50  0001 C CNN
	1    4850 1850
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R4
U 1 1 81BCC900
P 1600 5650
F 0 "R4" H 1600 5750 50  0000 C CNN
F 1 "10k" H 1600 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1600 5650 50  0001 C CNN
F 3 "" H 1600 5650 50  0001 C CNN
	1    1600 5650
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0114
U 1 1 AF68A1D8
P 2400 6050
F 0 "#U$0114" H 2400 6050 50  0001 C CNN
F 1 "GND" H 2340 5950 42  0000 L BNN
F 2 "" H 2400 6050 50  0001 C CNN
F 3 "" H 2400 6050 50  0001 C CNN
	1    2400 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:GND #U$0115
U 1 1 F2AE8625
P 1300 6050
F 0 "#U$0115" H 1300 6050 50  0001 C CNN
F 1 "GND" H 1240 5950 42  0000 L BNN
F 2 "" H 1300 6050 50  0001 C CNN
F 3 "" H 1300 6050 50  0001 C CNN
	1    1300 6050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:FERRITE0805 FB1
U 1 1 C6596EA5
P 4250 2450
F 0 "FB1" H 4200 2525 42  0000 L BNN
F 1 "Ferrite" H 4200 2325 42  0000 L BNN
F 2 "Capacitor_Tantalum_SMD:CP_EIA-2012-12_Kemet-R_Pad1.30x1.05mm_HandSolder" H 4250 2450 50  0001 C CNN
F 3 "" H 4250 2450 50  0001 C CNN
	1    4250 2450
	-1   0    0    1   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0101
U 1 1 6F4AA42C
P 6750 6650
F 0 "#AGND0101" H 6750 6650 50  0001 C CNN
F 1 "AGND" V 6650 6450 59  0000 L BNN
F 2 "" H 6750 6650 50  0001 C CNN
F 3 "" H 6750 6650 50  0001 C CNN
	1    6750 6650
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0102
U 1 1 0A573ADE
P 6450 6650
F 0 "#AGND0102" H 6450 6650 50  0001 C CNN
F 1 "AGND" V 6350 6450 59  0000 L BNN
F 2 "" H 6450 6650 50  0001 C CNN
F 3 "" H 6450 6650 50  0001 C CNN
	1    6450 6650
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0103
U 1 1 3D008BDF
P 7950 5950
F 0 "#AGND0103" H 7950 5950 50  0001 C CNN
F 1 "AGND" V 7850 5750 59  0000 L BNN
F 2 "" H 7950 5950 50  0001 C CNN
F 3 "" H 7950 5950 50  0001 C CNN
	1    7950 5950
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0104
U 1 1 772F0C8E
P 7350 5950
F 0 "#AGND0104" H 7350 5950 50  0001 C CNN
F 1 "AGND" V 7250 5750 59  0000 L BNN
F 2 "" H 7350 5950 50  0001 C CNN
F 3 "" H 7350 5950 50  0001 C CNN
	1    7350 5950
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0105
U 1 1 C5B3F747
P 7950 4950
F 0 "#AGND0105" H 7950 4950 50  0001 C CNN
F 1 "AGND" V 7850 4750 59  0000 L BNN
F 2 "" H 7950 4950 50  0001 C CNN
F 3 "" H 7950 4950 50  0001 C CNN
	1    7950 4950
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0106
U 1 1 E901FF73
P 7350 5050
F 0 "#AGND0106" H 7350 5050 50  0001 C CNN
F 1 "AGND" V 7250 4850 59  0000 L BNN
F 2 "" H 7350 5050 50  0001 C CNN
F 3 "" H 7350 5050 50  0001 C CNN
	1    7350 5050
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:AGND #AGND0107
U 1 1 69B3F7DA
P 4350 1950
F 0 "#AGND0107" H 4350 1950 50  0001 C CNN
F 1 "AGND" V 4250 1750 59  0000 L BNN
F 2 "" H 4350 1950 50  0001 C CNN
F 3 "" H 4350 1950 50  0001 C CNN
	1    4350 1950
	-1   0    0    1   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R8
U 1 1 B9BAFB95
P 2400 5650
F 0 "R8" H 2400 5750 50  0000 C CNN
F 1 "10k" H 2400 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2400 5650 50  0001 C CNN
F 3 "" H 2400 5650 50  0001 C CNN
	1    2400 5650
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R7
U 1 1 41D07F0A
P 2200 5650
F 0 "R7" H 2200 5750 50  0000 C CNN
F 1 "10k" H 2200 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2200 5650 50  0001 C CNN
F 3 "" H 2200 5650 50  0001 C CNN
	1    2200 5650
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R6
U 1 1 5DE26417
P 2000 5650
F 0 "R6" H 2000 5750 50  0000 C CNN
F 1 "10k" H 2000 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2000 5650 50  0001 C CNN
F 3 "" H 2000 5650 50  0001 C CNN
	1    2000 5650
	0    -1   -1   0   
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R5
U 1 1 0A067037
P 1800 5650
F 0 "R5" H 1800 5750 50  0000 C CNN
F 1 "10k" H 1800 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1800 5650 50  0001 C CNN
F 3 "" H 1800 5650 50  0001 C CNN
	1    1800 5650
	0    -1   -1   0   
$EndComp
Text Notes 8300 2000 0    59   ~ 0
MUTE:\nLOW = Mute Off\nHIGH = Mute On
Text Notes 8300 2500 0    59   ~ 0
DEEM:\nLOW = De-emphasis off\nHIGH = De-emphasis on
Text Notes 8300 1500 0    59   ~ 0
SFOR0   SFOR1   Function\nLOW     LOW     I2S-Bus Input\nLOW     HIGH    LSB-justified 16 bits input \nHIGH     LOW    LSB-justified 20 bits input \nHIGH     HIGH   LSB-justified 24 bits input 
$Comp
L Audio:UDA1334ATS U6
U 1 1 5ED9BB68
P 5550 5100
F 0 "U6" H 5550 5981 50  0000 C CNN
F 1 "UDA1334ATS" H 5550 5890 50  0000 C CNN
F 2 "Package_SO:SSOP-16_4.4x5.2mm_P0.65mm" H 5550 5100 50  0001 C CNN
F 3 "http://www.nxp.com/docs/en/data-sheet/UDA1334ATS.pdf" H 5550 5100 50  0001 C CNN
	1    5550 5100
	1    0    0    -1  
$EndComp
Text HLabel 5050 4600 0    50   Input ~ 0
BCK
Text HLabel 5050 4700 0    50   Input ~ 0
WS
Text HLabel 5050 4800 0    50   Input ~ 0
DATAIN
Text HLabel 5050 5000 0    50   Input ~ 0
PLL0
Text HLabel 3200 5450 2    50   Input ~ 0
PLL0
Text HLabel 3200 4450 2    50   Input ~ 0
SYSCLK_IN
Text HLabel 5050 5100 0    50   Input ~ 0
SYSCLK_IN
Text HLabel 5050 5200 0    50   Input ~ 0
DEEM
Text HLabel 3200 5350 2    50   Input ~ 0
DEEM
Text HLabel 5050 5300 0    50   Input ~ 0
MUTE
Text HLabel 3200 5250 2    50   Input ~ 0
MUTE
Text HLabel 5050 5400 0    50   Input ~ 0
SFOR0
Text HLabel 5050 5500 0    50   Input ~ 0
SFOR1
Text HLabel 3200 4950 2    50   Input ~ 0
SFOR1
Text HLabel 3200 5050 2    50   Input ~ 0
SFOR0
$Comp
L saab_bluetooth_aux_kit-eagle-import:CAP_CERAMIC0805-NOOUTLINE C14
U 1 1 112581E6
P 7950 5550
F 0 "C14" V 7860 5599 50  0000 C CNN
F 1 "0.01uF" V 8040 5599 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7950 5550 50  0001 C CNN
F 3 "" H 7950 5550 50  0001 C CNN
	1    7950 5550
	1    0    0    -1  
$EndComp
$Comp
L saab_bluetooth_aux_kit-eagle-import:RESISTOR_0603_NOOUT R3
U 1 1 6C012852
P 1300 5650
F 0 "R3" H 1300 5750 50  0000 C CNN
F 1 "10k" H 1300 5650 40  0000 C CNB
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1300 5650 50  0001 C CNN
F 3 "" H 1300 5650 50  0001 C CNN
	1    1300 5650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4450 6050 4800
Wire Wire Line
	6050 5250 6050 4900
Wire Wire Line
	6600 6050 6600 5400
Connection ~ 6600 6050
Wire Wire Line
	6600 6050 6750 6050
Wire Wire Line
	6600 5400 6050 5400
Text Label 5150 2650 0    50   ~ 0
VDD_A
Text Label 5150 2750 0    50   ~ 0
VSS_A
Text Label 5150 3050 0    50   ~ 0
VSS_D
Text Label 5150 2950 0    50   ~ 0
VDD_D
Text Label 5650 4400 0    50   ~ 0
VDD_A
Text Label 5650 5800 0    50   ~ 0
VSS_A
Text Label 5550 5800 2    50   ~ 0
VSS_D
Text Label 5550 4400 2    50   ~ 0
VDD_D
Text HLabel 4050 1450 0    50   Input ~ 0
VIN
$Comp
L Device:CP_Small C11
U 1 1 5EED3246
P 7150 4450
F 0 "C11" V 7375 4450 50  0000 C CNN
F 1 "47uF" V 7284 4450 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_5x4.5" H 7150 4450 50  0001 C CNN
F 3 "~" H 7150 4450 50  0001 C CNN
	1    7150 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:CP_Small C12
U 1 1 5EED423F
P 7150 5250
F 0 "C12" V 7375 5250 50  0000 C CNN
F 1 "47uF" V 7284 5250 50  0000 C CNN
F 2 "Capacitor_SMD:CP_Elec_5x4.5" H 7150 5250 50  0001 C CNN
F 3 "~" H 7150 5250 50  0001 C CNN
	1    7150 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 4450 7050 4450
Wire Wire Line
	6050 5250 7050 5250
Wire Wire Line
	4850 1450 4050 1450
$EndSCHEMATC

EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1800 1350 0    79   ~ 0
2-channel I2S DAC based on dual MAX98357 chips.
$Comp
L custom_symbols:MAX98357A U6
U 1 1 5EEAACC6
P 2050 2550
F 0 "U6" H 2050 3365 50  0000 C CNN
F 1 "MAX98357A" H 2050 3274 50  0000 C CNN
F 2 "custom_footprints:MAX98357A" H 2100 2500 50  0001 C CNN
F 3 "" H 2100 2500 50  0001 C CNN
	1    2050 2550
	1    0    0    -1  
$EndComp
Text HLabel 2700 2350 2    50   Input ~ 0
VCC
Text HLabel 2700 2750 2    50   Input ~ 0
VCC
Text HLabel 1400 2450 0    50   Input ~ 0
VCC
Text HLabel 1400 2850 0    50   Input ~ 0
VDD
Text HLabel 1400 2950 0    50   Input ~ 0
VDD
Text HLabel 1400 2550 0    50   Input ~ 0
ENABLE
Text HLabel 2700 2250 2    50   Input ~ 0
BCLK
Text HLabel 2700 2450 2    50   Input ~ 0
LRCLK
Text HLabel 2700 2950 2    50   Input ~ 0
OUTP_L
Text HLabel 2700 2850 2    50   Input ~ 0
OUTN_L
$Comp
L custom_symbols:MAX98357A U7
U 1 1 5EEB2127
P 4700 2500
F 0 "U7" H 4700 3315 50  0000 C CNN
F 1 "MAX98357A" H 4700 3224 50  0000 C CNN
F 2 "custom_footprints:MAX98357A" H 4750 2450 50  0001 C CNN
F 3 "" H 4750 2450 50  0001 C CNN
	1    4700 2500
	1    0    0    -1  
$EndComp
Text HLabel 5350 2300 2    50   Input ~ 0
VCC
Text HLabel 5350 2700 2    50   Input ~ 0
VCC
Text HLabel 4050 2400 0    50   Input ~ 0
VCC
Text HLabel 4050 2800 0    50   Input ~ 0
VDD
Text HLabel 4050 2900 0    50   Input ~ 0
VDD
Text HLabel 5350 2200 2    50   Input ~ 0
BCLK
Text HLabel 5350 2400 2    50   Input ~ 0
LRCLK
Text HLabel 3600 2500 0    50   Input ~ 0
ENABLE
$Comp
L Device:R_Small R5
U 1 1 5EEB52B0
P 3700 2500
F 0 "R5" V 3896 2500 50  0000 C CNN
F 1 "210.2k" V 3805 2500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3700 2500 50  0001 C CNN
F 3 "~" H 3700 2500 50  0001 C CNN
	1    3700 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 2500 3800 2500
Text HLabel 1800 3400 0    50   Input ~ 0
VDD
Text HLabel 2250 3400 2    50   Input ~ 0
VCC
$Comp
L Device:C_Small C4
U 1 1 5EEB7A54
P 2050 3550
F 0 "C4" V 1821 3550 50  0000 C CNN
F 1 "0.1uF" V 1912 3550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 3550 50  0001 C CNN
F 3 "~" H 2050 3550 50  0001 C CNN
	1    2050 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5EEB7EDD
P 2050 3200
F 0 "C3" V 1821 3200 50  0000 C CNN
F 1 "10uF" V 1912 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2050 3200 50  0001 C CNN
F 3 "~" H 2050 3200 50  0001 C CNN
	1    2050 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 3400 1950 3400
Wire Wire Line
	1950 3400 1950 3550
Wire Wire Line
	1950 3400 1950 3200
Connection ~ 1950 3400
Wire Wire Line
	2150 3200 2150 3400
Wire Wire Line
	2150 3400 2250 3400
Wire Wire Line
	2150 3400 2150 3550
Connection ~ 2150 3400
Text HLabel 4450 3350 0    50   Input ~ 0
VDD
Text HLabel 4900 3350 2    50   Input ~ 0
VCC
$Comp
L Device:C_Small C6
U 1 1 5EEBEFFB
P 4700 3500
F 0 "C6" V 4471 3500 50  0000 C CNN
F 1 "0.1uF" V 4562 3500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 3500 50  0001 C CNN
F 3 "~" H 4700 3500 50  0001 C CNN
	1    4700 3500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5EEBF001
P 4700 3150
F 0 "C5" V 4471 3150 50  0000 C CNN
F 1 "10uF" V 4562 3150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4700 3150 50  0001 C CNN
F 3 "~" H 4700 3150 50  0001 C CNN
	1    4700 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 3350 4600 3350
Wire Wire Line
	4600 3350 4600 3500
Wire Wire Line
	4600 3350 4600 3150
Connection ~ 4600 3350
Wire Wire Line
	4800 3150 4800 3350
Wire Wire Line
	4800 3350 4900 3350
Wire Wire Line
	4800 3350 4800 3500
Connection ~ 4800 3350
Text HLabel 5350 2800 2    50   Input ~ 0
OUTN_R
Text HLabel 5350 2900 2    50   Input ~ 0
OUTP_R
Text HLabel 1400 2250 0    50   Input ~ 0
DIN
Text HLabel 4050 2200 0    50   Input ~ 0
DIN
Text Label 1400 2350 2    50   ~ 0
GAIN_SEL
Text Label 4050 2300 2    50   ~ 0
GAIN_SEL
Text Label 3350 1950 2    50   ~ 0
GAIN_SEL
$Comp
L Device:R_Small R4
U 1 1 5EF08E68
P 3350 2050
F 0 "R4" H 3409 2096 50  0000 L CNN
F 1 "100k" H 3409 2005 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 2050 50  0001 C CNN
F 3 "~" H 3350 2050 50  0001 C CNN
	1    3350 2050
	1    0    0    -1  
$EndComp
Text HLabel 3350 2150 0    50   Input ~ 0
VDD
$Comp
L Device:R_Small R3
U 1 1 5EF10F12
P 3350 1850
F 0 "R3" H 3409 1896 50  0000 L CNN
F 1 "100k" H 3409 1805 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3350 1850 50  0001 C CNN
F 3 "~" H 3350 1850 50  0001 C CNN
	1    3350 1850
	1    0    0    -1  
$EndComp
Text HLabel 3350 1750 0    50   Input ~ 0
VCC
$EndSCHEMATC
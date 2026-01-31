## 1. CLOCK (Standard)
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## 2. INPUTS (Using Switches & Buttons)

## Map 'Vout' (The Sensor) to SWITCH 0 (The first switch on the left/right)
set_property PACKAGE_PIN V17 [get_ports Vout]
set_property IOSTANDARD LVCMOS33 [get_ports Vout]

## Map 'reset' to CENTER BUTTON
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## 3. OUTPUTS (Using On-Board LEDs)

## Map 'red_led' (The Blinker) to LED 0
set_property PACKAGE_PIN U16 [get_ports red_led]
set_property IOSTANDARD LVCMOS33 [get_ports red_led]

## Map 'relay_output' (The Fan) to LED 1
set_property PACKAGE_PIN E19 [get_ports relay_output]
set_property IOSTANDARD LVCMOS33 [get_ports relay_output]

## Map 'green_led' (Safe Status) to LED 2
set_property PACKAGE_PIN U19 [get_ports green_led]
set_property IOSTANDARD LVCMOS33 [get_ports green_led]
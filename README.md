# fpga-health-indicator
A robust digital controller for appliance health monitoring featuring glitch filtering and safety latching, implemented on Artix-7 FPGA
## Project Overview
This project is a **Digital Health Monitor System** designed to detect overheating faults in industrial or home appliances. It features a robust digital control chain capable of filtering noise, latching critical faults, and driving visual/auditory alarms.

The design was verified via simulation and is set up for **Hardware Emulation** on the Artix-7 FPGA (Basys 3), using on-board switches to emulate analog sensor inputs.

## Features
* **Noise Rejection:** A 1000-cycle Digital Glitch Filter (`glitchfilter.v`) ignores transient electrical noise.
* **Metastability Protection:** A 2-stage Synchronizer (`synchronizer.v`) protects the clock domain from asynchronous inputs.
* **Safety Latch:** A Finite State Machine (`fsm.v`) locks the system into an ALARM state upon fault detection, preventing auto-restart until a manual reset is triggered.
* **Visual Alarm:** A 1Hz LED Blinker (`output_driver_blinker.v`) provides a clear visual warning.

## Architecture
**Top Level Structure:**
`Input (Switch/Sensor)` -> `Synchronizer` -> `Glitch Filter` -> `FSM` -> `Blinker` -> `LED Output`

![Design Notes](docs/fsm_design_notes.jpg)
*(Original design notes showing FSM states and Counter logic)*

## Simulation Results
The design was verified using Xilinx Vivado. The waveform below demonstrates the system correctly ignoring short noise pulses while triggering and latching on true faults.

![Waveform](docs/simulation_waveform.jpg)

## Hardware Mapping (Basys 3)
* **Sensor Input (Emulated):** Switch 0 (`sw[0]`)
* **Reset:** Center Button (`btnC`)
* **Alarm Output:** LED 0 (`led[0]`) - Blinking Red
* **Fan Control:** LED 1 (`led[1]`) - Solid On
* **Safe Status:** LED 2 (`led[2]`) - Solid Green

## How to Run
1.  Open **Vivado** and create a new project.
2.  Add all files from the `src/` folder as Design Sources.
3.  Add the `constraints.xdc` as the Constraint file.
4.  Run **Synthesis**, **Implementation**, and **Generate Bitstream**.
5.  Program the device and toggle Switch 0 to test.

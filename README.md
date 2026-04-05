# 🚦Crossroad Traffic Light Controller (SystemVerilog)

A high-reliability traffic management system designed for a four-way intersection using SystemVerilog. This project demonstrates modern RTL design practices, including modular architecture, parameterized components, and robust Finite State Machine (FSM) logic.

## 🚀Technical Highlights
* **Hierarchical Design:** Structured into a clean top-level wrapper `top_module` connecting specialized logic blocks.
* **Emergency Priority System:** Integrated `state_of_light` module to handle asynchronous emergency triggers with deterministic state transitions.
* **Rigorous Verification:** Includes a comprehensive SystemVerilog testbench `top_module_tb` covering normal cycles, emergency overrides, and edge-case scenarios.

## 📋System Overview
The controller manages two sets of traffic lights with the following default timing:
   * 🟢**Green:** 3 seconds.
   * 🟡**Yellow:** 3 seconds.
   * 🔴**Red:** 6 seconds. <br>
## 🔄**Operation Modes**
   * NORMAL: Lights follow a synchronized sequence (Green -> Yellow -> Red).
   * EMER_1: Prioritizes Road 1 (Road 1 stays Green, Road 2 stays Red).
   * EMER_2: Prioritizes Road 2 (Road 2 stays Green, Road 1 stays Red).

## FSM of traffic light
![my_sreenshot](https://github.com/nghitrung/Crossroad-Traffic-Light/blob/main/images/FSM_traffic_light.png)

## FSM of state light
![my_sreenshot](https://github.com/nghitrung/Crossroad-Traffic-Light/blob/main/images/Screenshot%202026-04-05%20233028.png)

## FSM of timer 
![my_sreenshot](https://github.com/nghitrung/Crossroad-Traffic-Light/blob/main/images/FSM_timer.png)

## 📂 File Structure
* `top_module.sv`: The main system wrapper integrating the state controller and light modules.
* `state_of_light.sv`: Global state controller managing transition between Normal and Emergency modes.
* `traffic_light.sv`: Parameterized module defining the timing logic and LED output for each road.
* `top_module_tb.sv`: Testbench for functional verification.

## 💻Requiremeents:
* Software: Xilinx Vivado Design Suite
* Languate: SystemVerilog

## 📉Simulation Results
![my_sreenshot](https://github.com/nghitrung/Crossroad-Traffic-Light/blob/main/images/Screenshot%202026-04-05%20192109.png)

## Authors
- [@ng_trung1405](https://github.com/nghitrung)


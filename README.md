# Crossroad Traffic Light Controller (SystemVerilog)

A high-reliability traffic management system designed for a four-way intersection using SystemVerilog. This project demonstrates modern RTL design practices, including modular architecture, parameterized components, and robust Finite State Machine (FSM) logic.

## Technical Highlights
* **Hierarchical Design:** Structured into a clean top-level wrapper `top_module` connecting specialized logic blocks.
* **Emergency Priority System:** Integrated `state_of_light` module to handle asynchronous emergency triggers with deterministic state transitions.
* **Rigorous Verification:** Includes a comprehensive SystemVerilog testbench `top_module_tb` covering normal cycles, emergency overrides, and edge-case scenarios.

## System Overview
The controller manages two sets of traffic lights with the following default timing:
    * **Green:** 3 seconds.
    * **Yellow:** 3 seconds.
    * **Red:** 6 seconds.
* **Operation Modes**
   * NORMAL: Lights follow a synchronized sequence (Green -> Yellow -> Red).
   * EMER_1: Prioritizes Road 1 (Road 1 stays Green, Road 2 stays Red).
   * EMER_2: Prioritizes Road 2 (Road 2 stays Green, Road 1 stays Red).

## System Architecture
The project follows a modular hierarchical approach:
* `TopModule.v`: The main wrapper connecting all components.
* `state_of_light.v`: Controls the global state (Normal vs. Emergency).
* `traffic_light_1.v` & `traffic_light_2.v`: Manage individual light sequences and local counters.
* `seven_segment_display.v`: Converts binary counters into 7-segment LED signals.

## Simulation Results


## Members
* **Tran Minh Tuong**
* **Nguyen Hieu Trung** 
* **Ho Ngoc Quynh Anh** 
* **Phuong Xuong Duc** 
* **Pham Minh Nhat** 

---
© 2026 HCMUT - Faculty of Computer Science and Engineering[cite: 1, 11].

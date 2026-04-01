# Crossroad Traffic Light Controller (Verilog HDL)

A functional traffic light management system designed for a four-way intersection using Verilog HDL. This project was developed as an assignment for the **Digital Design with HDL** course at **Ho Chi Minh City University of Technology (HCMUT)**.

## Highlights
* **Hierarchical Design**: Structured into manageable modules for easier debugging and integration.
* **Emergency Handling**: Specialized logic to prioritize specific directions during emergency situations (`emer1`, `emer2`).
* **Countdown Display**: Integrated 7-segment display logic to show real-time countdown for traffic participants.
* **State Machine Logic**: Robust Finite State Machine (FSM) implementation to manage complex light sequences.

## Overview
The system controls two sets of traffic lights (TFL1 and TFL2) at a crossroad. 
* **Normal Mode Timing**: 
    * Green: 3 seconds.
    * Yellow: 3 seconds.
    * Red: 6 seconds.
* **Target Hardware**: Designed for FPGA boards, specifically optimized for the **Arty-7**.

## System Architecture
The project follows a modular hierarchical approach:
* `TopModule.v`: The main wrapper connecting all components.
* `state_of_light.v`: Controls the global state (Normal vs. Emergency).
* `traffic_light_1.v` & `traffic_light_2.v`: Manage individual light sequences and local counters.
* `seven_segment_display.v`: Converts binary counters into 7-segment LED signals.

## Requirements
* **Software**: Xilinx Vivado Design Suite.
* **Language**: Verilog HDL.

## Test Cases
| Scenario | Inputs | Expected Result |
| :--- | :--- | :--- |
| **Normal Cycle** | `rst=0`, `emer1=0`, `emer2=0` | Lights cycle Green -> Yellow -> Red. |
| **Emergency 1** | `emer1=1`, `emer2=0` | Light 1 stays **Green**, Light 2 stays **Red**. |
| **Emergency 2** | `emer1=0`, `emer2=1` | Light 2 stays **Green**, Light 1 stays **Red**. |
| **Collision Prevention**| `emer1=1`, `emer2=1` | Both lights stay **Green** then turn off for safety. |
| **Reset** | `rst=1` | All displays and lights turn **Off**. |

## Members
* **Tran Minh Tuong**
* **Nguyen Hieu Trung** 
* **Ho Ngoc Quynh Anh** 
* **Phuong Xuong Duc** 
* **Pham Minh Nhat** 

---
© 2026 HCMUT - Faculty of Computer Science and Engineering[cite: 1, 11].
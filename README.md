# 🚦 Smart 4-Way Traffic Light Controller using Verilog HDL

> A modular, synthesizable RTL implementation of a four-way traffic light controller with emergency vehicle priority, designed using Verilog HDL and verified in Xilinx Vivado.

![Verilog](https://img.shields.io/badge/Language-Verilog-blue)
![Vivado](https://img.shields.io/badge/Tool-Xilinx%20Vivado-red)
![RTL](https://img.shields.io/badge/Design-RTL-green)
![FSM](https://img.shields.io/badge/Architecture-Moore%20FSM-orange)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

# 📖 Project Overview

This project implements a **Smart 4-Way Traffic Light Controller** using a **Moore Finite State Machine (FSM)**.

The controller manages traffic at a four-way intersection by allowing one direction to move at a time while keeping the remaining directions at red.

An **Emergency Vehicle Priority System** is integrated to immediately grant right-of-way to emergency vehicles detected on any road.

The design is fully **RTL synthesizable** and follows a modular hardware architecture suitable for FPGA implementation.

---

# ✨ Features

- 🚦 Four-Way Traffic Signal Controller
- 🔄 Moore Finite State Machine
- 🚑 Emergency Vehicle Priority
- ⚙️ Fully Synthesizable Verilog RTL
- 🧩 Modular Design
- ⏱ Counter-Based Timing
- 🧪 Behavioral Simulation in Vivado
- 📈 Easy to Extend

---

# 🏗 Project Architecture


<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/f5e43eb3-cf89-4ffc-ab67-118f14be6c01" />

---

# 📂 Project Structure

```
Smart-Traffic-Controller
│
├── traffic_controller.v
├── emergency_controller.v
├── priority_encoder.v
├── top.v
├── top_tb.v
└── README.md
```

---

# 🚦 Normal Traffic Sequence

```
North Green
      ↓
North Yellow
      ↓
East Green
      ↓
East Yellow
      ↓
South Green
      ↓
South Yellow
      ↓
West Green
      ↓
West Yellow
      ↓
Repeat
```

---

# 🚑 Emergency Vehicle Operation

When an emergency vehicle is detected on any road:

- The Priority Encoder identifies the highest-priority emergency request.
- The Emergency Controller takes control of the traffic lights.
- The selected direction receives a **GREEN** signal.
- All remaining directions remain **RED**.
- Once the emergency clears, control returns to the normal traffic controller.

Priority Order:

```
North
   ↓
East
   ↓
South
   ↓
West
```

---

# ⚙️ Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| reset | Active High Reset |
| north_emg | North Emergency Sensor |
| east_emg | East Emergency Sensor |
| south_emg | South Emergency Sensor |
| west_emg | West Emergency Sensor |

---

# 🚥 Outputs

Each direction uses a 2-bit encoding.

| Binary | Light |
|---------|-------|
| 00 | 🔴 RED |
| 01 | 🟡 YELLOW |
| 10 | 🟢 GREEN |

Outputs:

```
north
east
south
west
```

---

# 🧠 FSM States

| State | Description |
|--------|-------------|
| S0 | North Green |
| S1 | North Yellow |
| S2 | East Green |
| S3 | East Yellow |
| S4 | South Green |
| S5 | South Yellow |
| S6 | West Green |
| S7 | West Yellow |

---

# 🛠 Tools Used

- Verilog HDL
- Xilinx Vivado
- XSim Simulator

---

# ▶️ How to Run

1. Open Xilinx Vivado.
2. Create a new RTL Project.
3. Add all Verilog source files.
4. Set `top.v` as the top module.
5. Add `top_tb.v` as the simulation source.
6. Run **Behavioral Simulation**.
7. Verify the waveform.
8. Run **Synthesis**.
9. Review RTL schematic and utilization reports.

---

# 📊 Simulation

Behavioral simulation verifies:

- Correct FSM state transitions
- Emergency vehicle priority
- Proper light sequencing
- Return to normal operation after emergency

<img width="1068" height="752" alt="Simulation_V2" src="https://github.com/user-attachments/assets/f6a9a272-ea4f-4045-b0cf-10936884259c" />


---

# 🔮 Future Improvements

- Adaptive traffic timing using vehicle density sensors
- Pedestrian crossing support
- Night mode
- Emergency request queue (instead of fixed priority)
- FPGA implementation on Xilinx Artix-7
- Seven-segment countdown timer
- UART-based traffic monitoring

---

# 📚 Concepts Demonstrated

- Finite State Machines (FSM)
- Moore Machine Design
- RTL Coding Style
- Modular Hardware Design
- Priority Encoding
- Multiplexer-Based Output Selection
- Sequential Logic
- Combinational Logic
- Digital System Design

---

# 👨‍💻 Author

**Manish**

Electronics Engineering Student

Interested in:

- RTL Design
- Digital Design
- FPGA Development
- ASIC Design
- VLSI

---

## ⭐ If you found this project useful, consider giving it a star!

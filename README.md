# SystemVerilog Class-Based Verification Environment for Memory DUT

This repository contains a complete, object-oriented verification environment built in **SystemVerilog** to verify a 16x32-bit Memory module. The testbench utilizes a modular architecture with mailboxes for inter-process communication, functional coverage for verification tracking, and a reference model scoreboard for automated checking.

## Memory Design
<img width="1536" height="1024" alt="image" src="https://github.com/user-attachments/assets/beeadfdd-aeea-4969-b60f-381c0f5e3117" />

## 🔍 Architecture Overview
The environment is structured into several key components:
* **Transaction**: Defines the data object (Data, Address, Control signals).
* **Sequencer**: Generates randomized stimulus (Write and Read sequences).
* **Driver**: Fetches transactions from the sequencer and drives them to the virtual interface.
* **Monitor**: Samples the interface signals and broadcasts them to the scoreboard and subscriber.
* **Scoreboard**: Implements a reference model (associative array) to compare expected vs. actual data.
* **Subscriber**: Handles functional coverage to ensure all addresses and corner cases are tested.
* **Environment**: Encapsulates all components and manages the simulation phases.

## 🛠 Features
* **Clocking Blocks & Modports**: Used in the interface to prevent race conditions and define signal directions.
* **Mailbox-based Communication**: Robust IPC between components.
* **Functional Coverage**: Tracks coverage for Reset, EN, Address, Data_In, and Valid_Out signals.
* **Automated Testing**: The scoreboard automatically reports Pass/Fail status for every read operation.

## 📁 File Structure
* `memory.sv`: The Design Under Test (DUT).
* `interface.sv`: SystemVerilog interface with clocking blocks.
* `package.sv`: Bundles all class definitions into a single package.
* `tbench.sv`: Top-level simulation module (instantiates intf and memory).
* `run.do`: Tcl script for automated compilation and simulation in QuestaSim.

## 🚀 How to Run
1. Ensure you have a SystemVerilog simulator (e.g., Questasim/ModelSim).
2. Run the provided script:
   ```bash
   do run.do

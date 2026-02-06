# SystemVerilog Class-Based Verification Environment for Memory DUT

This repository contains a complete, object-oriented verification environment built in **SystemVerilog** to verify a 16x32-bit Memory module. The testbench utilizes a modular architecture with mailboxes for inter-process communication, functional coverage for verification tracking, and a reference model scoreboard for automated checking.

## 🔍 Architecture Overview
The environment is structured into several key components:
* [cite_start]**Transaction**: Defines the data object (Data, Address, Control signals)[cite: 46].
* [cite_start]**Sequencer**: Generates randomized stimulus (Write and Read sequences)[cite: 48, 52].
* [cite_start]**Driver**: Fetches transactions from the sequencer and drives them to the virtual interface[cite: 3, 4].
* [cite_start]**Monitor**: Samples the interface signals and broadcasts them to the scoreboard and subscriber[cite: 26, 32].
* [cite_start]**Scoreboard**: Implements a reference model (associative array) to compare expected vs. actual data[cite: 36, 42].
* [cite_start]**Subscriber**: Handles functional coverage to ensure all addresses and corner cases are tested[cite: 57, 65].
* [cite_start]**Environment**: Encapsulates all components and manages the simulation phases[cite: 6, 10].

## 🛠 Features
* [cite_start]**Clocking Blocks & Modports**: Used in the interface to prevent race conditions and define signal directions[cite: 14, 15].
* [cite_start]**Mailbox-based Communication**: Robust IPC between components[cite: 7].
* [cite_start]**Functional Coverage**: Tracks coverage for Reset, EN, Address, Data_In, and Valid_Out signals [cite: 58-64].
* [cite_start]**Automated Testing**: The scoreboard automatically reports Pass/Fail status for every read operation[cite: 42, 43].

## 📁 File Structure
* [cite_start]`memory.sv`: The Design Under Test (DUT)[cite: 18].
* [cite_start]`interface.sv`: SystemVerilog interface with clocking blocks[cite: 13].
* [cite_start]`package.sv`: Bundles all class definitions into a single package[cite: 33].
* [cite_start]`environment.svh`: High-level testbench wrapper[cite: 6].
* [cite_start]`run.do`: Tcl script for automated compilation and simulation in QuestaSim[cite: 34].

## 🚀 How to Run
1. Ensure you have a SystemVerilog simulator (e.g., Questasim/ModelSim).
2. Run the provided script:
   ```bash
   do run.do

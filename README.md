// 8-Bit Simple Processor (Verilog HDL)

// Overview
This project presents the design and implementation of an 8-bit simple processor developed using Verilog HDL for educational and learning purposes. The processor follows a RISC-like architecture and implements a fetch–decode–execute instruction cycle.

It is intended to help students and beginners understand fundamental concepts of processor architecture, instruction sets, and digital design.

---

// Objectives
- Design a basic 8-bit processor architecture
- Implement a small but functional instruction set
- Understand the fetch–decode–execute cycle
- Verify processor functionality using simulation

---

// Processor Architecture
The processor consists of the following main components:
- Arithmetic Logic Unit (ALU) – Performs arithmetic and logical operations
- Register File – Stores temporary operands (regA, regB)
- Program Counter (PC) – Holds address of the next instruction
- Instruction Decoder – Decodes opcode and generates control signals
- Memory Unit – Stores instructions and data

---

// Instruction Cycle
1. Fetch – Instruction is fetched from memory using PC  
2. Decode – Opcode and operands are decoded  
3. Execute – ALU or memory operation is performed  
4. Update PC – PC increments or jumps to new address  

---

// Instruction Set

| Opcode | Instruction |     Description      |
|--------|-------------|----------------------|
|  000   |     ADD     |  regA = regA + regB  |
|  001   |     SUB     |  regA = regA - regB  |
|  010   |     AND     |  regA = regA & regB  |
|  011   |     OR      |  regA = regA \| regB |
|  100   |     XOR     |  regA = regA ^ regB  |
|  101   |     LOAD    |  regA = mem[address] |
|  110   |     STORE   |  mem[address] = regA |
|  111   |     JMP     |  PC = address        |

---

// Verilog Modules

// `alu.v`
Implements arithmetic and logical operations based on opcode.

// `opcodes.v`
Contains opcode definitions for all supported instructions.

// `processor.v`
Top-level processor module integrating:
- ALU
- Registers
- Program Counter
- Instruction Decoder
- Memory

// `processor_tb.v`
Testbench used for simulation and verification.

---

// Simulation & Testing
- Simulation performed using  Vivado Simulator
- Testbench applies instruction sequences (LOAD, ADD, STORE, JMP)
- Waveforms are generated to verify:
  - PC updates
  - ALU operations
  - Memory read/write behavior

---

// Tools Used
- Verilog HDL

---

// How to Run
1. Compile all Verilog files
2. Run `processor_tb.v`
3. Observe waveform output
4. Verify register and memory behavior

---

// Results
- Correct execution of arithmetic, logical, memory, and jump instructions
- Proper fetch–decode–execute operation verified via simulation

---

// Future Enhancements
- Add status flags (Zero, Carry, Overflow)
- Introduce pipelining
- Expand instruction set
- Separate instruction and data memory
- FPGA implementation

---


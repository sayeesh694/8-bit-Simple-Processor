`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: PAAVAN SAYEESH KUMAR ANKAM
// 
// Create Date: 01/28/2026 07:00:57 PM
// Design Name: 8_BIT_SIMPLE_PROCESSOR
// Module Name: opcodes
// Description: Design and simulation of an 8-bit RISC-like processor using Verilog HDL 
//              with a simple instruction set and fetch-decode-execute cycle.
//
// 
//////////////////////////////////////////////////////////////////////////////////

`define OPCODE_ADD 3'b000 
`define OPCODE_SUB 3'b001 
`define OPCODE_AND 3'b010 
`define OPCODE_OR  3'b011 
`define OPCODE_XOR 3'b100 
`define OPCODE_LOAD 3'b101 
`define OPCODE_STORE 3'b110 
`define OPCODE_JMP 3'b111

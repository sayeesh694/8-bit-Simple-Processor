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

 
module Processor_tb; 
  reg clk, rst; 
  reg [7:0] instruction, data_in; 
  wire [7:0] data_out, address_out; 
 
 
  Processor dut ( 
    .clk(clk), 
    .rst(rst), 
    .instruction(instruction), 
    .data_in(data_in), 
    .data_out(data_out), 
    .address_out(address_out) 
  ); 
 
  initial begin 
    clk = 0; 
    forever #5 clk = ~clk; 
  end 
 
  initial begin 
    rst = 1; 
    instruction = 8'h00; 
    data_in = 8'h00; 
    #10; 
    rst = 0; 
 
    instruction = {`OPCODE_LOAD, 5'd10}; #10; 
    instruction = {`OPCODE_STORE, 5'd11}; #10; 
    instruction = {`OPCODE_LOAD, 5'd12}; #10; 
    instruction = {`OPCODE_ADD, 5'd2}; #10; 
    instruction = {`OPCODE_STORE, 5'd03}; #10; 
    instruction = {`OPCODE_JMP, 5'd0}; #10; 
 
    #100; 
    $finish; 
  end 
 
  initial begin 
    $dumpfile("processor_tb.vcd"); 
    $dumpvars(0, Processor_tb); 
  end 
 
  initial begin 
    $monitor("Time=%t, PC=%h, Instruction=%b, regA=%h, regB =%h", $time, dut.regPC, instruction, 
dut.regA, dut.regB); 
   end 
endmodule

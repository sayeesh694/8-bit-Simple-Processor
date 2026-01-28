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

 
`include "opcodes.v" 
 
module Processor ( 
  input clk, 
  input rst, 
  input [7:0] instruction, 
  input [7:0] data_in, 
  output reg [7:0] data_out, 
  output reg [7:0] address_out 
); 
 
  reg [7:0] regA, regPC; 
  wire [7:0] alu_result; 
  wire [2:0] opcode; 
  wire [7:0] regB; 
  assign  regB =   instruction [4:0];  
  reg [7:0] mem[0:31];  
    
  
  assign opcode = instruction[7:5]; 
 
  ALU alu ( 
    .a(regA), 
    .b(regB), 
    .opcode(opcode[2:0]), 
    .result(alu_result) 
  ); 
 integer i; 
  always @(posedge clk or posedge rst) begin 
    if (rst) begin 
      regA <= 8'h00; 
      //regB <= 8'h00; 
      regPC <= 8'h00; 
      data_out <= 8'h00; 
      address_out <= 8'h00; 
      mem[ 0] <= 8'haf; 
      mem[ 1] <= 8'h0e; 
      mem[ 2] <= 8'h2d; 
      mem[ 3] <= 8'h3a; 
      mem[ 4] <= 8'h4c; 
      mem[ 5] <= 8'h5f; 
      mem[ 6] <= 8'h67; 
      mem[ 7] <= 8'h90; 
      mem[ 8] <= 8'h00; 
      mem[ 9] <= 8'haa; 
      mem[10] <= 8'hbb; 
      mem[11] <= 8'hcc; 
      mem[12] <= 8'hdd; 
      mem[13] <= 8'hee; 
      mem[14] <= 8'hff; 
      mem[15] <= 8'h01;  
 
      for (i=16; i <=31; i=i+1) begin 
       mem[i] <= 0; 
      end 
       
    end else begin 
      case (opcode) 
        `OPCODE_ADD: begin 
          regA <= alu_result; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_SUB: begin 
          regA <= alu_result; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_AND: begin 
          regA <= alu_result; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_OR: begin 
          regA <= alu_result; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_XOR: begin 
          regA <= alu_result; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_LOAD: begin 
          regA <= mem[instruction[4:0]]; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_STORE: begin 
          mem[instruction[4:0]] <= regA; 
          regPC <= regPC + 1; 
        end 
        `OPCODE_JMP: begin 
          regPC <= instruction[4:0]; 
        end 
        default: begin 
          regPC <= regPC + 1; 
        end 
      endcase 
    end 
  end 
 
  always @(posedge clk) begin 
      address_out <= regPC; 
       
      data_out <= alu_result;//mem[regPC]; 
  end 
 
endmodule 

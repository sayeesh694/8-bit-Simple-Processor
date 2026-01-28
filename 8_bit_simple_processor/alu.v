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
 
module ALU ( 
  input [7:0] a, 
  input [7:0] b, 
  input [2:0] opcode, 
  output reg [7:0] result 
); 
 
  always @(*) begin 
    case (opcode) 
      3'b000: result = a + b; 
      3'b001: result = a - b; 
      3'b010: result = a & b; 
      3'b011: result = a | b; 
      3'b100: result = a ^ b; 
      default: result = 8'h00; 
    endcase 
  end 
 
endmodule 

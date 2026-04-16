`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 14:25:58
// Design Name: 
// Module Name: alu_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module alu_decoder (
    input  [1:0] aluop,
    input  [2:0] funct3,
    input  [6:0] op,
    input  [6:0] funct7,
    output [2:0] alucntrl
);
    wire [1:0] x = {op[5], funct7[5]};

    assign alucntrl = (aluop == 2'b00) ? 3'b000 :
                      (aluop == 2'b01) ? 3'b001 :
                      // funct3=000 → ADD/SUB (was wrongly 3'b110)
                      ((aluop == 2'b10) & (funct3 == 3'b000) & (x == 2'b11)) ? 3'b001 : // SUB
                      ((aluop == 2'b10) & (funct3 == 3'b000) & (x != 2'b11)) ? 3'b000 : // ADD
                      ((aluop == 2'b10) & (funct3 == 3'b010))                 ? 3'b101 : // SLT
                      ((aluop == 2'b10) & (funct3 == 3'b110))                 ? 3'b011 : // OR
                      ((aluop == 2'b10) & (funct3 == 3'b111))                 ? 3'b010 : // AND
                                                                                3'b000;
endmodule

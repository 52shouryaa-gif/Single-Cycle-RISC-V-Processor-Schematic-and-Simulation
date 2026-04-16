`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2026 10:39:18
// Design Name: 
// Module Name: extend
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


module extend(
    input [31:0] instre,
    input  immsrc1,
    output [31:0] imnext
    );
  

assign imnext = (immsrc1 == 1'b0) ? {{20{instre[31]}}, instre[31:25], instre[11:7]} : 
                         {{20{instre[31]}}, instre[31:20]};    
  
endmodule

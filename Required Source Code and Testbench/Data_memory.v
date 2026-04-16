`timescale 1ns / 1ps


module Data_memory(
    input [31:0] ad,
      input clk,rst,
    input [31:0] WD,
    input WE,
    output [31:0] readdata
    );
    
  reg [31:0] mem [1023:0];
  
  always @(posedge clk) begin
  if(WE)
  mem[ad] = WD;
  end
  assign readdata = (~rst) ? 32'd0:mem[ad];
   
endmodule

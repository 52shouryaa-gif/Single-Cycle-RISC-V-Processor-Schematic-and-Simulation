`timescale 1ns / 1ps
module PC_top(
    input [31:0] pcnext,
    output reg [31:0] pc,
    input clk,rst
    );
    always @ (posedge clk) 
    begin
    
    if(~rst)
    pc <= {32{1'b0}} ;
    else
    pc <= pcnext;
    
    end
    
endmodule

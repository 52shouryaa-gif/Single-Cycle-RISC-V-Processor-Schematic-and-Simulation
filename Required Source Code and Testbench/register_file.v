`timescale 1ns / 1ps

module register_file(
    input [4:0] a1,
    input [4:0] a2,
    input [4:0] a3,
    input [31:0] wd3,
    input clk,rst,
    input we3,
    output [31:0] rd1,
    output [31:0] rd2
    );
    reg [31:0] register[31:0];
    always @(posedge clk) begin
    if(we3) begin 
       register[a3] <= wd3;
    end
    end
    
    assign rd1 = (~rst)? 32'd0 : register[a1];
    assign rd2 = (~rst) ? 32'd0 : register [a2];
    initial begin
        register[0] = 32'h00000000;
        register[1] = 32'h00000001;
        register[2] = 32'h00000002;
        register[3] = 32'h00000003;
        register[4] = 32'h00000004;
        register[5] = 32'h00000005;
        register[6] = 32'h00000004;
    end
endmodule

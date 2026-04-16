`timescale 1ns / 1ps
module mux(
    input [31:0] a,
    input [31:0] b,
    output [31:0] d,
    input c
    );
    assign d = ~c?a:b;
endmodule

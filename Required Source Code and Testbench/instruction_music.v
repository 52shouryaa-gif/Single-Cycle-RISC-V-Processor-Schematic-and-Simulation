`timescale 1ns / 1ps
module instruction_music(
    input [31:0] a,
    input rst,
    output [31:0] rd
    );
    reg [31:0] mem [1023:0];
   assign rd = (~rst) ? {32{1'b0}}:mem[a[31:2]];
  initial begin
      mem[0] = 32'h0062E3B3;
  end
endmodule

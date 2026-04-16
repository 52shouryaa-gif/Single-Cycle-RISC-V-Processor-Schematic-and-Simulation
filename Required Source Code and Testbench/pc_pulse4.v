`timescale 1ns / 1ps
module pc_pulse4(
    input [31:0] pcpul,
    input [31:0] add4,
    output [31:0] pcpul4
    );
    assign pcpul4 = add4 + pcpul;
endmodule

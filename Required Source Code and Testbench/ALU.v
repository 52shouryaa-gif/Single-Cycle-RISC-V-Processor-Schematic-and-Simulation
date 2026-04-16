`timescale 1ns / 1ps


module ALU(
    input [31:0] srca,
    input [31:0] srcb,
    input [2:0] alu_cntrl,
    output carry , overflow , negative , zero ,
    output [31:0] aluresult
    );
    
    wire [31:0] sum;
    wire cout;
  
    assign {cout , sum} = (alu_cntrl[0] == 1'b1)? (srca + (~srcb) + 1):srca + srcb;
    
    assign aluresult = (alu_cntrl == 3'b000)?sum:
                       (alu_cntrl == 3'b001)?sum:
                       (alu_cntrl == 3'b010)?srca & srcb:
                       (alu_cntrl == 3'b011)?srca | srcb:
                       (alu_cntrl == 3'b101)?{{31{1'b0}},(sum[31])}:{32{1'b0}};
    assign overflow = (sum[31]^srca[31]) & alu_cntrl[1]&(~(alu_cntrl[0]^srca[31]^srcb[31]));
    
    assign carry = ((~alu_cntrl[1])&cout);
    
    assign zero = &(~aluresult[31]);
    
    assign negative = aluresult[31];
    
    
endmodule

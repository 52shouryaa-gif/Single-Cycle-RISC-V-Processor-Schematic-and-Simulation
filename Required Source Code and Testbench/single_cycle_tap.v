`timescale 1ns / 1ps
module single_cycle_tap(
    input clk,
    input rst
    );
    wire [1:0] immsrc_top ;
    wire [31:0] rd_top, pc_top , pcplus4 , rd1_top , rd2_top,srcbrtype , Readdata , aluresult_top ,  immext_top , add4 , result_mux;
    wire zerotop , carry , overflow , negative , memwrite_top , branch;
    wire  regwrite_top , PCsrc , resultsrc,alusrc;  
    wire [2:0] alu_cntrl_top ;
    
    Data_memory Data_memory(
    .ad(aluresult_top),
    .clk(clk),
    .rst(rst),
    .WD(rd2_top),
    .WE(memwrite_top),
    .readdata(Readdata)
    );
    /////////////////////////////
    mux data_mem_to_reg(
    .a(aluresult_top),
    .b(Readdata),
    .c(resultsrc),
    .d(result_mux)
    );
   ///////////////////////////// 
    ALU ALU(
    .srca(rd1_top),
    .srcb(srcbrtype),
    .alu_cntrl(alu_cntrl_top),
    .carry(carry ),.overflow( overflow) , .negative(negative) , .zero(zero_top) ,
    .aluresult(aluresult_top)
    );
   /////////////////////////// 
    instruction_music instruction_music(
    .a(pc_top),
    .rst(rst),
    .rd(rd_top)
    );
    //////////////////////
    pc_pulse4 pc_pulse4(
    .pcpul(pc_top),
    .add4(add4),
    .pcpul4(pcplus4)
    );
    /////////////////////////
    extend extend(
    .instre(rd_top),
    .immsrc1(immsrc_top[0]),
    .imnext(immext_top)
    );
    //////////////////////
    register_file register_file(
    .a1(rd_top[19:15]),
    .a2(rd_top[24:20]),
    .a3(rd_top[11:7]),
    .wd3(result_mux),
    .clk(clk),
    .rst(rst),
    .we3(regwrite_top),
    .rd1(rd1_top),
    .rd2(rd2_top)
    );
    ///////////////////////////////////
    mux register_to_alu(
    .a(rd2_top),
    .b(immext_top),
    .c(alusrc),
    .d(srcbrtype)
    );
    ///////////////////cntrl top //////
   control_top control_top( 
.opmain(rd_top[31:25]),
.funct3(rd_top[14:12]), 
.funct7(rd_top[6:0]),
.zero(zero_top),
.PCsrc(PCsrc),
.resultsrc(resultsrc),
.memwrite(memwrite_top),
.alusrc(alusrc),
.immsrc(immsrc_top),
.regwrite(regwrite_top),
.branch(branch),
.alucntrl(alu_cntrl_top)
);
//////////////////////////////

PC_top PC_top(
 .pcnext(pcplus4),
    .pc(pc_top),
    .clk(clk),
    .rst(rst)
    );

endmodule

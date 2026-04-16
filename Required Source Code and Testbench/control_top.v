module control_top (
    input  [6:0] opmain,
    input  [2:0] funct3,
    input  [6:0] funct7,
    input        zero,
    output       PCsrc,
    output       resultsrc,
    output       memwrite,
    output       alusrc,
    output [1:0] immsrc,
    output       regwrite,
    output       branch,
    output [2:0] alucntrl
);
    wire [1:0] aluop;

    main_decoder main_decoder (
        .opmain   (opmain),
        .zero     (zero),       // was missing
        .PCsrc    (PCsrc),
        .branch   (branch),
        .resultsrc(resultsrc),
        .memwrite (memwrite),
        .alusrc   (alusrc),
        .immsrc   (immsrc),
        .regwrite (regwrite),
        .aluop    (aluop)
    );

    alu_decoder alu_decoder (
        .aluop   (aluop),
        .funct3  (funct3),
        .op      (opmain),      // was undeclared 'op'
        .funct7  (funct7),
        .alucntrl(alucntrl)
    );
endmodule
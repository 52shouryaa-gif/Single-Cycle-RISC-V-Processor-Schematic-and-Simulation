module main_decoder (
    input  [6:0] opmain,
    input        zero,
    output       PCsrc,
    output       resultsrc,
    output       memwrite,
    output       alusrc,
    output [1:0] immsrc,
    output       regwrite,
    output       branch,        // added to port list
    output [1:0] aluop
);
    assign regwrite  = (opmain == 7'b0000011 | opmain == 7'b0110011) ? 1'b1 : 1'b0;
    assign alusrc    = (opmain == 7'b0000011 | opmain == 7'b0100011) ? 1'b1 : 1'b0;
    assign memwrite  = (opmain == 7'b0100011) ? 1'b1 : 1'b0;
    assign resultsrc = (opmain == 7'b0000011) ? 1'b1 : 1'b0;
    assign branch    = (opmain == 7'b1100011) ? 1'b1 : 1'b0;
    assign PCsrc     = branch & zero;               // was missing

    assign immsrc = (opmain == 7'b0000011) ? 2'b00 :
                    (opmain == 7'b0100011) ? 2'b01 :
                                             2'b10;

    assign aluop  = (opmain == 7'b1100011) ? 2'b01 :
                    (opmain == 7'b0110011) ? 2'b10 :
                                             2'b00;
                                      
endmodule


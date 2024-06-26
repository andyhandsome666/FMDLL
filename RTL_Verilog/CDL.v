`include "DDC.v"
module CDL (
    input clk_mid,
    input [15:0] T,
    input [15:0] Tb,
    output clk_coarse_out
);
    wire [15:0] P1_out;
    wire [15:0] P2_in;
    DDC DDC1 (.I(clk_mid), .T(T[0]), .Tb(Tb[0]), .P2(P2_in[0]), .O(clk_coarse_out), .P1(P1_out[0]));
    DDC DDC2 (.I(P1_out[0]), .T(T[1]), .Tb(Tb[1]), .P2(P2_in[1]), .O(P2_in[0]), .P1(P1_out[1]));
    DDC DDC3 (.I(P1_out[1]), .T(T[2]), .Tb(Tb[2]), .P2(P2_in[2]), .O(P2_in[1]), .P1(P1_out[2]));
    DDC DDC4 (.I(P1_out[2]), .T(T[3]), .Tb(Tb[3]), .P2(P2_in[3]), .O(P2_in[2]), .P1(P1_out[3]));
    DDC DDC5 (.I(P1_out[3]), .T(T[4]), .Tb(Tb[4]), .P2(P2_in[4]), .O(P2_in[3]), .P1(P1_out[4]));
    DDC DDC6 (.I(P1_out[4]), .T(T[5]), .Tb(Tb[5]), .P2(P2_in[5]), .O(P2_in[4]), .P1(P1_out[5]));
    DDC DDC7 (.I(P1_out[5]), .T(T[6]), .Tb(Tb[6]), .P2(P2_in[6]), .O(P2_in[5]), .P1(P1_out[6]));
    DDC DDC8 (.I(P1_out[6]), .T(T[7]), .Tb(Tb[7]), .P2(P2_in[7]), .O(P2_in[6]), .P1(P1_out[7]));
    DDC DDC9 (.I(P1_out[7]), .T(T[8]), .Tb(Tb[8]), .P2(P2_in[8]), .O(P2_in[7]), .P1(P1_out[8]));
    DDC DDC10 (.I(P1_out[8]), .T(T[9]), .Tb(Tb[9]), .P2(P2_in[9]), .O(P2_in[8]), .P1(P1_out[9]));
    DDC DDC11 (.I(P1_out[9]), .T(T[10]), .Tb(Tb[10]), .P2(P2_in[10]), .O(P2_in[9]), .P1(P1_out[10]));
    DDC DDC12 (.I(P1_out[10]), .T(T[11]), .Tb(Tb[11]), .P2(P2_in[11]), .O(P2_in[10]), .P1(P1_out[11]));
    DDC DDC13 (.I(P1_out[11]), .T(T[12]), .Tb(Tb[12]), .P2(P2_in[12]), .O(P2_in[11]), .P1(P1_out[12]));
    DDC DDC14 (.I(P1_out[12]), .T(T[13]), .Tb(Tb[13]), .P2(P2_in[13]), .O(P2_in[12]), .P1(P1_out[13]));
    DDC DDC15 (.I(P1_out[13]), .T(T[14]), .Tb(Tb[14]), .P2(P2_in[14]), .O(P2_in[13]), .P1(P1_out[14]));
    DDC DDC16 (.I(P1_out[14]), .T(T[15]), .Tb(Tb[15]), .P2(P1_out[15]), .O(P2_in[14]), .P1(P1_out[15]));
    
    assign P2_in[15] = P1_out[15];
endmodule
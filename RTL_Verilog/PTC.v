`include "HLD.v"
`include "PD.v"
`include "10bit_SAR.v"
`include "Clock_divider.v"
`include "4to16_Decoder.v"
`include "3to8_Decoder_f1.v"
`include "3to8_Decoder_f2.v"
module PTC (
    input [1:0] Sel,
    input [1:0] M, M_counter,
    input DIV_M, DIV_N,
    input clk_ext,
    input clk_out,
    input [3:0] N, N_counter,
    input rst_n,
    output [9:0] Q,
    output [9:0] Q_next,
    output reg [15:0] T,
    output reg [15:0] Tb,
    output reg [7:0] T_f1, Tb_f1,
    output reg [7:0] T_f2, Tb_f2
);
    wire clk2,clk4;
    wire Reset_PD, HLD1, HLD2;
    wire COMP;
    reg lead, lag;
    reg [3:0] count;

    Clock_divider P0(
        .rst_n(rst_n),
        .M(M),
        .DIV_M(DIV_M),
        .clk_ext(clk_ext),
        .clk2(clk2),
        .clk4(clk4)
    );

    HLD P1(
        .Q(Q),
        .HLD1(HLD1),
        .HLD2(HLD2),
        .clk2(clk2),
        .clk4(clk4),
        .Sel(Sel[0]),
        .DIV_M(DIV_M),
        .DIV_N(DIV_N),
        .M(M[0]),
        .clk_ext(clk_ext),
        .Reset_PD(Reset_PD),
        .rst_n(rst_n)
    );

    PD P2(
        .DIV_M(DIV_M),
        .clk_out(clk_out),
        .Reset_PD(Reset_PD),
        .COMP(COMP),
        .N_counter(N_counter),
        .N(N),
        .M(M),
        .M_counter(M_counter)
    );

    Decoder4to16 P3(
        .rst_n(rst_n),
        .Q(Q[9:6]),
        .T(T),
        .Tb(Tb)
    );

    Decoder3to8_f1 P4(
        .rst_n(rst_n),
        .Q(Q[5:3]),
        .T(T_f1),
        .Tb(Tb_f1),
        .count(count)
    );

    Decoder3to8_f2 P5(
        .rst_n(rst_n),
        .Q(Q[2:0]),
        .T(T_f2),
        .Tb(Tb_f2),
        .count(count)
    );

    SAR P6(
        .COMP(COMP),
        .clk4(clk4),
        .rst_n(rst_n),
        .Q(Q),
        .Q_next(Q_next),
        .count(count)
    );

endmodule

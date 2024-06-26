/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : R-2020.09-SP5
// Date      : Tue May  7 09:55:01 2024
/////////////////////////////////////////////////////////////


module Clock_divider ( M, rst_n, DIV_M, clk_ext, clk2, clk4 );
  input [1:0] M;
  input rst_n, DIV_M, clk_ext;
  output clk2, clk4;
  wire   N0, clk_ext_tmp, clk_in, clk_ext_push, clk2_tmp, cnt_tmp_2_1_,
         clk4_tmp, cnt_tmp_4_1_, N12, N15, n1, n2, N17, N19, n3, n4, n5, n6;
  wire   [25:0] buf_path;
  wire   [1:0] cnt_2;
  wire   [1:0] cnt_4;

  BUFX2 B0 ( .A(clk_ext), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 loop3_1__C1 ( .A(buf_path[1]), .Y(buf_path[2]) );
  BUFX2 loop3_2__C1 ( .A(buf_path[2]), .Y(buf_path[3]) );
  BUFX2 loop3_3__C1 ( .A(buf_path[3]), .Y(buf_path[4]) );
  BUFX2 loop3_4__C1 ( .A(buf_path[4]), .Y(buf_path[5]) );
  BUFX2 loop3_5__C1 ( .A(buf_path[5]), .Y(buf_path[6]) );
  BUFX2 loop3_6__C1 ( .A(buf_path[6]), .Y(buf_path[7]) );
  BUFX2 loop3_7__C1 ( .A(buf_path[7]), .Y(buf_path[8]) );
  BUFX2 loop3_8__C1 ( .A(buf_path[8]), .Y(buf_path[9]) );
  BUFX2 loop3_9__C1 ( .A(buf_path[9]), .Y(buf_path[10]) );
  BUFX2 loop3_10__C1 ( .A(buf_path[10]), .Y(buf_path[11]) );
  BUFX2 loop3_11__C1 ( .A(buf_path[11]), .Y(buf_path[12]) );
  BUFX2 loop3_12__C1 ( .A(buf_path[12]), .Y(buf_path[13]) );
  BUFX2 loop3_13__C1 ( .A(buf_path[13]), .Y(buf_path[14]) );
  BUFX2 loop3_14__C1 ( .A(buf_path[14]), .Y(buf_path[15]) );
  BUFX2 loop3_15__C1 ( .A(buf_path[15]), .Y(buf_path[16]) );
  BUFX2 loop3_16__C1 ( .A(buf_path[16]), .Y(buf_path[17]) );
  BUFX2 loop3_17__C1 ( .A(buf_path[17]), .Y(buf_path[18]) );
  BUFX2 loop3_18__C1 ( .A(buf_path[18]), .Y(buf_path[19]) );
  BUFX2 loop3_19__C1 ( .A(buf_path[19]), .Y(buf_path[20]) );
  BUFX2 loop3_20__C1 ( .A(buf_path[20]), .Y(buf_path[21]) );
  BUFX2 loop3_21__C1 ( .A(buf_path[21]), .Y(buf_path[22]) );
  BUFX2 loop3_22__C1 ( .A(buf_path[22]), .Y(buf_path[23]) );
  BUFX2 loop3_23__C1 ( .A(buf_path[23]), .Y(buf_path[24]) );
  BUFX2 loop3_24__C1 ( .A(buf_path[24]), .Y(buf_path[25]) );
  BUFX2 B1 ( .A(buf_path[25]), .Y(clk_ext_tmp) );
  DFFRQX2 clk4_tmp_reg ( .D(n2), .CK(clk_in), .RN(rst_n), .Q(clk4_tmp) );
  DFFSQXL clk2_tmp_reg ( .D(n1), .CK(clk_in), .SN(rst_n), .Q(clk2_tmp) );
  DFFRQX2 cnt_4_reg_1_ ( .D(cnt_tmp_4_1_), .CK(clk_in), .RN(rst_n), .Q(
        cnt_4[1]) );
  DFFRQX2 cnt_2_reg_0_ ( .D(n6), .CK(clk_in), .RN(rst_n), .Q(cnt_2[0]) );
  DFFRQX2 cnt_2_reg_1_ ( .D(cnt_tmp_2_1_), .CK(clk_in), .RN(rst_n), .Q(
        cnt_2[1]) );
  DFFSQXL cnt_4_reg_0_ ( .D(n5), .CK(clk_in), .SN(rst_n), .Q(cnt_4[0]) );
  DFFRQX2 clk2_reg ( .D(clk2_tmp), .CK(clk_ext_push), .RN(rst_n), .Q(clk2) );
  DFFRQX2 clk4_reg ( .D(clk4_tmp), .CK(clk_ext_push), .RN(rst_n), .Q(clk4) );
  INVX2 U3 ( .A(N17), .Y(n5) );
  INVX2 U4 ( .A(N19), .Y(n6) );
  AND2X2 U5 ( .A(cnt_4[0]), .B(N12), .Y(N17) );
  NAND2BX2 U6 ( .AN(cnt_4[0]), .B(cnt_4[1]), .Y(N12) );
  XNOR2X1 U7 ( .A(n3), .B(N17), .Y(cnt_tmp_4_1_) );
  NAND2X2 U8 ( .A(N12), .B(cnt_4[1]), .Y(n3) );
  AND2X2 U9 ( .A(cnt_2[0]), .B(N15), .Y(N19) );
  NAND2BX2 U10 ( .AN(cnt_2[1]), .B(cnt_2[0]), .Y(N15) );
  XNOR2X1 U11 ( .A(n4), .B(N19), .Y(cnt_tmp_2_1_) );
  NAND2X2 U12 ( .A(N15), .B(cnt_2[1]), .Y(n4) );
  XNOR2X1 U13 ( .A(clk2_tmp), .B(N15), .Y(n1) );
  XNOR2X1 U14 ( .A(clk4_tmp), .B(N12), .Y(n2) );
  NAND2BX2 U15 ( .AN(M[1]), .B(M[0]), .Y(N0) );
  MX2X1 U16 ( .A(clk_ext), .B(DIV_M), .S0(N0), .Y(clk_in) );
  MX2X1 U17 ( .A(clk_ext_tmp), .B(clk_ext), .S0(N0), .Y(clk_ext_push) );
endmodule


module HLD_Ctrl1 ( clk2, clk4, M, DIV_M, rst_n, Ctrl_HLD1 );
  input clk2, clk4, M, DIV_M, rst_n;
  output Ctrl_HLD1;
  wire   clk_nand, Ctrl_HLD1_tmp1, clk4b, Ctrl_HLD1_tmp2, glitch_1, n4, n2, n3
;

  NAND2XL H7 ( .A(clk2), .B(clk4), .Y(clk_nand) );
  NOR2XL H8 ( .A(clk_nand), .B(DIV_M), .Y(Ctrl_HLD1_tmp1) );
  INVXL H9 ( .A(clk4), .Y(clk4b) );
  NOR2XL H10 ( .A(clk4b), .B(clk2), .Y(Ctrl_HLD1_tmp2) );
  DFFNSRHX1 glitch_1_reg ( .D(n2), .CKN(clk2), .SN(1'b1), .RN(rst_n), .Q(
        glitch_1), .QN() );
  NOR2X2 U4 ( .A(glitch_1), .B(n4), .Y(Ctrl_HLD1) );
  AOI22XL U5 ( .A0(Ctrl_HLD1_tmp1), .A1(n3), .B0(M), .B1(Ctrl_HLD1_tmp2), .Y(
        n4) );
  INVX2 U6 ( .A(M), .Y(n3) );
  INVX2 U7 ( .A(clk4b), .Y(n2) );
endmodule


module FD_2 ( rst_n, clk, DIV_2 );
  input rst_n, clk;
  output DIV_2;
  wire   cnt_tmp_2_1_, n1, n2, n4, n5, n6, n8, n3, n11;

  DFFNSRHX1 cnt_2_reg_0_ ( .D(n11), .CKN(clk), .SN(1'b1), .RN(rst_n), .Q(), 
        .QN(n5) );
  DFFNSRHX1 cnt_2_reg_1_ ( .D(cnt_tmp_2_1_), .CKN(clk), .SN(1'b1), .RN(rst_n), 
        .Q(n3), .QN(n4) );
  DFFNSRHX1 DIV_2_reg ( .D(n8), .CKN(clk), .SN(rst_n), .RN(1'b1), .Q(DIV_2), 
        .QN(n6) );
  INVX2 U3 ( .A(n2), .Y(n11) );
  NAND2X2 U4 ( .A(n5), .B(n3), .Y(n2) );
  OAI21X1 U5 ( .A0(n5), .A1(n3), .B0(n2), .Y(cnt_tmp_2_1_) );
  XOR2X1 U6 ( .A(n1), .B(n6), .Y(n8) );
  NAND2X2 U7 ( .A(n4), .B(n5), .Y(n1) );
endmodule


module HLD_Ctrl2 ( clk2, clk4, M, DIV_M, rst_n, Ctrl_HLD2 );
  input clk2, clk4, M, DIV_M, rst_n;
  output Ctrl_HLD2;
  wire   clk2b, clk2b_div2, clk2b_div2_inv, Ctrl_HLD2_tmp2, clk4b,
         clk4b_clk2_NOR, clk4b_clk2_NOR_b, Ctrl_HLD2_tmp1, glitch, n4, n2, n3;

  INVXL H0 ( .A(clk2), .Y(clk2b) );
  INVXL H1 ( .A(clk2b_div2), .Y(clk2b_div2_inv) );
  NOR2XL H2 ( .A(clk2b), .B(clk2b_div2_inv), .Y(Ctrl_HLD2_tmp2) );
  INVXL H3 ( .A(clk4), .Y(clk4b) );
  NOR2XL H4 ( .A(clk2), .B(clk4b), .Y(clk4b_clk2_NOR) );
  INVXL H5 ( .A(clk4b_clk2_NOR), .Y(clk4b_clk2_NOR_b) );
  NOR2XL H6 ( .A(DIV_M), .B(clk4b_clk2_NOR_b), .Y(Ctrl_HLD2_tmp1) );
  DFFNSRHX1 glitch_reg ( .D(n2), .CKN(clk2b), .SN(1'b1), .RN(rst_n), .Q(glitch), .QN() );
  FD_2 F0 ( .rst_n(rst_n), .clk(clk2b), .DIV_2(clk2b_div2) );
  NOR2X2 U4 ( .A(glitch), .B(n4), .Y(Ctrl_HLD2) );
  AOI22XL U5 ( .A0(Ctrl_HLD2_tmp1), .A1(n3), .B0(M), .B1(Ctrl_HLD2_tmp2), .Y(
        n4) );
  INVX2 U6 ( .A(M), .Y(n3) );
  INVX2 U7 ( .A(clk2b_div2_inv), .Y(n2) );
endmodule


module D_latch_1 ( en, d, q, rst_n );
  input en, d, rst_n;
  output q;
  wire   n1, n2;

  AOI22X4 U3 ( .A0(en), .A1(d), .B0(q), .B1(n1), .Y(n2) );
  INVX2 U2 ( .A(en), .Y(n1) );
  NOR2BX1 U4 ( .AN(rst_n), .B(n2), .Y(q) );
endmodule


module D_latch_0 ( en, d, q, rst_n );
  input en, d, rst_n;
  output q;
  wire   n3, n4;

  AOI22X4 U3 ( .A0(en), .A1(d), .B0(q), .B1(n4), .Y(n3) );
  INVX2 U2 ( .A(en), .Y(n4) );
  NOR2BX1 U4 ( .AN(rst_n), .B(n3), .Y(q) );
endmodule


module HLD ( clk2, clk4, DIV_M, M, Sel, rst_n, Reset_PD, HLD1, HLD2 );
  input clk2, clk4, DIV_M, M, Sel, rst_n;
  output Reset_PD, HLD1, HLD2;
  wire   Ctrl_HLD1, Ctrl_HLD2, DFF_to_latch_1, DFF_to_latch_2, dummy1, dummy2;

  DFFSHQX8 DFF1 ( .D(1'b0), .CK(Sel), .SN(Ctrl_HLD1), .Q(DFF_to_latch_1) );
  DFFSHQX8 DFF2 ( .D(1'b0), .CK(Sel), .SN(Ctrl_HLD2), .Q(DFF_to_latch_2) );
  BUFX20 BUF1 ( .A(DFF_to_latch_1), .Y(dummy1) );
  BUFX20 BUF2 ( .A(DFF_to_latch_2), .Y(dummy2) );
  HLD_Ctrl1 Controller1 ( .clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), 
        .rst_n(rst_n), .Ctrl_HLD1(Ctrl_HLD1) );
  HLD_Ctrl2 Controller2 ( .clk2(clk2), .clk4(clk4), .M(M), .DIV_M(DIV_M), 
        .rst_n(rst_n), .Ctrl_HLD2(Ctrl_HLD2) );
  D_latch_1 DL1 ( .en(Ctrl_HLD1), .d(dummy1), .q(HLD1), .rst_n(rst_n) );
  D_latch_0 DL2 ( .en(Ctrl_HLD2), .d(dummy2), .q(HLD2), .rst_n(rst_n) );
  OR2X2 U2 ( .A(HLD1), .B(HLD2), .Y(Reset_PD) );
endmodule


module PD ( COMP, Reset_PD, M_counter, N_counter, M, N );
  input [1:0] M_counter;
  input [3:0] N_counter;
  input [1:0] M;
  input [3:0] N;
  input Reset_PD;
  output COMP;
  wire   n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20;

  CLKINVX20 U14 ( .A(COMP), .Y(n10) );
  AOI211X2 U3 ( .A0(n10), .A1(n11), .B0(Reset_PD), .C0(n12), .Y(COMP) );
  NAND4X2 U4 ( .A(n18), .B(N_counter[0]), .C(n19), .D(n20), .Y(n11) );
  NOR4X2 U5 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n12) );
  XNOR2X1 U6 ( .A(M_counter[0]), .B(M[0]), .Y(n18) );
  XNOR2X1 U7 ( .A(M_counter[1]), .B(M[1]), .Y(n19) );
  NOR3X1 U8 ( .A(N_counter[1]), .B(N_counter[3]), .C(N_counter[2]), .Y(n20) );
  NAND3BX2 U9 ( .AN(M_counter[1]), .B(M_counter[0]), .C(n17), .Y(n13) );
  XNOR2X1 U10 ( .A(N_counter[1]), .B(N[1]), .Y(n17) );
  XOR2X1 U11 ( .A(N_counter[3]), .B(N[3]), .Y(n15) );
  XOR2X1 U12 ( .A(N_counter[0]), .B(N[0]), .Y(n14) );
  XOR2X1 U13 ( .A(N_counter[2]), .B(N[2]), .Y(n16) );
endmodule


module Decoder4to16 ( rst_n, Q, T, Tb );
  input [3:0] Q;
  output [15:0] T;
  output [15:0] Tb;
  input rst_n;
  wire   n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n1, n2, n3;

  INVX2 U3 ( .A(Tb[14]), .Y(T[14]) );
  INVX2 U4 ( .A(Tb[6]), .Y(T[6]) );
  NAND2X2 U5 ( .A(n23), .B(n22), .Y(Tb[14]) );
  NAND2X2 U6 ( .A(n25), .B(n23), .Y(Tb[6]) );
  INVX2 U7 ( .A(Tb[9]), .Y(T[9]) );
  INVX2 U8 ( .A(Tb[4]), .Y(T[4]) );
  INVX2 U9 ( .A(Tb[5]), .Y(T[5]) );
  INVX2 U10 ( .A(Tb[12]), .Y(T[12]) );
  INVX2 U11 ( .A(Tb[13]), .Y(T[13]) );
  INVX2 U12 ( .A(Tb[2]), .Y(T[2]) );
  INVX2 U13 ( .A(Tb[3]), .Y(T[3]) );
  INVX2 U14 ( .A(Tb[10]), .Y(T[10]) );
  INVX2 U15 ( .A(Tb[11]), .Y(T[11]) );
  INVX2 U16 ( .A(Tb[7]), .Y(T[7]) );
  INVX2 U17 ( .A(Tb[15]), .Y(T[15]) );
  INVX2 U18 ( .A(Tb[1]), .Y(T[1]) );
  INVX2 U19 ( .A(Tb[8]), .Y(T[8]) );
  INVX2 U20 ( .A(Tb[0]), .Y(T[0]) );
  NOR2X2 U21 ( .A(n1), .B(n2), .Y(n23) );
  AND2X2 U22 ( .A(n29), .B(n3), .Y(n22) );
  AND2X2 U23 ( .A(n28), .B(n3), .Y(n25) );
  NAND2X2 U24 ( .A(n20), .B(n21), .Y(Tb[9]) );
  NAND2X2 U25 ( .A(n26), .B(n25), .Y(Tb[4]) );
  NAND2X2 U26 ( .A(n26), .B(n24), .Y(Tb[5]) );
  NAND2X2 U27 ( .A(n26), .B(n22), .Y(Tb[12]) );
  NAND2X2 U28 ( .A(n26), .B(n21), .Y(Tb[13]) );
  NAND2X2 U29 ( .A(n27), .B(n25), .Y(Tb[2]) );
  NAND2X2 U30 ( .A(n27), .B(n24), .Y(Tb[3]) );
  NAND2X2 U31 ( .A(n27), .B(n22), .Y(Tb[10]) );
  NAND2X2 U32 ( .A(n27), .B(n21), .Y(Tb[11]) );
  NAND2X2 U33 ( .A(n23), .B(n24), .Y(Tb[7]) );
  NAND2X2 U34 ( .A(n23), .B(n21), .Y(Tb[15]) );
  NAND2X2 U35 ( .A(n24), .B(n20), .Y(Tb[1]) );
  NAND2X2 U36 ( .A(n22), .B(n20), .Y(Tb[8]) );
  NAND2X2 U37 ( .A(n25), .B(n20), .Y(Tb[0]) );
  NOR2X2 U38 ( .A(Q[2]), .B(Q[1]), .Y(n20) );
  NOR2X2 U39 ( .A(n1), .B(Q[1]), .Y(n26) );
  NOR2X2 U40 ( .A(n2), .B(Q[2]), .Y(n27) );
  AND2X2 U41 ( .A(n29), .B(Q[0]), .Y(n21) );
  AND2X2 U42 ( .A(n28), .B(Q[0]), .Y(n24) );
  INVX2 U43 ( .A(Q[1]), .Y(n2) );
  NOR2BX1 U44 ( .AN(rst_n), .B(Q[3]), .Y(n28) );
  INVX2 U45 ( .A(Q[2]), .Y(n1) );
  INVX2 U46 ( .A(Q[0]), .Y(n3) );
  AND2X2 U47 ( .A(rst_n), .B(Q[3]), .Y(n29) );
endmodule


module Decoder3to8_f1 ( rst_n, Q, T, Tb, count_3_, count_2_, count_1_ );
  input [2:0] Q;
  output [7:0] T;
  output [7:0] Tb;
  input rst_n, count_3_, count_2_, count_1_;
  wire   n13, n14, n15, n16, n1, n2, n3;

  INVX2 U3 ( .A(Tb[0]), .Y(T[0]) );
  NAND2X2 U4 ( .A(n14), .B(rst_n), .Y(n15) );
  NAND3XL U5 ( .A(n3), .B(n2), .C(n16), .Y(Tb[0]) );
  NOR2X2 U6 ( .A(n2), .B(n3), .Y(n13) );
  NOR3BX1 U7 ( .AN(n13), .B(n15), .C(n1), .Y(T[7]) );
  INVX2 U8 ( .A(T[6]), .Y(Tb[6]) );
  INVX2 U9 ( .A(T[5]), .Y(Tb[5]) );
  INVX2 U10 ( .A(Tb[4]), .Y(T[4]) );
  INVX2 U11 ( .A(Tb[1]), .Y(T[1]) );
  INVX2 U12 ( .A(Tb[2]), .Y(T[2]) );
  INVX2 U13 ( .A(Tb[3]), .Y(T[3]) );
  NOR4X2 U14 ( .A(n15), .B(n1), .C(n2), .D(Q[0]), .Y(T[6]) );
  NOR4X2 U15 ( .A(n15), .B(n1), .C(n3), .D(Q[1]), .Y(T[5]) );
  NOR2X2 U16 ( .A(n15), .B(Q[2]), .Y(n16) );
  AOI31X1 U17 ( .A0(Q[2]), .A1(n2), .A2(n3), .B0(n15), .Y(Tb[4]) );
  AOI21X1 U18 ( .A0(count_2_), .A1(count_1_), .B0(count_3_), .Y(n14) );
  NAND3XL U19 ( .A(Q[0]), .B(n2), .C(n16), .Y(Tb[1]) );
  NAND3XL U20 ( .A(Q[1]), .B(n3), .C(n16), .Y(Tb[2]) );
  NAND3XL U21 ( .A(Q[1]), .B(Q[0]), .C(n16), .Y(Tb[3]) );
  INVX2 U22 ( .A(Q[0]), .Y(n3) );
  INVX2 U23 ( .A(Q[1]), .Y(n2) );
  NAND4X2 U24 ( .A(n13), .B(n14), .C(rst_n), .D(Q[2]), .Y(Tb[7]) );
  INVX2 U25 ( .A(Q[2]), .Y(n1) );
endmodule


module Decoder3to8_f2 ( rst_n, Q, count, T, Tb );
  input [2:0] Q;
  input [3:0] count;
  output [7:0] T;
  output [7:0] Tb;
  input rst_n;
  wire   n13, n14, n15, n16, n1, n2, n3;

  INVX2 U3 ( .A(Tb[0]), .Y(T[0]) );
  NAND2X2 U4 ( .A(n14), .B(rst_n), .Y(n15) );
  NAND3XL U5 ( .A(n3), .B(n2), .C(n16), .Y(Tb[0]) );
  NOR3BX1 U6 ( .AN(n13), .B(n15), .C(n1), .Y(T[7]) );
  NOR2X2 U7 ( .A(n2), .B(n3), .Y(n13) );
  INVX2 U8 ( .A(T[6]), .Y(Tb[6]) );
  INVX2 U9 ( .A(T[5]), .Y(Tb[5]) );
  INVX2 U10 ( .A(Tb[4]), .Y(T[4]) );
  INVX2 U11 ( .A(Tb[1]), .Y(T[1]) );
  INVX2 U12 ( .A(Tb[2]), .Y(T[2]) );
  INVX2 U13 ( .A(Tb[3]), .Y(T[3]) );
  AOI211X2 U14 ( .A0(count[1]), .A1(count[0]), .B0(count[3]), .C0(count[2]), 
        .Y(n14) );
  NOR4X2 U15 ( .A(n15), .B(n1), .C(n2), .D(Q[0]), .Y(T[6]) );
  NOR4X2 U16 ( .A(n15), .B(n1), .C(n3), .D(Q[1]), .Y(T[5]) );
  NOR2X2 U17 ( .A(n15), .B(Q[2]), .Y(n16) );
  AOI31X1 U18 ( .A0(Q[2]), .A1(n2), .A2(n3), .B0(n15), .Y(Tb[4]) );
  NAND3XL U19 ( .A(Q[0]), .B(n2), .C(n16), .Y(Tb[1]) );
  NAND3XL U20 ( .A(Q[1]), .B(n3), .C(n16), .Y(Tb[2]) );
  NAND3XL U21 ( .A(Q[1]), .B(Q[0]), .C(n16), .Y(Tb[3]) );
  INVX2 U22 ( .A(Q[0]), .Y(n3) );
  INVX2 U23 ( .A(Q[1]), .Y(n2) );
  NAND4X2 U24 ( .A(n13), .B(n14), .C(rst_n), .D(Q[2]), .Y(Tb[7]) );
  INVX2 U25 ( .A(Q[2]), .Y(n1) );
endmodule


module SAR ( COMP, clk4, rst_n, Q, Q_next, count );
  output [9:0] Q;
  output [9:0] Q_next;
  output [3:0] count;
  input COMP, clk4, rst_n;
  wire   n15, n17, n18, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n16, n19, n20;

  DFFNSRHX1 count_reg_0_ ( .D(n50), .CKN(clk4), .SN(rst_n), .RN(1'b1), .Q(
        count[0]), .QN() );
  DFFNSRHX1 count_reg_2_ ( .D(n47), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        count[2]), .QN(n18) );
  DFFNSRHX1 count_reg_1_ ( .D(n48), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        count[1]), .QN(n21) );
  DFFNSRHX1 count_reg_3_ ( .D(n49), .CKN(clk4), .SN(rst_n), .RN(1'b1), .Q(
        count[3]), .QN(n17) );
  DFFNSRHX1 Q_reg_9_ ( .D(Q_next[9]), .CKN(clk4), .SN(rst_n), .RN(1'b1), .Q(
        Q[9]), .QN() );
  DFFNSRHX1 Q_reg_8_ ( .D(Q_next[8]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[8]), .QN() );
  DFFNSRHX1 Q_reg_7_ ( .D(Q_next[7]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[7]), .QN() );
  DFFNSRHX1 Q_reg_6_ ( .D(Q_next[6]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[6]), .QN() );
  DFFNSRHX1 Q_reg_5_ ( .D(Q_next[5]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[5]), .QN() );
  DFFNSRHX1 Q_reg_4_ ( .D(Q_next[4]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[4]), .QN() );
  DFFNSRHX1 Q_reg_3_ ( .D(Q_next[3]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[3]), .QN(n22) );
  DFFNSRHX1 Q_reg_2_ ( .D(Q_next[2]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[2]), .QN() );
  DFFNSRHX1 Q_reg_1_ ( .D(Q_next[1]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[1]), .QN() );
  DFFNSRHX1 Q_reg_0_ ( .D(Q_next[0]), .CKN(clk4), .SN(1'b1), .RN(rst_n), .Q(
        Q[0]), .QN() );
  NOR2X2 U17 ( .A(n19), .B(n26), .Y(n23) );
  NOR2X2 U18 ( .A(n25), .B(n15), .Y(n33) );
  NAND2X2 U19 ( .A(n40), .B(n16), .Y(n38) );
  AOI21X1 U20 ( .A0(n20), .A1(n25), .B0(n26), .Y(n48) );
  INVX2 U21 ( .A(n25), .Y(n19) );
  INVX2 U22 ( .A(n42), .Y(n20) );
  OR3X2 U23 ( .A(n19), .B(n27), .C(n26), .Y(n24) );
  INVX2 U24 ( .A(n31), .Y(n16) );
  INVX2 U25 ( .A(n40), .Y(n15) );
  OAI32XL U26 ( .A0(n18), .A1(n41), .A2(n26), .B0(n33), .B1(n22), .Y(Q_next[3]) );
  AOI21X1 U27 ( .A0(n25), .A1(n17), .B0(Q[3]), .Y(n41) );
  NAND2X2 U28 ( .A(count[1]), .B(count[0]), .Y(n25) );
  OAI21X1 U29 ( .A0(count[0]), .A1(n21), .B0(n31), .Y(n26) );
  NAND2X2 U30 ( .A(n17), .B(n18), .Y(n42) );
  NOR3X1 U31 ( .A(count[0]), .B(count[1]), .C(n42), .Y(n45) );
  NOR2X2 U32 ( .A(count[3]), .B(COMP), .Y(n40) );
  NAND2X2 U33 ( .A(count[3]), .B(n18), .Y(n27) );
  NAND2X2 U34 ( .A(count[0]), .B(n21), .Y(n31) );
  NOR3X1 U35 ( .A(COMP), .B(count[1]), .C(n27), .Y(n30) );
  NAND2X2 U36 ( .A(n50), .B(count[1]), .Y(n28) );
  NAND2X2 U37 ( .A(count[2]), .B(n17), .Y(n34) );
  OAI21X1 U38 ( .A0(n23), .A1(n18), .B0(n24), .Y(n47) );
  NOR2X2 U39 ( .A(n45), .B(count[0]), .Y(n50) );
  NAND2X2 U40 ( .A(n40), .B(count[2]), .Y(n36) );
  AOI21X1 U41 ( .A0(n23), .A1(n18), .B0(n17), .Y(n49) );
  OAI2B2X1 U42 ( .A1N(Q[8]), .A0(n30), .B0(n27), .B1(n31), .Y(Q_next[8]) );
  OAI21X1 U43 ( .A0(n25), .A1(n34), .B0(n35), .Y(Q_next[6]) );
  OAI21X1 U44 ( .A0(n21), .A1(n36), .B0(Q[6]), .Y(n35) );
  OAI21X1 U45 ( .A0(n42), .A1(n28), .B0(n44), .Y(Q_next[1]) );
  OAI21X1 U46 ( .A0(count[2]), .A1(n38), .B0(Q[1]), .Y(n44) );
  OAI21X1 U47 ( .A0(n42), .A1(n25), .B0(n43), .Y(Q_next[2]) );
  OAI31X1 U48 ( .A0(n15), .A1(count[2]), .A2(n21), .B0(Q[2]), .Y(n43) );
  OAI21X1 U49 ( .A0(n31), .A1(n34), .B0(n39), .Y(Q_next[4]) );
  OAI21X1 U50 ( .A0(count[1]), .A1(n36), .B0(Q[4]), .Y(n39) );
  OAI2BB2X2 U51 ( .B0(n45), .B1(n46), .A0N(n45), .A1N(COMP), .Y(Q_next[0]) );
  AOI21X1 U52 ( .A0(n16), .A1(n20), .B0(Q[0]), .Y(n46) );
  OAI21X1 U53 ( .A0(n27), .A1(n28), .B0(n29), .Y(Q_next[9]) );
  OAI2BB1X1 U54 ( .A0N(count[0]), .A1N(n30), .B0(Q[9]), .Y(n29) );
  OAI21X1 U55 ( .A0(n28), .A1(n34), .B0(n37), .Y(Q_next[5]) );
  OAI21X1 U56 ( .A0(n18), .A1(n38), .B0(Q[5]), .Y(n37) );
  NAND2X2 U57 ( .A(n24), .B(n32), .Y(Q_next[7]) );
  OAI2BB1X1 U58 ( .A0N(count[2]), .A1N(n33), .B0(Q[7]), .Y(n32) );
endmodule


module PTC ( M, M_counter, DIV_M, clk_ext, N, N_counter, rst_n, Q, Q_next, T, 
        Tb, T_f1, Tb_f1, T_f2, Tb_f2, Sel_0_ );
  input [1:0] M;
  input [1:0] M_counter;
  input [3:0] N;
  input [3:0] N_counter;
  output [9:0] Q;
  output [9:0] Q_next;
  output [15:0] T;
  output [15:0] Tb;
  output [7:0] T_f1;
  output [7:0] Tb_f1;
  output [7:0] T_f2;
  output [7:0] Tb_f2;
  input DIV_M, clk_ext, rst_n, Sel_0_;
  wire   clk2, clk4, HLD1, HLD2, Reset_PD, COMP, count_3_, count_2_, count_1_,
         count_0_, n1, n2;

  Clock_divider P0 ( .M(M), .rst_n(rst_n), .DIV_M(DIV_M), .clk_ext(clk_ext), 
        .clk2(clk2), .clk4(clk4) );
  HLD P1 ( .clk2(clk2), .clk4(clk4), .DIV_M(DIV_M), .M(M[0]), .Sel(Sel_0_), 
        .rst_n(n1), .Reset_PD(Reset_PD), .HLD1(HLD1), .HLD2(HLD2) );
  PD P2 ( .COMP(COMP), .Reset_PD(Reset_PD), .M_counter(M_counter), .N_counter(
        N_counter), .M(M), .N(N) );
  Decoder4to16 P3 ( .rst_n(n1), .Q(Q[9:6]), .T(T), .Tb(Tb) );
  Decoder3to8_f1 P4 ( .rst_n(n1), .Q(Q[5:3]), .T(T_f1), .Tb(Tb_f1), .count_3_(
        count_3_), .count_2_(count_2_), .count_1_(count_1_) );
  Decoder3to8_f2 P5 ( .rst_n(n1), .Q(Q[2:0]), .count({count_3_, count_2_, 
        count_1_, count_0_}), .T(T_f2), .Tb(Tb_f2) );
  SAR P6 ( .COMP(COMP), .clk4(clk4), .rst_n(n1), .Q(Q), .Q_next(Q_next), 
        .count({count_3_, count_2_, count_1_, count_0_}) );
  INVX2 U1 ( .A(n2), .Y(n1) );
  INVX2 U2 ( .A(rst_n), .Y(n2) );
endmodule


module FD_M ( M, clk_ext, M_counter, DIV_M );
  input [1:0] M;
  input [1:0] M_counter;
  input clk_ext;
  output DIV_M;
  wire   DIV_M_tmp, N2, n11, n12, n13, n14, n1;

  MDFFHQX1 DIV_M_reg ( .D0(DIV_M_tmp), .D1(1'b1), .S0(N2), .CK(clk_ext), .Q(
        DIV_M) );
  INVX2 U4 ( .A(M[0]), .Y(n1) );
  OAI22X1 U5 ( .A0(M_counter[1]), .A1(M_counter[0]), .B0(n11), .B1(n12), .Y(N2) );
  OAI21X1 U6 ( .A0(M_counter[0]), .A1(n1), .B0(n13), .Y(n12) );
  XOR2X1 U7 ( .A(M_counter[1]), .B(M[1]), .Y(n11) );
  OAI2BB2X2 U8 ( .B0(n14), .B1(n11), .A0N(n13), .A1N(n11), .Y(DIV_M_tmp) );
  NOR2X2 U9 ( .A(M_counter[0]), .B(n1), .Y(n14) );
  NAND2X2 U10 ( .A(M_counter[0]), .B(n1), .Y(n13) );
endmodule


module FD_N ( N, clk_out, rst_n, N_counter, DIV_N );
  input [3:0] N;
  input [3:0] N_counter;
  input clk_out, rst_n;
  output DIV_N;
  wire   DIV_N_tmp, N3, n9, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n1, n2, n30, n4, n5, n6;

  OR2X2 U3 ( .A(N3), .B(DIV_N_tmp), .Y(n9) );
  DFFRQXL DIV_N_reg ( .D(n9), .CK(clk_out), .RN(rst_n), .Q(DIV_N) );
  AND3X2 U4 ( .A(n28), .B(n5), .C(n6), .Y(n22) );
  INVX2 U5 ( .A(n17), .Y(n1) );
  AOI211X2 U6 ( .A0(n25), .A1(n6), .B0(n26), .C0(n27), .Y(n24) );
  OAI2BB2X2 U7 ( .B0(N[0]), .B1(n2), .A0N(N[0]), .A1N(N_counter[1]), .Y(n25)
         );
  OAI21X1 U8 ( .A0(N[2]), .A1(n2), .B0(n18), .Y(n26) );
  OAI32XL U9 ( .A0(n5), .A1(N_counter[2]), .A2(n28), .B0(n29), .B1(n6), .Y(n27) );
  NOR2X2 U10 ( .A(n30), .B(N[0]), .Y(n28) );
  INVX2 U11 ( .A(N_counter[1]), .Y(n30) );
  OAI31X1 U12 ( .A0(n16), .A1(n17), .A2(n18), .B0(n19), .Y(N3) );
  OAI222X1 U13 ( .A0(n22), .A1(n1), .B0(N[0]), .B1(n23), .C0(n24), .C1(n17), 
        .Y(DIV_N_tmp) );
  OR4X2 U14 ( .A(N_counter[3]), .B(N_counter[0]), .C(N_counter[1]), .D(
        N_counter[2]), .Y(n19) );
  AOI21X1 U15 ( .A0(N[0]), .A1(n30), .B0(n28), .Y(n29) );
  XOR2X1 U16 ( .A(N_counter[0]), .B(N[0]), .Y(n18) );
  INVX2 U17 ( .A(N_counter[2]), .Y(n2) );
  XOR2X1 U18 ( .A(N_counter[3]), .B(N[3]), .Y(n17) );
  NAND2X2 U19 ( .A(n20), .B(n21), .Y(n16) );
  XNOR2X1 U20 ( .A(N[1]), .B(N_counter[1]), .Y(n21) );
  XNOR2X1 U21 ( .A(N[2]), .B(N_counter[2]), .Y(n20) );
  AOI31X1 U22 ( .A0(n5), .A1(n2), .A2(n6), .B0(n4), .Y(n23) );
  INVX2 U23 ( .A(N_counter[0]), .Y(n4) );
  INVX2 U24 ( .A(N[2]), .Y(n5) );
  INVX2 U25 ( .A(N[1]), .Y(n6) );
endmodule


module Select_Logic ( DIV_N, clk_out, DIV_M, M, M_counter, Sel, rst_n );
  input [1:0] M;
  input [1:0] M_counter;
  output [1:0] Sel;
  input DIV_N, clk_out, DIV_M, rst_n;
  wire   N21, N22, N23, n4, n10, n11, n12, n17, n1, n2, n3, n5, n6, n7, n8, n9,
         n13, n14, n15, n16, n18, n19;

  OAI2B11X4 U11 ( .A1N(M[1]), .A0(n17), .B0(n18), .C0(DIV_M), .Y(n12) );
  NAND4X8 U15 ( .A(DIV_M), .B(Sel[1]), .C(rst_n), .D(n16), .Y(N21) );
  NOR4BX1 U5 ( .AN(Sel[1]), .B(DIV_M), .C(n11), .D(n19), .Y(n10) );
  INVX2 U18 ( .A(DIV_M), .Y(n4) );
  NOR3X4 U13 ( .A(clk_out), .B(DIV_N), .C(DIV_M), .Y(n11) );
  TLATX4 Sel_tmp_reg_0_ ( .G(N21), .D(N22), .Q(Sel[0]), .QN() );
  TLATX4 Sel_tmp_reg_1_ ( .G(N21), .D(N23), .Q(Sel[1]), .QN(n2) );
  OAI2BB1X1 U3 ( .A0N(n6), .A1N(n15), .B0(n5), .Y(n9) );
  OAI2BB1X2 U4 ( .A0N(n9), .A1N(n8), .B0(rst_n), .Y(N22) );
  NAND2XL U6 ( .A(n12), .B(n11), .Y(n13) );
  AOI2BB1X4 U7 ( .A0N(n10), .A1N(n1), .B0(n3), .Y(N23) );
  AND4X2 U8 ( .A(n14), .B(n19), .C(M_counter[1]), .D(n13), .Y(n1) );
  INVX2 U9 ( .A(rst_n), .Y(n3) );
  INVX2 U10 ( .A(n11), .Y(n5) );
  INVX2 U12 ( .A(n15), .Y(n16) );
  INVX2 U14 ( .A(n19), .Y(n7) );
  AO2B2X2 U16 ( .B0(n4), .B1(n7), .A0(M_counter[1]), .A1N(n7), .Y(n8) );
  NAND2X2 U17 ( .A(n12), .B(n2), .Y(n14) );
  XOR2X1 U19 ( .A(M_counter[0]), .B(M[0]), .Y(n17) );
  CLKINVX4 U20 ( .A(DIV_N), .Y(n18) );
  NAND2BX2 U21 ( .AN(M[1]), .B(M[0]), .Y(n19) );
  OAI2BB1X1 U22 ( .A0N(Sel[0]), .A1N(n12), .B0(n19), .Y(n6) );
  NAND2BX2 U23 ( .AN(Sel[0]), .B(n7), .Y(n15) );
endmodule


module FMC ( clk_ext, clk_out, rst_n, M_counter, N_counter, M, N, Sel, DIV_M, 
        DIV_N );
  input [1:0] M_counter;
  input [3:0] N_counter;
  input [1:0] M;
  input [3:0] N;
  output [1:0] Sel;
  input clk_ext, clk_out, rst_n;
  output DIV_M, DIV_N;
  wire   DIV_M_tmp, n3, n4, n1, n2, n5;

  FD_M F0 ( .M(M), .clk_ext(clk_ext), .M_counter(M_counter), .DIV_M(DIV_M_tmp)
         );
  FD_N F1 ( .N(N), .clk_out(clk_out), .rst_n(n1), .N_counter(N_counter), 
        .DIV_N(DIV_N) );
  Select_Logic F2 ( .DIV_N(DIV_N), .clk_out(clk_out), .DIV_M(DIV_M), .M(M), 
        .M_counter(M_counter), .Sel(Sel), .rst_n(n1) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(rst_n), .Y(n2) );
  INVX2 U4 ( .A(n3), .Y(DIV_M) );
  AOI32XL U5 ( .A0(clk_ext), .A1(n5), .A2(n1), .B0(DIV_M_tmp), .B1(n4), .Y(n3)
         );
  INVX2 U6 ( .A(n4), .Y(n5) );
  NAND2BX2 U7 ( .AN(M[1]), .B(M[0]), .Y(n4) );
endmodule


module DDC_15 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_14 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_13 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_12 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_11 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_10 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_9 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_8 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_7 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_6 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_5 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_4 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_3 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_2 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_1 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module DDC_0 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   before_P1, A1toA3;
  wire   [1:0] buf_path;

  NAND2X2 A0 ( .A(I), .B(Tb), .Y(before_P1) );
  BUFX2 B0 ( .A(before_P1), .Y(buf_path[0]) );
  BUFX2 loop3_0__C1 ( .A(buf_path[0]), .Y(buf_path[1]) );
  BUFX2 B1 ( .A(buf_path[1]), .Y(P1) );
  NAND2X2 A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2X2 A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module CDL ( clk_mid, T, Tb, clk_coarse_out );
  input [15:0] T;
  input [15:0] Tb;
  input clk_mid;
  output clk_coarse_out;

  wire   [14:0] P2_in;
  wire   [15:0] P1_out;

  DDC_15 DDC1 ( .I(clk_mid), .T(T[0]), .Tb(Tb[0]), .P2(P2_in[0]), .O(
        clk_coarse_out), .P1(P1_out[0]) );
  DDC_14 DDC2 ( .I(P1_out[0]), .T(T[1]), .Tb(Tb[1]), .P2(P2_in[1]), .O(
        P2_in[0]), .P1(P1_out[1]) );
  DDC_13 DDC3 ( .I(P1_out[1]), .T(T[2]), .Tb(Tb[2]), .P2(P2_in[2]), .O(
        P2_in[1]), .P1(P1_out[2]) );
  DDC_12 DDC4 ( .I(P1_out[2]), .T(T[3]), .Tb(Tb[3]), .P2(P2_in[3]), .O(
        P2_in[2]), .P1(P1_out[3]) );
  DDC_11 DDC5 ( .I(P1_out[3]), .T(T[4]), .Tb(Tb[4]), .P2(P2_in[4]), .O(
        P2_in[3]), .P1(P1_out[4]) );
  DDC_10 DDC6 ( .I(P1_out[4]), .T(T[5]), .Tb(Tb[5]), .P2(P2_in[5]), .O(
        P2_in[4]), .P1(P1_out[5]) );
  DDC_9 DDC7 ( .I(P1_out[5]), .T(T[6]), .Tb(Tb[6]), .P2(P2_in[6]), .O(P2_in[5]), .P1(P1_out[6]) );
  DDC_8 DDC8 ( .I(P1_out[6]), .T(T[7]), .Tb(Tb[7]), .P2(P2_in[7]), .O(P2_in[6]), .P1(P1_out[7]) );
  DDC_7 DDC9 ( .I(P1_out[7]), .T(T[8]), .Tb(Tb[8]), .P2(P2_in[8]), .O(P2_in[7]), .P1(P1_out[8]) );
  DDC_6 DDC10 ( .I(P1_out[8]), .T(T[9]), .Tb(Tb[9]), .P2(P2_in[9]), .O(
        P2_in[8]), .P1(P1_out[9]) );
  DDC_5 DDC11 ( .I(P1_out[9]), .T(T[10]), .Tb(Tb[10]), .P2(P2_in[10]), .O(
        P2_in[9]), .P1(P1_out[10]) );
  DDC_4 DDC12 ( .I(P1_out[10]), .T(T[11]), .Tb(Tb[11]), .P2(P2_in[11]), .O(
        P2_in[10]), .P1(P1_out[11]) );
  DDC_3 DDC13 ( .I(P1_out[11]), .T(T[12]), .Tb(Tb[12]), .P2(P2_in[12]), .O(
        P2_in[11]), .P1(P1_out[12]) );
  DDC_2 DDC14 ( .I(P1_out[12]), .T(T[13]), .Tb(Tb[13]), .P2(P2_in[13]), .O(
        P2_in[12]), .P1(P1_out[13]) );
  DDC_1 DDC15 ( .I(P1_out[13]), .T(T[14]), .Tb(Tb[14]), .P2(P2_in[14]), .O(
        P2_in[13]), .P1(P1_out[14]) );
  DDC_0 DDC16 ( .I(P1_out[14]), .T(T[15]), .Tb(Tb[15]), .P2(P1_out[15]), .O(
        P2_in[14]), .P1(P1_out[15]) );
endmodule


module FDE_15 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_14 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_13 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_12 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_11 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_10 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_9 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_8 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDL_1 ( clk_in, T, Tb, clk_out );
  input [7:0] T;
  input [7:0] Tb;
  input clk_in;
  output clk_out;

  wire   [6:0] P2_in;
  wire   [7:0] P1_out;

  FDE_15 FDE1 ( .I(clk_in), .T(T[0]), .Tb(Tb[0]), .P2(P2_in[0]), .O(clk_out), 
        .P1(P1_out[0]) );
  FDE_14 FDE2 ( .I(P1_out[0]), .T(T[1]), .Tb(Tb[1]), .P2(P2_in[1]), .O(
        P2_in[0]), .P1(P1_out[1]) );
  FDE_13 FDE3 ( .I(P1_out[1]), .T(T[2]), .Tb(Tb[2]), .P2(P2_in[2]), .O(
        P2_in[1]), .P1(P1_out[2]) );
  FDE_12 FDE4 ( .I(P1_out[2]), .T(T[3]), .Tb(Tb[3]), .P2(P2_in[3]), .O(
        P2_in[2]), .P1(P1_out[3]) );
  FDE_11 FDE5 ( .I(P1_out[3]), .T(T[4]), .Tb(Tb[4]), .P2(P2_in[4]), .O(
        P2_in[3]), .P1(P1_out[4]) );
  FDE_10 FDE6 ( .I(P1_out[4]), .T(T[5]), .Tb(Tb[5]), .P2(P2_in[5]), .O(
        P2_in[4]), .P1(P1_out[5]) );
  FDE_9 FDE7 ( .I(P1_out[5]), .T(T[6]), .Tb(Tb[6]), .P2(P2_in[6]), .O(P2_in[5]), .P1(P1_out[6]) );
  FDE_8 FDE8 ( .I(P1_out[6]), .T(T[7]), .Tb(Tb[7]), .P2(P1_out[7]), .O(
        P2_in[6]), .P1(P1_out[7]) );
endmodule


module FDE_7 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_6 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_5 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_4 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_3 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_2 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_1 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDE_0 ( I, T, Tb, P2, O, P1 );
  input I, T, Tb, P2;
  output O, P1;
  wire   A1toA3;

  NAND2XL A0 ( .A(I), .B(Tb), .Y(P1) );
  NAND2XL A1 ( .A(I), .B(T), .Y(A1toA3) );
  NAND2XL A3 ( .A(P2), .B(A1toA3), .Y(O) );
endmodule


module FDL_0 ( clk_in, T, Tb, clk_out );
  input [7:0] T;
  input [7:0] Tb;
  input clk_in;
  output clk_out;

  wire   [6:0] P2_in;
  wire   [7:0] P1_out;

  FDE_7 FDE1 ( .I(clk_in), .T(T[0]), .Tb(Tb[0]), .P2(P2_in[0]), .O(clk_out), 
        .P1(P1_out[0]) );
  FDE_6 FDE2 ( .I(P1_out[0]), .T(T[1]), .Tb(Tb[1]), .P2(P2_in[1]), .O(P2_in[0]), .P1(P1_out[1]) );
  FDE_5 FDE3 ( .I(P1_out[1]), .T(T[2]), .Tb(Tb[2]), .P2(P2_in[2]), .O(P2_in[1]), .P1(P1_out[2]) );
  FDE_4 FDE4 ( .I(P1_out[2]), .T(T[3]), .Tb(Tb[3]), .P2(P2_in[3]), .O(P2_in[2]), .P1(P1_out[3]) );
  FDE_3 FDE5 ( .I(P1_out[3]), .T(T[4]), .Tb(Tb[4]), .P2(P2_in[4]), .O(P2_in[3]), .P1(P1_out[4]) );
  FDE_2 FDE6 ( .I(P1_out[4]), .T(T[5]), .Tb(Tb[5]), .P2(P2_in[5]), .O(P2_in[4]), .P1(P1_out[5]) );
  FDE_1 FDE7 ( .I(P1_out[5]), .T(T[6]), .Tb(Tb[6]), .P2(P2_in[6]), .O(P2_in[5]), .P1(P1_out[6]) );
  FDE_0 FDE8 ( .I(P1_out[6]), .T(T[7]), .Tb(Tb[7]), .P2(P1_out[7]), .O(
        P2_in[6]), .P1(P1_out[7]) );
endmodule


module DCDL ( clk_mid, T, Tb, T_f1, Tb_f1, T_f2, Tb_f2, Sel, clk_ext, 
        clk_out_out, clk_out );
  input [15:0] T;
  input [15:0] Tb;
  input [7:0] T_f1;
  input [7:0] Tb_f1;
  input [7:0] T_f2;
  input [7:0] Tb_f2;
  input [1:0] Sel;
  input clk_mid, clk_ext, clk_out_out;
  output clk_out;
  wire   clk_mid_tmp, clk_coarse_out, clk_fine_out, inv_in, n16, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17, n18, n19,
         n20, n21, n22, n23, n24;
  wire   [35:1] glitch_free;

  CLKBUFX2 glitch_eliminate_0__G0 ( .A(n24), .Y(glitch_free[1]) );
  CLKBUFX2 glitch_eliminate_1__G0 ( .A(glitch_free[1]), .Y(glitch_free[2]) );
  CLKBUFX2 glitch_eliminate_2__G0 ( .A(glitch_free[2]), .Y(glitch_free[3]) );
  CLKBUFX2 glitch_eliminate_3__G0 ( .A(glitch_free[3]), .Y(glitch_free[4]) );
  CLKBUFX2 glitch_eliminate_4__G0 ( .A(glitch_free[4]), .Y(glitch_free[5]) );
  CLKBUFX2 glitch_eliminate_5__G0 ( .A(glitch_free[5]), .Y(glitch_free[6]) );
  CLKBUFX2 glitch_eliminate_6__G0 ( .A(glitch_free[6]), .Y(glitch_free[7]) );
  CLKBUFX2 glitch_eliminate_7__G0 ( .A(glitch_free[7]), .Y(glitch_free[8]) );
  CLKBUFX2 glitch_eliminate_8__G0 ( .A(glitch_free[8]), .Y(glitch_free[9]) );
  CLKBUFX2 glitch_eliminate_9__G0 ( .A(glitch_free[9]), .Y(glitch_free[10]) );
  CLKBUFX2 glitch_eliminate_10__G0 ( .A(glitch_free[10]), .Y(glitch_free[11])
         );
  CLKBUFX2 glitch_eliminate_11__G0 ( .A(glitch_free[11]), .Y(glitch_free[12])
         );
  CLKBUFX2 glitch_eliminate_12__G0 ( .A(glitch_free[12]), .Y(glitch_free[13])
         );
  CLKBUFX2 glitch_eliminate_13__G0 ( .A(glitch_free[13]), .Y(glitch_free[14])
         );
  CLKBUFX2 glitch_eliminate_14__G0 ( .A(glitch_free[14]), .Y(glitch_free[15])
         );
  CLKBUFX2 glitch_eliminate_15__G0 ( .A(glitch_free[15]), .Y(glitch_free[16])
         );
  CLKBUFX2 glitch_eliminate_16__G0 ( .A(glitch_free[16]), .Y(glitch_free[17])
         );
  CLKBUFX2 glitch_eliminate_17__G0 ( .A(glitch_free[17]), .Y(glitch_free[18])
         );
  CLKBUFX2 glitch_eliminate_18__G0 ( .A(glitch_free[18]), .Y(glitch_free[19])
         );
  CLKBUFX2 glitch_eliminate_19__G0 ( .A(glitch_free[19]), .Y(glitch_free[20])
         );
  CLKBUFX2 glitch_eliminate_20__G0 ( .A(glitch_free[20]), .Y(glitch_free[21])
         );
  CLKBUFX2 glitch_eliminate_21__G0 ( .A(glitch_free[21]), .Y(glitch_free[22])
         );
  CLKBUFX2 glitch_eliminate_22__G0 ( .A(glitch_free[22]), .Y(glitch_free[23])
         );
  CLKBUFX2 glitch_eliminate_23__G0 ( .A(glitch_free[23]), .Y(glitch_free[24])
         );
  CLKBUFX2 glitch_eliminate_24__G0 ( .A(glitch_free[24]), .Y(glitch_free[25])
         );
  CLKBUFX2 glitch_eliminate_25__G0 ( .A(glitch_free[25]), .Y(glitch_free[26])
         );
  CLKBUFX2 glitch_eliminate_26__G0 ( .A(glitch_free[26]), .Y(glitch_free[27])
         );
  CLKBUFX2 glitch_eliminate_27__G0 ( .A(glitch_free[27]), .Y(glitch_free[28])
         );
  CLKBUFX2 glitch_eliminate_28__G0 ( .A(glitch_free[28]), .Y(glitch_free[29])
         );
  CLKBUFX2 glitch_eliminate_29__G0 ( .A(glitch_free[29]), .Y(glitch_free[30])
         );
  CLKBUFX2 glitch_eliminate_30__G0 ( .A(glitch_free[30]), .Y(glitch_free[31])
         );
  CLKBUFX2 glitch_eliminate_31__G0 ( .A(glitch_free[31]), .Y(glitch_free[32])
         );
  CLKBUFX2 glitch_eliminate_32__G0 ( .A(glitch_free[32]), .Y(glitch_free[33])
         );
  CLKBUFX2 glitch_eliminate_33__G0 ( .A(glitch_free[33]), .Y(glitch_free[34])
         );
  CLKBUFX2 glitch_eliminate_34__G0 ( .A(glitch_free[34]), .Y(glitch_free[35])
         );
  NOR2X8 U18 ( .A(clk_out_out), .B(Sel[1]), .Y(n16) );
  CDL D1 ( .clk_mid(clk_mid_tmp), .T(T), .Tb(Tb), .clk_coarse_out(
        clk_coarse_out) );
  FDL_1 D2 ( .clk_in(clk_coarse_out), .T(T_f1), .Tb(Tb_f1), .clk_out(
        clk_fine_out) );
  FDL_0 D3 ( .clk_in(clk_fine_out), .T(T_f2), .Tb(Tb_f2), .clk_out(inv_in) );
  INVX2 U2 ( .A(inv_in), .Y(n24) );
  AND2XL U3 ( .A(clk_ext), .B(Sel[0]), .Y(n1) );
  INVXL U4 ( .A(glitch_free[33]), .Y(n23) );
  NOR4BXL U5 ( .AN(n20), .B(glitch_free[32]), .C(n19), .D(glitch_free[31]), 
        .Y(n21) );
  INVXL U6 ( .A(glitch_free[34]), .Y(n22) );
  NAND4BX2 U7 ( .AN(n18), .B(n17), .C(n15), .D(n14), .Y(n19) );
  NOR4BXL U8 ( .AN(n11), .B(glitch_free[4]), .C(n10), .D(glitch_free[3]), .Y(
        n15) );
  NOR4BXL U9 ( .AN(n13), .B(glitch_free[14]), .C(glitch_free[15]), .D(
        glitch_free[13]), .Y(n14) );
  NOR4BXL U10 ( .AN(n7), .B(glitch_free[21]), .C(glitch_free[22]), .D(
        glitch_free[20]), .Y(n17) );
  NAND4BXL U11 ( .AN(glitch_free[28]), .B(n5), .C(n4), .D(n3), .Y(n18) );
  INVXL U12 ( .A(glitch_free[27]), .Y(n5) );
  NOR4BXL U13 ( .AN(n2), .B(glitch_free[26]), .C(glitch_free[25]), .D(
        glitch_free[24]), .Y(n3) );
  INVXL U14 ( .A(glitch_free[29]), .Y(n4) );
  INVXL U15 ( .A(glitch_free[30]), .Y(n20) );
  INVXL U16 ( .A(glitch_free[23]), .Y(n2) );
  NOR4BXL U17 ( .AN(n6), .B(glitch_free[19]), .C(glitch_free[18]), .D(
        glitch_free[17]), .Y(n7) );
  INVXL U19 ( .A(glitch_free[16]), .Y(n6) );
  NOR4BXL U20 ( .AN(n12), .B(glitch_free[12]), .C(glitch_free[11]), .D(
        glitch_free[10]), .Y(n13) );
  INVXL U21 ( .A(glitch_free[9]), .Y(n12) );
  NOR4BXL U22 ( .AN(n8), .B(glitch_free[8]), .C(glitch_free[7]), .D(
        glitch_free[6]), .Y(n11) );
  INVXL U23 ( .A(glitch_free[5]), .Y(n8) );
  OAI2BB1XL U24 ( .A0N(glitch_free[1]), .A1N(n24), .B0(n9), .Y(n10) );
  INVXL U25 ( .A(glitch_free[2]), .Y(n9) );
  AOI21BX4 U26 ( .A0(n16), .A1(n1), .B0N(clk_mid), .Y(clk_mid_tmp) );
  NAND4BX4 U27 ( .AN(glitch_free[35]), .B(n23), .C(n22), .D(n21), .Y(clk_out)
         );
endmodule


module Clock_counter ( clk_ext, clk_out, N, M, rst_n, N_counter, M_counter );
  input [3:0] N;
  input [1:0] M;
  output [3:0] N_counter;
  output [1:0] M_counter;
  input clk_ext, clk_out, rst_n;
  wire   N1, cnt_tmp_M_1_, N5, n100, n2, n3, n4, n50, n6, N7, N9, N12, N11,
         N101, n70, n8, n90, n102, n110;
  wire   [3:1] cnt_tmp_N;

  DFFRQX2 M_counter_reg_1_ ( .D(cnt_tmp_M_1_), .CK(clk_ext), .RN(rst_n), .Q(
        M_counter[1]) );
  DFFRQX2 M_counter_reg_0_ ( .D(n8), .CK(clk_ext), .RN(rst_n), .Q(M_counter[0]) );
  DFFRQX2 N_counter_reg_3_ ( .D(cnt_tmp_N[3]), .CK(clk_out), .RN(rst_n), .Q(
        N_counter[3]) );
  DFFRQX2 N_counter_reg_1_ ( .D(cnt_tmp_N[1]), .CK(clk_out), .RN(rst_n), .Q(
        N_counter[1]) );
  DFFRQX2 N_counter_reg_2_ ( .D(cnt_tmp_N[2]), .CK(clk_out), .RN(rst_n), .Q(
        N_counter[2]) );
  DFFRQX2 N_counter_reg_0_ ( .D(n90), .CK(clk_out), .RN(rst_n), .Q(
        N_counter[0]) );
  NAND2X2 U3 ( .A(N101), .B(N9), .Y(n110) );
  XNOR2X1 U4 ( .A(N11), .B(n110), .Y(cnt_tmp_N[2]) );
  XNOR2X1 U5 ( .A(N101), .B(n90), .Y(cnt_tmp_N[1]) );
  INVX2 U6 ( .A(N9), .Y(n90) );
  INVX2 U7 ( .A(N7), .Y(n8) );
  XNOR2X1 U8 ( .A(N_counter[0]), .B(N[0]), .Y(n4) );
  NAND4X2 U9 ( .A(n100), .B(n2), .C(n3), .D(n4), .Y(N5) );
  XNOR2X1 U10 ( .A(N_counter[3]), .B(N[3]), .Y(n3) );
  XNOR2X1 U11 ( .A(N_counter[1]), .B(N[1]), .Y(n2) );
  XNOR2X1 U12 ( .A(N_counter[2]), .B(N[2]), .Y(n100) );
  XOR2X1 U13 ( .A(N12), .B(n102), .Y(cnt_tmp_N[3]) );
  NOR2BX1 U14 ( .AN(N11), .B(n110), .Y(n102) );
  AND2X2 U15 ( .A(M_counter[0]), .B(N1), .Y(N7) );
  NAND2X2 U16 ( .A(n50), .B(n6), .Y(N1) );
  XNOR2X1 U17 ( .A(M_counter[1]), .B(M[1]), .Y(n50) );
  XNOR2X1 U18 ( .A(M_counter[0]), .B(M[0]), .Y(n6) );
  XNOR2X1 U19 ( .A(n70), .B(N7), .Y(cnt_tmp_M_1_) );
  NAND2X2 U20 ( .A(N1), .B(M_counter[1]), .Y(n70) );
  AND2X1 U21 ( .A(N_counter[0]), .B(N5), .Y(N9) );
  AND2X1 U22 ( .A(N_counter[1]), .B(N5), .Y(N101) );
  AND2X1 U23 ( .A(N_counter[2]), .B(N5), .Y(N11) );
  AND2X1 U24 ( .A(N5), .B(N_counter[3]), .Y(N12) );
endmodule


module FMDLL ( M, N, flag, rst_n, clk_ext, clk_out, Sel );
  input [1:0] M;
  input [3:0] N;
  output [1:0] Sel;
  input flag, rst_n, clk_ext;
  output clk_out;
  wire   n8, n9, DIV_M, DIV_N, Q_9_, Q_8_, Q_7_, Q_6_, Q_5_, Q_4_, Q_3_, Q_2_,
         Q_1_, Q_0_, clk_mid, n1, n2, n5, n6, n7;
  wire   [9:0] Q_next;
  wire   [15:0] T;
  wire   [15:0] Tb;
  wire   [7:0] T_f1;
  wire   [7:0] Tb_f1;
  wire   [7:0] T_f2;
  wire   [7:0] Tb_f2;
  wire   [3:0] N_counter;
  wire   [1:0] M_counter;

  OAI21BX4 U6 ( .A0(clk_out), .A1(n8), .B0N(n9), .Y(n1) );
  PTC U0 ( .M({M[1], n5}), .M_counter(M_counter), .DIV_M(DIV_M), .clk_ext(
        clk_ext), .N(N), .N_counter(N_counter), .rst_n(n6), .Q({Q_9_, Q_8_, 
        Q_7_, Q_6_, Q_5_, Q_4_, Q_3_, Q_2_, Q_1_, Q_0_}), .Q_next(Q_next), .T(
        T), .Tb(Tb), .T_f1(T_f1), .Tb_f1(Tb_f1), .T_f2(T_f2), .Tb_f2(Tb_f2), 
        .Sel_0_(Sel[0]) );
  FMC U1 ( .clk_ext(clk_ext), .clk_out(clk_out), .rst_n(n6), .M_counter(
        M_counter), .N_counter(N_counter), .M({M[1], n5}), .N(N), .Sel({n8, n9}), .DIV_M(DIV_M), .DIV_N(DIV_N) );
  DCDL U2 ( .clk_mid(clk_mid), .T(T), .Tb(Tb), .T_f1(T_f1), .Tb_f1(Tb_f1), 
        .T_f2(T_f2), .Tb_f2(Tb_f2), .Sel({n8, n9}), .clk_ext(clk_ext), 
        .clk_out_out(clk_out), .clk_out(clk_out) );
  Clock_counter U3 ( .clk_ext(clk_ext), .clk_out(clk_out), .N(N), .M({M[1], n5}), .rst_n(n6), .N_counter(N_counter), .M_counter(M_counter) );
  INVXL U7 ( .A(n9), .Y(n2) );
  INVX2 U8 ( .A(n2), .Y(Sel[0]) );
  OAI2BB1X2 U9 ( .A0N(n9), .A1N(clk_ext), .B0(n1), .Y(clk_mid) );
  BUFX2 U10 ( .A(M[0]), .Y(n5) );
  INVX2 U11 ( .A(n7), .Y(n6) );
  INVX2 U12 ( .A(rst_n), .Y(n7) );
  BUFX2 U13 ( .A(n8), .Y(Sel[1]) );
endmodule


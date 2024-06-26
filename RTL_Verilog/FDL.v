`include "FDE.v"
module FDL (
    input clk_in,
	input [7:0] T,
	input [7:0] Tb,
	output clk_out
);
	wire [7:0] P1_out;
	wire [7:0] P2_in;
	FDE FDE1 (.I(clk_in), .T(T[0]), .Tb(Tb[0]), .P2(P2_in[0]), .O(clk_out), .P1(P1_out[0]));
	FDE FDE2 (.I(P1_out[0]), .T(T[1]), .Tb(Tb[1]), .P2(P2_in[1]), .O(P2_in[0]), .P1(P1_out[1]));
	FDE FDE3 (.I(P1_out[1]), .T(T[2]), .Tb(Tb[2]), .P2(P2_in[2]), .O(P2_in[1]), .P1(P1_out[2]));
	FDE FDE4 (.I(P1_out[2]), .T(T[3]), .Tb(Tb[3]), .P2(P2_in[3]), .O(P2_in[2]), .P1(P1_out[3]));
	FDE FDE5 (.I(P1_out[3]), .T(T[4]), .Tb(Tb[4]), .P2(P2_in[4]), .O(P2_in[3]), .P1(P1_out[4]));
	FDE FDE6 (.I(P1_out[4]), .T(T[5]), .Tb(Tb[5]), .P2(P2_in[5]), .O(P2_in[4]), .P1(P1_out[5]));
	FDE FDE7 (.I(P1_out[5]), .T(T[6]), .Tb(Tb[6]), .P2(P2_in[6]), .O(P2_in[5]), .P1(P1_out[6]));
	FDE FDE8 (.I(P1_out[6]), .T(T[7]), .Tb(Tb[7]), .P2(P2_in[7]), .O(P2_in[6]), .P1(P1_out[7]));
	assign P2_in[7] = P1_out[7];
endmodule
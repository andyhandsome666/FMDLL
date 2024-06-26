`include "CDL.v"
`include "FDL.v"
module DCDL (
	input clk_mid,
	input [9:0] Q,
	input [15:0] T, 
	input [15:0] Tb,
	input [7:0] T_f1,
	input [7:0] Tb_f1,
	input [7:0] T_f2, 
	input [7:0] Tb_f2,
	input [1:0] Sel,
	input clk_ext,
	input clk_out_out,
	output clk_out
);
	wire clk_coarse_out, clk_fine_out;
	wire inv_in;
	wire clk_mid_tmp;
	reg [9:0] Qb;

	always @(*) begin
		Qb = ~Q;
	end

	CDL D1(.clk_mid(clk_mid_tmp),.T(T),.Tb(Tb),.clk_coarse_out(clk_coarse_out));
	FDL D2(.clk_in(clk_coarse_out),.T(T_f1),.Tb(Tb_f1),.clk_out(clk_fine_out));
	FDL D3(.clk_in(clk_fine_out),.T(T_f2),.Tb(Tb_f2),.clk_out(inv_in));
	assign clk_out_tmp = ~inv_in;

	assign clk_mid_tmp = (Sel==2'b01 && clk_ext==1'b1 && clk_out_out==1'b0) ? 0 : clk_mid;
 parameter bit = 35;
	wire [bit:0] glitch_free, glitch_free_next;
	assign glitch_free[0] = clk_out_tmp;
	genvar i;
	generate
		for (i = 0; i < bit; i = i + 1) begin:glitch_eliminate
			CLKBUFX2 G0( .A (glitch_free[i]), .Y (glitch_free[i+1]) );
		end
	endgenerate

	assign glitch_free_next[1] = glitch_free[0] & glitch_free[1];
	generate 
		for (i = 1; i < bit; i = i + 1) begin:glitch_eliminate2
			assign glitch_free_next[i+1] = glitch_free[i+1] | glitch_free_next[i];
		end
	endgenerate
	assign clk_out = glitch_free_next[bit];
endmodule
module Select_Logic (
    input DIV_N,
    input clk_out,
    input clk_ext,
    input DIV_M,
    input [3:0] N, 
    input [1:0] M, 
    input [3:0] N_counter,
    input [1:0] M_counter,
    output reg [1:0] Sel,
    input rst_n
);
	reg [1:0] Sel_tmp;
    always @(*) begin
		if (~rst_n) begin
			Sel_tmp <= 2'b01;
		end else if(M != 1) begin
			if (M_counter == 2'd1 || M_counter==2'd0) begin
					Sel_tmp <= 2'b00;
			end else if ((~DIV_N) && DIV_M && M_counter != M) begin
					Sel_tmp <= 2'b10;
			end else if ((~DIV_N) && (~DIV_M) && (~clk_out)) begin
				Sel_tmp <= 2'b01;
			end else begin 
				Sel_tmp <= Sel; 
			end
		end else begin
			if (DIV_M) begin
				if (Sel != 2'b10) begin
					Sel_tmp <= 2'b00;
				end
			end else if ((~DIV_N) && (~clk_out) &&(~DIV_M)) begin
				Sel_tmp <= 2'b01;
			end else begin 
				Sel_tmp <= Sel; 
			end
    	end
	end	
	
	always @(*) begin
		Sel <= Sel_tmp;
	end
endmodule
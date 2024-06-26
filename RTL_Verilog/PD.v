module PD(
    output reg COMP,
	input clk_out,
    input Reset_PD,
    input [1:0] M_counter,
    input [3:0] N_counter,
	input [1:0] M,
	input [3:0] N,
	input DIV_M
);  
    reg COMP_tmp;
    always @(*) begin
        if(Reset_PD) begin
            COMP <= 0;
        end else if((M_counter == 1) && (N_counter == N)) begin
            COMP <= 0;
        end else if((M_counter == M) && (N_counter == 1)) begin
            COMP <= 1;
        end else begin
            COMP <= COMP_tmp;
        end
    end
    
    always @(*) begin
        COMP_tmp <= COMP;
    end
endmodule
    
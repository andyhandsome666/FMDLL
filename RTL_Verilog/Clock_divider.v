module Clock_divider(
    input [1:0] M, 
	input rst_n,
    input DIV_M,
    input clk_ext,
	output reg clk2,
    output reg clk4
);
    reg [1:0] cnt_tmp_2, cnt_tmp_4;
    reg clk_tmp_2, clk_tmp_4;
    reg [1:0] cnt_2, cnt_4;
    reg clk2_tmp, clk4_tmp;
    wire clk_in;
    
	parameter delay_group = 10'd25;	
    wire clk_ext_tmp,clk_ext_push;
    wire [delay_group+1:0] buf_path;
    BUFX2 B0(.A(clk_ext), .Y(buf_path[0]));
    
    genvar i;
	generate
        for (i = 0; i < delay_group; i = i + 1) begin:loop3
            BUFX2 C1(.A(buf_path[i]), .Y(buf_path[i+1]));
        end
    endgenerate
	BUFX2 B1(.A(buf_path[delay_group]), .Y(clk_ext_tmp));
 
    
    assign clk_in = (M != 2'd1) ? DIV_M : clk_ext;
    assign clk_ext_push = (M != 2'd1) ? clk_ext : clk_ext_tmp;

    always @(*) begin
        if( cnt_2 == 2'd1) begin
            cnt_tmp_2 <= 2'b1;
            clk_tmp_2 <= ~clk2_tmp;
        end else begin
            cnt_tmp_2 <= cnt_2 + 1;
            clk_tmp_2 <= clk2_tmp;
        end
    end
    
    always @(*) begin
        if(cnt_4 == 2'd2) begin
            cnt_tmp_4 <= 2'b1;
            clk_tmp_4 <= ~clk4_tmp;
        end else begin
            cnt_tmp_4 <= cnt_4 + 1;
            clk_tmp_4 <= clk4_tmp;
        end
    end
    always @(posedge clk_in or negedge rst_n) begin
        if (~rst_n) begin
            cnt_2 <= 2'b0;
            clk2_tmp <= 1'b1;
            cnt_4 <= 2'b1;
            clk4_tmp <= 1'b0;
        end else begin
            cnt_2 <= cnt_tmp_2;
            clk2_tmp <= clk_tmp_2;
            cnt_4 <= cnt_tmp_4;
            clk4_tmp <= clk_tmp_4;
        end
    end

    always @(posedge clk_ext_push or negedge rst_n) begin
        if(~rst_n) begin
            clk2 <= 1'b0;
            clk4 <= 1'b0;
        end else begin
            clk2 <= clk2_tmp;
            clk4 <= clk4_tmp;
        end
    end

endmodule
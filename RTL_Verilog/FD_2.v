module FD_2 (
    input rst_n,
    input clk,
	output reg DIV_2
);
    reg [1:0] cnt_tmp_2;
    reg clk_tmp_2;
    reg [1:0] cnt_2;

    always @(*) begin
        if(cnt_2 == 2'd0) begin
            cnt_tmp_2 <= 2'b0;
            clk_tmp_2 <= ~DIV_2;
        end else begin
            cnt_tmp_2 <= cnt_2 + 1;
            clk_tmp_2 <= DIV_2;
        end
    end

    always @(negedge clk or negedge rst_n) begin
        if(~rst_n) begin
            cnt_2 <= 2'b0;
            DIV_2 <= 1'b1;
        end else begin
            cnt_2 <= cnt_tmp_2;
            DIV_2 <= clk_tmp_2;
        end
    end
endmodule
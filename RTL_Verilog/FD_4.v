module FD_4 (
    input clk,
	input rst_n,
	output reg DIV_4
);
    reg [2:0] cnt_tmp;
    reg clk_tmp;
    reg [2:0] cnt;

    always @(*) begin
        if(cnt == (3'd4 >> 1)) begin
            cnt_tmp <= 3'b1;
            clk_tmp <= ~DIV_4;
        end else begin
            cnt_tmp <= cnt + 1;
            clk_tmp <= DIV_4;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(~rst_n) begin
            cnt <= 3'b0;
            DIV_4 <= 1'b0;
        end else begin
            cnt <= cnt_tmp;
            DIV_4 <= clk_tmp;
        end
    end
endmodule
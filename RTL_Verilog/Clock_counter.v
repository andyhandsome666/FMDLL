module Clock_counter(
    input clk_ext,
    input clk_out,
    input [3:0] N,
    input [1:0] M,
    input Sel,
    input rst_n,
    output reg [3:0] N_counter,
    output reg [1:0] M_counter
);
    reg [3:0] cnt_tmp_N;
    reg [1:0] cnt_tmp_M;

    always @(*) begin
        if (M_counter == M) begin
            cnt_tmp_M <= 2'd1;
        end else begin
            cnt_tmp_M <= M_counter + 2'd1;
        end
    end

    always @(posedge clk_ext or negedge rst_n) begin
        if(~rst_n) begin
            M_counter <= 2'd0;
        end else begin
            M_counter <= cnt_tmp_M;
        end
    end

    always @(*) begin
        if(N_counter == N) begin
            cnt_tmp_N <= 4'd1;
        end else begin
            cnt_tmp_N <= N_counter + 4'd1;
        end
    end
    
    always @(posedge clk_out or negedge rst_n) begin
        if(~rst_n) begin
            N_counter <= 4'd0;
        end else begin
            N_counter <= cnt_tmp_N;
        end
    end

endmodule
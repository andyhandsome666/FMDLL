`include "FD_M.v"
`include "FD_N.v"
`include "Select_Logic.v"
module FMC (
    input clk_ext,
    input clk_out,
    input rst_n,
    input [1:0] M_counter,
    input [3:0] N_counter,
    input [1:0] M,
    input [3:0] N,
    output reg [1:0] Sel,
    output reg DIV_M,
    output  DIV_N
);
    wire DIV_M_tmp, DIV_N_tmp;

    FD_M F0 (
        .M(M),
        .DIV_M(DIV_M_tmp),
        .clk_ext(clk_ext),
        .rst_n(rst_n),
        .M_counter(M_counter)
    );

    FD_N F1(
        .N(N),
        .DIV_N(DIV_N),
        .clk_out(clk_out),
        .rst_n(rst_n),
        .N_counter(N_counter)
    );

    Select_Logic F2(
        .DIV_N(DIV_N),
        .clk_out(clk_out),
        .clk_ext(clk_ext),
        .DIV_M(DIV_M),
        .M(M),.N(N),
        .N_counter(N_counter),
        .M_counter(M_counter),
        .Sel(Sel),
        .rst_n(rst_n)
    );

    always @(*) begin
        if (M == 2'd1) begin
            if(rst_n == 1) begin
                DIV_M <= clk_ext;
            end else begin
                DIV_M <= 0;
            end
        end else begin
            DIV_M  <= DIV_M_tmp;
        end
    end

endmodule
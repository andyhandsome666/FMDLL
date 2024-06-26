module FD_M(
  input [1:0] M,
  input clk_ext,
  input rst_n,
  input [1:0] M_counter,
  output reg DIV_M
);
  reg DIV_M_tmp;
  always @(posedge clk_ext) begin
      DIV_M <= DIV_M_tmp;
  end

  always @(*) begin
    if (M_counter == M || M_counter == 2'd0) begin
      DIV_M_tmp <= 1;
    end else if (M_counter == M - 2'd1) begin
      DIV_M_tmp <= 0;
    end else begin
      DIV_M_tmp <= 1;
    end
  end

 endmodule


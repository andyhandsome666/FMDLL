module FD_N(
  input [3:0] N,
  input clk_out,
  input rst_n,
  input [3:0] N_counter,
  output reg DIV_N  
);
  reg DIV_N_tmp;

  always @(posedge clk_out or negedge rst_n) begin
      if (!rst_n) begin
          DIV_N <= 0;
      end else begin
          DIV_N <= DIV_N_tmp;
      end 
  end

  always @(*) begin
    if (N_counter == N || N_counter == 3'd0) begin
      DIV_N_tmp <= 1;
    end else if (N_counter == N - 4'd1) begin
      DIV_N_tmp <= 0;
    end else begin
      DIV_N_tmp <= 1;
    end
  end 

endmodule
`timescale 1ns/100ps
module FMDLL_tb();
    reg [1:0] M;
    reg [3:0] N;
    reg clk_ext;
    reg rst_n;
    wire clk_out;    
	wire [1:0] Sel;
   reg flag;
    FMDLL u1(
        .M(M),
        .N(N),
        .clk_ext(clk_ext),
        .clk_out(clk_out),
        .rst_n(rst_n),
        .Sel(Sel),
        .flag(flag)
    );
  

    initial begin
      clk_ext= 1;
      flag = 0;
      N      = 4'd10; // N = 1,4,5,8,10
      M      = 2'd3; // M = 1,2,3
      rst_n  = 1;
      #5
      rst_n  = 0;
      #200
      //150
      rst_n  = 1;
      #25000
      flag = 1;
      #5000
      $finish;
    end

    always #(15) clk_ext = ~clk_ext;
//O	 4/1 period = 34~52
//O  5/1 period = 35~65
//O  8/1 period = 35~100
//O  10/1 period = 45~130

//O  4/2 period = 18~25
//O  5/2 period = 16~24
//O  8/2 period = 18~50
//O  10/2 period = 41~65

//O  4/3 period = 10~19
//O  5/3 period = 15~22
//O  8/3 period = 20~32 
//O  10/3 period = 12~30 , 35-40 working but influenced by glitch
//----------------------------------------------------------------
//O  9/2 period = 30~39

    initial begin
   	$sdf_annotate("../APR/run/FMDLL.sdf", u1);
	$fsdbDumpfile("../../4.Simulation_Result/FMDLL_postsim.fsdb");
	$fsdbDumpvars;
end

endmodule

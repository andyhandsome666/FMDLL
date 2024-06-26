`timescale 1ns/100ps
module FMDLL_tb();
    reg [1:0] M;
    reg [3:0] N;
    reg clk_ext;
    reg rst_n;
    wire clk_out;    
	wire [1:0] Sel;
    FMDLL u1(.M(M),
           .N(N),
           .clk_ext(clk_ext),
           .clk_out(clk_out),
           .rst_n(rst_n),
		   .Sel(Sel)
           );
  

    initial begin
      clk_ext= 1;
      N      = 4'd10; // N = 1,4,5,8,10
      M      = 2'd3; // M = 1,2,3
      rst_n  = 1;
      #5
      rst_n  = 0;
      #150
      rst_n  = 1;
      #8000
      $finish;
    end

    always #(10) clk_ext = ~clk_ext;
//X	 4/1 period = ???
//X  5/1 period = ???
//X  8/1 period = ???
//X  10/1 period = ???

//O  4/2 period = 5~6
//X  5/2 period = 7.1 -------- (tiny operating range)
//O  8/2 period = 5.5~6.3 
//O  10/2 period = 13.2~13.9

//O  4/3 period = 4~4.5
//O  5/3 period = 4.7~5.2
//X  8/3 period = 6.9~7 ------ (tiny operating range)
//O  10/3 period = 9~9.5
	


    initial begin
   	$sdf_annotate("./FMDLL_syn.sdf", u1);
	$fsdbDumpfile("../4.Simulation_Result/FMDLL_syn.fsdb");
	$fsdbDumpvars;
end

endmodule

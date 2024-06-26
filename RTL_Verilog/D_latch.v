module D_latch (
  input  en,
  input  d,
  output q,
  input rst_n
);
	assign q = (rst_n) ? ((en) ? d : q) : 0;

endmodule


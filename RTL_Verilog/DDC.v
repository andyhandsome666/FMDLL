module DDC (
    input I,
    input T,
    input Tb,
    input P2,
    output O,
    output P1
);
	parameter delay_group = 10'd1;
    wire before_P1;
	wire [12:0] buf_path;
    wire A1toA3;
	
    NAND2X2 A0(.A(I), .B(Tb), .Y(before_P1));
    BUFX2 B0(.A(before_P1), .Y(buf_path[0]));
	
	genvar i;
	generate
        for (i = 0; i < delay_group; i = i + 1) begin:loop3
            BUFX2 C1(.A(buf_path[i]), .Y(buf_path[i+1]));
        end
    endgenerate

	BUFX2 B1(.A(buf_path[delay_group]), .Y(P1));

    NAND2X2 A1(.A(I), .B(T), .Y(A1toA3));
    NAND2X2 A3(.A(P2), .B(A1toA3), .Y(O));
endmodule

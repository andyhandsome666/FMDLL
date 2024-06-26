module FDE (
    input I,
    input T,
    input Tb,
    input P2,
    output O,
    output P1
);
    wire A1toA3;
    NAND2XL A0(.A(I), .B(Tb), .Y(P1));
    NAND2XL A1(.A(I), .B(T), .Y(A1toA3));
    NAND2XL A3(.A(P2), .B(A1toA3), .Y(O));
endmodule
`include "FD_2.v"
module HLD_Ctrl2 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    input rst_n,
    output  Ctrl_HLD2
);
    wire clk2b;
    wire clk2b_div2;
    wire clk2b_div2_inv;
    wire Ctrl_HLD2_tmp2;
    reg glitch;
    INVXL H0(.A(clk2),.Y(clk2b));
    FD_2 F0 (.clk(clk2b), .rst_n(rst_n), .DIV_2(clk2b_div2));
    INVXL H1(.A(clk2b_div2),.Y(clk2b_div2_inv));
    NOR2XL H2(.A(clk2b),.B(clk2b_div2_inv),.Y(Ctrl_HLD2_tmp2));

    wire clk4b;
    wire clk4b_clk2_NOR;
    wire clk4b_clk2_NOR_b;
    wire Ctrl_HLD2_tmp1;
    INVXL H3(.A(clk4),.Y(clk4b));
    NOR2XL H4(.A(clk2),.B(clk4b),.Y(clk4b_clk2_NOR));
    INVXL H5(.A(clk4b_clk2_NOR),.Y(clk4b_clk2_NOR_b));   
    NOR2XL H6(.A(DIV_M),.B(clk4b_clk2_NOR_b),.Y(Ctrl_HLD2_tmp1));     
    assign Ctrl_HLD2 = (glitch==1)? 0:((M == 1) ? Ctrl_HLD2_tmp2:Ctrl_HLD2_tmp1);

    always@(negedge clk2b or negedge rst_n)begin
        if(~rst_n)begin
            glitch <=0 ;
        end else if(clk2b_div2_inv==0)begin
            glitch <=1 ;
        end
        else begin
            glitch <=0 ;
        end
    end
endmodule


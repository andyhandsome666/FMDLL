module HLD_Ctrl1 (
    input clk2,
    input clk4,
    input M,
    input DIV_M,
    input rst_n,
    output  Ctrl_HLD1
);
    wire clk_nand;
    wire Ctrl_HLD1_tmp1,Ctrl_HLD1_tmp2;
    wire clk4b;
    reg glitch_1;
    NAND2XL H7(.A(clk2),.B(clk4),.Y(clk_nand));
    NOR2XL H8(.A(clk_nand),.B(DIV_M),.Y(Ctrl_HLD1_tmp1));
    INVXL H9(.A(clk4),.Y(clk4b));
    NOR2XL H10(.A(clk4b),.B(clk2),.Y(Ctrl_HLD1_tmp2));
    assign Ctrl_HLD1 = (glitch_1==1)? 0:((M == 1) ? Ctrl_HLD1_tmp2:Ctrl_HLD1_tmp1);

    always@(negedge clk2 or negedge rst_n)begin
        if(~rst_n)begin
            glitch_1 <=0 ;
        end else if(clk4b == 0)begin
            glitch_1 <=1 ;
        end else begin
            glitch_1 <=0 ;
        end
    end

endmodule
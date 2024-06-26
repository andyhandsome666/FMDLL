module SAR (
    input COMP,
    input clk4,
    input rst_n,
    output reg [9:0] Q,
    output reg [9:0] Q_next,
    output reg [3:0] count
);
    reg [3:0] count_next;

    always @(*) begin
		Q_next <= Q;
        count_next <= count;
        if (COMP == 1'b0) begin    //lag
            if (count != 0) begin
                Q_next[count] <= 0;
                Q_next[count-1] <= 1;
                count_next <= count - 4'd1;
            end else if (count == 0) begin
                Q_next[0] <= 0;
				count_next <= 0;
            end    
        end else if (COMP == 1'b1) begin    //lead
            if (count != 0) begin
                Q_next[count-1] <= 1;
                count_next <= count - 4'd1;
            end else if (count == 0)begin
                Q_next[0] <= 1;
				count_next <= 0;
            end
        end 
    end
    
    always@(negedge clk4 or negedge rst_n) begin
        if(~rst_n) begin
			count <= 4'd9;
			Q <= 10'b1000000000;
        end else begin
			Q <= Q_next;
			count <= count_next;
		end  
    end
    
endmodule
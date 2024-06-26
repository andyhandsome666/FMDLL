module Decoder3to8 (
    input rst_n,
    input [2:0] Q,
    output reg [7:0] T,
    output [7:0] Tb
);
    always @(*) begin
        if (!rst_n) begin
            T = 8'b00000001;
        end
        else begin
            case (Q[2:0])
                3'd0: T = 8'b00000001;
                3'd1: T = 8'b00000010;
                3'd2: T = 8'b00000100;
                3'd3: T = 8'b00001000;
                3'd4: T = 8'b00010000;
                3'd5: T = 8'b00100000;
                3'd6: T = 8'b01000000;
                3'd7: T = 8'b10000000;
                default : T = 8'b00000001;
            endcase
        end 
    end

    assign Tb = ~T;

endmodule
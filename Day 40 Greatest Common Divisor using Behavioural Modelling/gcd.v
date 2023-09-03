`timescale 1ns / 1ps
module gcd (
    input [31:0] a,
    input [31:0] b,
    output reg[31:0] gcd_result
);

    reg [31:0] x;
    reg [31:0] y;
    
    always @(a, b) begin
        x <= a;
        y <= b;
        while (y != 0) begin
            if (x > y)
                x <= x - y;
            else
                y <= y - x;
        end
        gcd_result <= x;
    end

endmodule

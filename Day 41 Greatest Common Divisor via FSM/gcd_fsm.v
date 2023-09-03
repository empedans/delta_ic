`timescale 1ns / 1ps
module gcd_fsm (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [31:0] a,
    input wire [31:0] b,
    output reg [31:0] gcd
);

    reg [1:0] state;
    reg [31:0] x;
    reg [31:0] y;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= 2'b00; // Initial state
            x <= 0;
            y <= 0;
	    gcd <= 0;
        end else begin
            case (state)
                2'b00: begin // State 0 - Load inputs and start calculation
                    if (start) begin
                        x <= a;
                        y <= b;
                        state <= 2'b01;
                    end
                end
                2'b01: begin // State 1 - Calculate GCD using Euclidean algorithm
                    if (y != 0) begin
                        if (x > y) x <= x - y;
                        else y <= y - x;
                    end else begin
                        gcd <= x;
                        state <= 2'b00; // Return to initial state
                    end
                end
            endcase
        end
    end

endmodule


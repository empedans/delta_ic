`timescale 1ns / 1ps
module mod_counter #(parameter N = 10, parameter W = 4)
    (input clk,
    input reset,
    input up_down,
    output reg [3:0] count);

    always @(posedge clk) begin
        if (reset)
            count <= {W{1'b0}}; // Reset the counter to 0 when reset is asserted
        else if (up_down)
            count <= (count == N - 1) ? {W{1'b0}} : count + 1; // Count up and wrap around
        else
            count <= (count == {W{1'b0}}) ? N - 1 : count - 1; // Count down and wrap around
    end

endmodule
`timescale 1ns / 1ps

module fourbitcounter(
    input wire clk,    // Clock input
    input wire reset,  // Reset input
    output wire [3:0] count // 4-bit count output
);

reg [3:0] next_count;

always @(posedge clk or posedge reset) begin	
    if (reset)					// Synchronous active high reset
        next_count <= 4'b0000;
    else
        next_count <= next_count + 1;
end

assign count = next_count;

endmodule


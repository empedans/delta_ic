`timescale 1ns / 1ps

module clockdivider(
    input wire clock, // Clock input
    input wire reset, // Reset input
    output wire divided_clk2, // Divided clock by 2
    output wire divided_clk4, // Divided clock by 4
    output wire divided_clk8 // Divided clock by 8
);

reg [2:0] counter; // 3-bit counter for dividing the clock

always @(posedge clock or posedge reset) begin
    if (reset)
        counter <= 3'b000; // Reset the counter
    else if (counter == 3'd7)
        counter <= 3'b000; // Reset the counter when it reaches 8
    else
        counter <= counter + 1; // Increment the counter
end

assign divided_clk2 = counter[0]; // Divided clock by 2
assign divided_clk4 = counter[1]; // Divided clock by 4
assign divided_clk8 = counter[2]; // Divided clock by 8

endmodule


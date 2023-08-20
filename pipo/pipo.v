`timescale 1ns / 1ps

module pipo(
    input wire clock, // Clock input
    input wire reset, // Reset input
    input wire [3:0] parallel_in, // Parallel input
    output wire [3:0] parallel_out // Parallel output
);

reg [3:0] shift_reg; // 4-bit shift register

always @(posedge clock or posedge reset) begin
    if (reset)
        shift_reg <= 4'b0; // Reset the shift register
    else
        shift_reg <= parallel_in; // Load parallel input into the shift register
end

assign parallel_out = shift_reg;

endmodule


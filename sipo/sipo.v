`timescale 1ns / 1ps

module sipo(
    input wire clock, // Clock input
    input wire reset, // Reset input
    input wire serial_in, // Serial input
    output wire [3:0] parallel_out // Parallel output
);

reg [3:0] shift_reg; // 4-bit shift register

always @(posedge clock) begin
    if (reset)
        shift_reg <= 4'b0; // Reset the shift register
    else
        shift_reg <= {shift_reg[2:0], serial_in}; // Shift the data left and add serial input
end

assign parallel_out = shift_reg;

endmodule


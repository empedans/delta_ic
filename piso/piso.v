`timescale 1ns / 1ps

module piso(
    input wire clock, // Clock input
    input wire reset, // Reset input
    input wire [3:0] parallel_in, // Parallel input
    output wire serial_out // Serial output
);

reg [3:0] shift_reg; // 4-bit shift register
reg [3:0] counter;   // Counter for serial output

always @(posedge clock or reset) begin
    if (reset)
        shift_reg <= 4'b0; // Reset the shift register
    else
        shift_reg <= parallel_in; // Load parallel input into the shift register

    if (reset)
        counter <= 4'b0; // Reset the counter
    else
        counter <= counter + 1; // Increment the counter
end

assign serial_out = shift_reg[counter];

endmodule


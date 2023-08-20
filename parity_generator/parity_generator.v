`timescale 1ns / 1ps

module parity_generator(
    input wire in0,  // Input 0
    input wire in1,  // Input 1
    input wire in2,  // Input 2
    output wire parity_out  // Parity output
);

assign parity_out = in0 ^ in1 ^ in2;

endmodule

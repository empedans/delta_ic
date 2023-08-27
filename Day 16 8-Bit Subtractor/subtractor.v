`timescale 1ns/1ps // Specify the timescale

module subtractor (
    input wire [7:0] a,
    input wire [7:0] b,
    output wire [7:0] difference
);

    assign difference = a - b; // Subtract 'b' from 'a' to get the difference
    // Verilog automatically handles two's complement subtraction for signed numbers

endmodule


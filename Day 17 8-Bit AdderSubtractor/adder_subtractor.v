`timescale 1ns/1ps

module adder_subtractor (
    input [7:0] a,
    input [7:0] b,
    input subtract,
    output wire [7:0] result
);
    // 'subtract' controls addition/subtraction, 1 for substract 0 for add

    wire [7:0] add_result;
    wire [7:0] sub_result;

    assign add_result = a + b; // Add 'a' and 'b'
    assign sub_result = a - b; // Subtract 'b' from 'a'

    assign result = subtract ? sub_result : add_result; // Select add or subtract result based on 'subtract' input

endmodule
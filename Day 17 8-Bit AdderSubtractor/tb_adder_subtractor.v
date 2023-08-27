`timescale 1ns/1ps
module tb_adder_subtractor;

    reg [7:0] a;
    reg [7:0] b;
    reg subtract;
    wire [7:0] result;

    // Instantiate the adder/subtractor module
    adder_subtractor dut (
        .a(a),
        .b(b),
        .subtract(subtract),
        .result(result)
    );

    initial begin
        // Initialize inputs
        a = 8'b11001100; // Example value
        b = 8'b00110011; // Example value
        subtract = 0;     // Choose addition (0) or subtraction (1)

        // Wait a few time units
        #10;

        a = 8'b11001100; // Example value
        b = 8'b10110011; // Example value
        subtract = 1;     // Choose addition (0) or subtraction (1)

        // Wait a few time units
        #10;

       

        // Stop the simulation
        $finish;
    end

endmodule


`timescale 1ns / 1ps

module tb_universal_shifter;

    // Inputs
    reg [3:0] data_in;
    reg [1:0] mode;
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] data_out;

    // Instantiate the universal shifter module
    universal_shifter dut (
        .data_in(data_in),
        .mode(mode),
        .clk(clk),
        .reset(reset),
        .data_out(data_out)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 1;
        mode = 2'b00;
        data_in = 4'b1100;
        #10 reset = 0; // De-assert reset after 10 time units

        // Test cases
        #10 mode = 2'b01; // Shift right
        #10 mode = 2'b10; // Shift left
        #10 mode = 2'b11; // Load data_in
        #10 data_in = 4'b1010; // Change data_in value
        #100 $finish;
    end

endmodule

`timescale 1ns / 1ps

module tb_mod_counter;

    // Parameters for the counter
    parameter N = 10; // Modulus
    parameter W = 4;  // Output bit width

    // Inputs
    reg clk;
    reg reset;
    reg up_down;

    // Outputs
    wire [3:0] count;

    // Instantiate the counter module
    mod_counter #(.N(N), .W(W)) dut (
        .clk(clk),
        .reset(reset),
        .up_down(up_down),
        .count(count)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 1;
        up_down = 0;
        #10 reset = 0; // De-assert reset after 10 time units

        // Test cases
        #20 up_down = 1; // Count up
        #100 up_down = 0; // Count down
        #100 $finish;
    end

endmodule


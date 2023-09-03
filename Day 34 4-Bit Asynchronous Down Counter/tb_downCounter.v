`timescale 1ns / 1ps
module tb_downCounter;

    // Parameters
    parameter CLK_PERIOD = 10; // Clock period in time units

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [3:0] count;

    // Instantiate the counter module
    downCounter dut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation
    always begin
        #((CLK_PERIOD) / 2) clk = ~clk;
    end

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 1;
        #20 reset = 0; // De-assert reset after 20 time units

        // Test cases
        #100;
        reset = 1; // Assert reset
        #20 reset = 0; // De-assert reset
        #40 reset = 1; // Assert reset again
        #20 reset = 0; // De-assert reset
        #80 reset = 1; // Assert reset again
        #20 reset = 0; // De-assert reset
        #200 $finish;
    end

endmodule

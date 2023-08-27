`timescale 1ns/1ps 

module tb_prbs_generator;

    reg clk;
    reg reset;
    wire prbs_output;

    // Instantiate the PRBS generator
    prbs_generator dut (
        .clk(clk),
        .reset(reset),
        .prbs_output(prbs_output)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1; // Reset initial value

        // Wait a few clock cycles before releasing the reset
        #15 reset = 0;

        // Simulate for a certain number of clock cycles
        #250;
        
        // Stop the simulation
        $finish;
    end

endmodule


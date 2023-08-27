`timescale 1ns/1ps

module tb_moore;
    reg clk;
    reg reset;
    reg data;
    wire tick;

    // Instantiate the Moore FSM module
    moore dut (
        .clk(clk),
        .reset(reset),
        .data(data),
        .tick(tick)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reset and test cases
    initial begin
        reset = 1; data = 0; 
        #10 reset = 0;

        // Test case: Data = 1010 
        data = 1; #10 data = 0; #10;
        data = 0; #10 data = 1; #10;
        data = 0; #10 data = 1; #10;
        data = 0; #10 data = 1; #10;

        // Stop the simulation
        $finish;
    end
endmodule


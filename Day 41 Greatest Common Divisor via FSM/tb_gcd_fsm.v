`timescale 1ns / 1ps

module tb_gcd_fsm;

    // Inputs
    reg clk;
    reg reset;
    reg start;
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] gcd;

    // Instantiate the GCD FSM module
    gcd_fsm dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .a(a),
        .b(b),
        .gcd(gcd)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Test case 1
    initial begin
        $display("Test Case 1: a = 48, b = 18");
	reset = 1; #10;
	clk = 0;
        a = 48;
        b = 18;
        start = 1;
        reset = 0;
        #200;
        $finish;
    end

endmodule


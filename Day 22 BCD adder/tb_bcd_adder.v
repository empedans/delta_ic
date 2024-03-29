`timescale 1ns/1ps
module tb_bcd_adder;

    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg carry_in;

    // Outputs
    wire [3:0] sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    bcd_adder uut (
        .a(a), 
        .b(b), 
        .carry_in(carry_in), 
        .sum(sum), 
        .carry(carry)
    );

    initial begin
        // Apply Inputs
        a = 0;  b = 0;  carry_in = 0;   #100;
        a = 5;  b = 9;  carry_in = 0;   #100;
        a = 3;  b = 3;  carry_in = 1;   #100;
        a = 4;  b = 5;  carry_in = 0;   #100;
        a = 8;  b = 2;  carry_in = 0;   #100;
        a = 9;  b = 9;  carry_in = 1;   #100;
    end
      
endmodule
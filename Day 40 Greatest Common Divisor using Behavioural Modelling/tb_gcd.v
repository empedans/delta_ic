`timescale 1ns / 1ps

module tb_gcd;

    // Inputs
    reg [31:0] a;
    reg [31:0] b;

    // Outputs
    wire [31:0] gcd_result;

    // Instantiate the Unit Under Test (UUT)
    gcd uut (
        .a(a),
        .b(b),
        .gcd_result(gcd_result)
    );

    initial begin
        a=90; b=86;
        #10 a=48; b=12;
        #10 a=65; b=4;
        #10 a=48; b=7;
        #10 a=8; b=2;
        #10 a=125; b=6;
        #10 a=85; b=76;
        #10 a=54; b=44;
        #10 a=95; b=32;
        #10 a=109; b=91;
        #10 a=75; b=34;

    end

    initial begin
        $monitor("a= %d | b=%d | gcd=%d", a,b,gcd_result);
        #200 $finish;
    end
endmodule


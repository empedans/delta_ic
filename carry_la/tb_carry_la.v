`timescale 1ns / 1ps

module tb_carry_la;

reg [3:0] A, B; // Input values A and B
wire [3:0] Sum; // Sum output
wire Cout;      // Carry output

carry_la dut (
    .A(A),
    .B(B),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    $monitor("Time=%0dns: A=%b, B=%b, Sum=%b, Cout=%b", $time, A, B, Sum, Cout);

    // Test cases
    A = 4'b0010; B = 4'b0110; #10;
    A = 4'b1010; B = 4'b1100; #10;
    A = 4'b1111; B = 4'b0001; #10;
    
    $finish;
end

endmodule


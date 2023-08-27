`timescale 1ns/1ps // Specifies the timescale

module tb_carry_select;

    reg [3:0] A;     // 4-bit input A
    reg [3:0] B;     // 4-bit input B
    reg cin;         // Carry-in
    wire [3:0] S;    // 4-bit sum output
    wire cout;       // Carry-out

    // Instantiate the carry_select_adder module
    carry_select dut (
        .A(A),
        .B(B),
        .cin(cin),
        .S(S),
        .cout(cout)
    );

    // Initialize inputs and perform tests
    initial begin
        // Test 1: 2 + 3 + 0 = 5 (No carry)
        A = 4'b0010; B = 4'b0011; cin = 1'b0;
        #10 $display("A + B + Cin = %b, Cout = %b", S, cout);

        // Test 2: 8 + 5 + 0 = 13 (No carry)
        A = 4'b1000; B = 4'b0101; cin = 1'b0;
        #10 $display("A + B + Cin = %b, Cout = %b", S, cout);

        // Test 3: 9 + 9 + 0 = 18 (Carry)
        A = 4'b1001; B = 4'b1001; cin = 1'b0;
        #10 $display("A + B + Cin = %b, Cout = %b", S, cout);

        // Test 4: 15 + 1 + 1 = 1 (Carry)
        A = 4'b1111; B = 4'b0001; cin = 1'b1;
        #10 $display("A + B + Cin = %b, Cout = %b", S, cout);

        // Test 5: 0 + 0 + 0 = 0 (No carry)
        A = 4'b1100; B = 4'b0010; cin = 1'b0;
        #10 $display("A + B + Cin = %b, Cout = %b", S, cout);

        // Stop the simulation
        $finish;
    end
endmodule


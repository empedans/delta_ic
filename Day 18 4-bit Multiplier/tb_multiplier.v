`timescale 1ns/1ps

module tb_multiplier;
    reg [3:0] A; // 4-bitlik ilk çarpan
    reg [3:0] B; // 4-bitlik ikinci çarpan
    wire [7:0] P; // 8-bitlik çarp?m sonucu

    // Instantiate the multiplier module
    multiplier dut (
        .A(A),
        .B(B),
        .P(P)
    );

    // Initialize inputs and perform tests
    initial begin
        A = 4'b0000; B = 4'b0000; // 0 * 0 = 0
        #10 $display("A * B = %b", P);

        A = 4'b0010; B = 4'b0011; // 2 * 3 = 6
        #10 $display("A * B = %b", P);

        A = 4'b1101; B = 4'b0100; // 13 * 4 = 52
        #10 $display("A * B = %b", P);

        A = 4'b1010; B = 4'b1010; // 10 * 10 = 100
        #10 $display("A * B = %b", P);

        // Stop the simulation
        $finish;
    end
endmodule


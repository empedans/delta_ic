`timescale 1ns / 1ps

module tb_alu;
    // Declare signals for the testbench
    reg [3:0] operand_a;
    reg [3:0] operand_b;
    reg [2:0] opcode;
    wire [7:0] result;

    // Instantiate the ALU module
    alu dut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .opcode(opcode),
        .result(result)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Initialize inputs
    initial begin
        operand_a = 4'b0010;
        operand_b = 4'b1010;
        
        // Test addition
        opcode = 3'b000;
        #10;
        
        // Test subtraction
        opcode = 3'b001;
        #10;
        
        // Test bitwise AND
        opcode = 3'b010;
        #10;
        
        // Test bitwise OR
        opcode = 3'b011;
        #10;
        
        // Test bitwise XOR
        opcode = 3'b100;
        #10;
        
        // Test multiplication
        opcode = 3'b101;
        #10;
        
        // Test NOT operation
        opcode = 3'b110;
        #10;
        
        // Test XNOR operation
        opcode = 3'b111;
        #10;

        $finish;
    end

endmodule
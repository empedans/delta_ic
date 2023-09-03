`timescale 1ns / 1ps

module alu(
    input [3:0] operand_a,  // 4-bit input operand A
    input [3:0] operand_b,  // 4-bit input operand B
    input [2:0] opcode,     // 3-bit input opcode
    output reg [7:0] result     // 8-bit output result
);

    // Logic to determine the output result based on the opcode
    always @(*) begin
        case (opcode)
            3'b000: result = operand_a + operand_b; // Addition
            3'b001: result = operand_a - operand_b; // Subtraction
            3'b010: result = operand_a & operand_b; // Bitwise AND
            3'b011: result = operand_a | operand_b; // Bitwise OR
            3'b100: result = operand_a ^ operand_b; // Bitwise XOR
            3'b101: result = operand_a * operand_b; // Multiplication
            3'b110: result = ~operand_a; // NOT operation
            3'b111: result = ~(operand_a ^ operand_b); // XNOR operation
            default: result = 8'b00000000; // Invalid opcode
        endcase
    end

endmodule


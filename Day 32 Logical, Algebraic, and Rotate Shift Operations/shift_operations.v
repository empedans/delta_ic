module shift_operations(
    input [7:0] data_in,   // 8-bit input data
    input [2:0] opcode,    // 3-bit input opcode
    output reg[7:0] result    // 8-bit output result
);

    wire [7:0] shift_left_logical, shift_right_logical;
    wire [7:0] shift_left_algebraic, shift_right_algebraic;
    wire [7:0] rotate_left, rotate_right;

    // Perform logical left shift by opcode positions
    assign shift_left_logical = data_in << opcode;

    // Perform logical right shift by opcode positions
    assign shift_right_logical = data_in >> opcode;

    // Perform algebraic left shift by opcode positions (with sign extension)
    assign shift_left_algebraic = $signed(data_in) <<< opcode;

    // Perform algebraic right shift by opcode positions (with sign extension)
    assign shift_right_algebraic = $signed(data_in) >>> opcode;

    // Perform rotate left by opcode positions
    assign rotate_left = {data_in[5 - 1:0], data_in[7:5]};    

    // Perform rotate right by opcode positions
    assign rotate_right = {data_in[7:6], data_in[7:8-6]};

    // Logic to determine the output result based on the opcode
    always @(*) begin
        case (opcode)
            3'b000: result = data_in; // No shift, output same as input
            3'b001: result = shift_left_logical;
            3'b010: result = shift_right_logical;
            3'b011: result = shift_left_algebraic;
            3'b100: result = shift_right_algebraic;
            3'b101: result = rotate_left;
            3'b110: result = rotate_right;
            default: result = 8'b0; // Invalid opcode, output 0
        endcase
    end

endmodule


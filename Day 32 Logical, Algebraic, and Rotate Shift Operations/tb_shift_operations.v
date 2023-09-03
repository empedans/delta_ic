module tb_shift_operations;

    // Inputs
    reg [7:0] data_in;
    reg [2:0] opcode;

    // Outputs
    wire [7:0] result;

    // Instantiate the module to be tested
    shift_operations dut (
        .data_in(data_in),
        .opcode(opcode),
        .result(result)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, shift_operations_tb);

        // Initialize inputs
        data_in = 8'b11001100;
        opcode = 3'b000; // No shift, should result in the same data_in value

        // Apply some test cases
        #10;
        opcode = 3'b001; // Logical left shift by 1 position
        #10;
        opcode = 3'b010; // Logical right shift by 2 positions
        #10;
        opcode = 3'b011; // Algebraic left shift by 3 positions
        #10;
        opcode = 3'b100; // Algebraic right shift by 4 positions
        #10;
        opcode = 3'b101; // Rotate left by 5 positions
        #10;
        opcode = 3'b110; // Rotate right by 6 positions
        #10;

        $finish;
    end

endmodule

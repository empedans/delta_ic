`timescale 1ns / 1ps

module tb_b2onehot;

reg [3:0] binary_input; // Example 4-bit binary input
wire [15:0] one_hot_output; // Corresponding one-hot encoded output

b2onehot dut (
    .binary_input(binary_input),
    .one_hot_output(one_hot_output)
);

initial begin
    $monitor("Time=%0dns: binary_input=%b, one_hot_output=%b", $time, binary_input, one_hot_output);

    // Test cases
    binary_input = 4'b0000; #10;
    binary_input = 4'b0001; #10;
    binary_input = 4'b0010; #10;
    binary_input = 4'b0100; #10;
    binary_input = 4'b1000; #10;

    $finish;
end

endmodule


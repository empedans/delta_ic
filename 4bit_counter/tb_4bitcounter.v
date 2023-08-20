`timescale 1ns / 1ps

module tb_fourbitcounter;

reg clk;      // Clock signal
reg reset;    // Reset signal
wire [3:0] count; // Counter output
integer i;

fourbitcounter dut (
    .clk(clk),
    .reset(reset),
    .count(count)
);

initial begin
    clk = 0;
    reset = 0;
    #5; // Wait for a few time units

    // Reset the counter
    reset = 1;
    #5;
    reset = 0;

    // Check counter values for a few clock cycles
    for ( i = 0; i < 16; i = i + 1) begin
        #5;
        clk = ~clk; // Toggle clock
    end

    $finish;
end

endmodule


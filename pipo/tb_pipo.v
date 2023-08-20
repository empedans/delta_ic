`timescale 1ns / 1ps

module tb_pipo;

reg clock;             // Clock signal
reg reset;             // Reset signal
reg [3:0] parallel_in; // Parallel input signal
wire [3:0] parallel_out; // Parallel output signal

pipo dut (
    .clock(clock),
    .reset(reset),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
);

initial begin
    $monitor("Time=%0dns: parallel_in=%b, parallel_out=%b", $time, parallel_in, parallel_out);

    // Initialize signals
    clock = 0;
    reset = 0;
    parallel_in = 4'b0000;

    // Test cases
    reset = 1; #10;
    reset = 0;

    parallel_in = 4'b1010; #10;
    parallel_in = 4'b1100; #10;
    parallel_in = 4'b0011; #10;

    $finish;
end

always #5 clock = ~clock; // Toggle the clock every 5 time units

endmodule


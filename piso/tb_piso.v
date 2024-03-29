`timescale 1ns / 1ps

module tb_piso;

reg clock;             // Clock signal
reg reset;             // Reset signal
reg [3:0] parallel_in; // Parallel input signal
wire serial_out;       // Serial output signal

piso dut (
    .clock(clock),
    .reset(reset),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
);

initial begin
    $monitor("Time=%0dns: parallel_in=%b, serial_out=%b", $time, parallel_in, serial_out);

    // Initialize signals
    clock = 0;
    reset = 0;
    parallel_in = 4'b0000;

    // Test cases
    reset = 1; #10;
    reset = 0;

    parallel_in = 4'b1011; #40;


    $finish;
end

always #5 clock = ~clock; // Toggle the clock every 5 time units

endmodule

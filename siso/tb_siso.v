`timescale 1ns / 1ps

module tb_siso;

reg clock;         // Clock signal
reg reset;         // Reset signal
reg serial_in;     // Serial input signal
wire serial_out;   // Serial output signal

siso dut (
    .clock(clock),
    .reset(reset),
    .serial_in(serial_in),
    .serial_out(serial_out)
);

initial begin
    $monitor("Time=%0dns: serial_in=%b, serial_out=%b", $time, serial_in, serial_out);

    // Initialize signals
    clock = 0;
    reset = 0;
    serial_in = 0;

    // Test cases
    reset = 1; #10;
    reset = 0;

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 0; #10;

    $finish;
end

always #5 clock = ~clock; // Toggle the clock every 5 time units

endmodule


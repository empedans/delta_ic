`timescale 1ns / 1ps
module tb_ringcounter;
parameter WIDTH = 4;
reg clk;
reg rst;

wire [(WIDTH-1):0] count; // You can change the width as needed

ringcounter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

always begin
    #5 clk = ~clk; // Clock signal with 10ns period
end

initial begin
    clk = 0;
    rst = 1;

    #15 rst = 0;

    // Monitor the count output
    $monitor("Time=%0dns: clk=%b, rst=%b, count=%b", $time, clk, rst, count);

    // Simulate for 50ns
    #50 $finish;
end

endmodule

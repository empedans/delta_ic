`timescale 1ns / 1ps
module tb_majority;

reg in0, in1, in2, in3, in4;
wire out;

majority dut (
    .in0(in0),
    .in1(in1),
    .in2(in2),
    .in3(in3),
    .in4(in4),
    .out(out)
);

initial begin
    // Test cases
    in0 = 0; in1 = 0; in2 = 0; in3 = 0; in4 = 0; #10;
    in0 = 1; in1 = 0; in2 = 0; in3 = 1; in4 = 0; #10;
    in0 = 1; in1 = 1; in2 = 0; in3 = 1; in4 = 0; #10;
    in0 = 1; in1 = 1; in2 = 0; in3 = 1; in4 = 1; #10;
    $finish;
end

endmodule

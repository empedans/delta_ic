`timescale 1ns / 1ps

module majority(
    input wire in0,  // Input 0
    input wire in1,  // Input 1
    input wire in2,  // Input 2
    input wire in3,  // Input 3
    input wire in4,  // Input 4
    output wire out  // Output
);

assign out = 
    (in0 & in1 & in2) | 
    (in0 & in1 & in3) | 
    (in0 & in1 & in4) | 
    (in0 & in2 & in3) | 
    (in0 & in2 & in4) | 
    (in0 & in3 & in4) | 
    (in1 & in2 & in3) | 
    (in1 & in2 & in4) | 
    (in1 & in3 & in4) | 
    (in2 & in3 & in4);  

endmodule


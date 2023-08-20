`timescale 1ns / 1ps

module comparator(A, B, greater, equal, less);
   
parameter N = 4;
input wire [N-1:0] A;
input wire [N-1:0] B;
output wire greater;
output wire equal;
output wire less;

assign greater = (A > B);
assign equal = (A == B);
assign less = (A < B);

endmodule


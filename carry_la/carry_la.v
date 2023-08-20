module carry_la(
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [3:0] Sum,
    output wire Cout
);

wire [3:0] C; // Carry signals for each bit

FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(1'b0), .Sum(Sum[0]), .Cout(C[0]));
FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(Sum[1]), .Cout(C[1]));
FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(Sum[2]), .Cout(C[2]));
FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(Sum[3]), .Cout(Cout));

endmodule

module FullAdder(
    input wire A,
    input wire B,
    input wire Cin,
    output wire Sum,
    output wire Cout
);

assign Sum = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);			// two of the input are 1 mean there is Cout

endmodule


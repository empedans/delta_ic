module m21( D0, D1, S, Y);
input wire D0, D1, S;
output reg Y;

always @(*)
begin

if(S) 
Y= D1;
else
Y=D0;

end

endmodule


module d_latch(d,clock,q);
input d,clock;
inout q;

m21 mux1(.D0(q),.D1(d),.S(clock),.Y(q));

endmodule
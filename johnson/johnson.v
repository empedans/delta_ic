// 4bit johnson counter

module johnson( out,rst,clk);
input clk,rst;
output [3:0] out;

reg [3:0] q;

always @(posedge clk)
begin

if(rst) 		// Active high reset
 q=4'b0000;
 else
 	begin 
 		q[0]<=q[1];		// 1 bit shifts to right every clock cycle
  		q[1]<=q[2];
  		q[2]<=q[3];
   		q[3]<=(~q[0]);		// but first bit always holds complement of last bit
 	end
 end

assign out=q;  
endmodule

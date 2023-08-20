`timescale 1ns / 1ps

module ringcounter(clk, rst, count);

parameter WIDTH = 4;            // Counter width
input wire clk;             
input wire rst;              
output reg [(WIDTH-1):0] count;
integer i;

reg [(WIDTH-1):0] shifted_count; // Shifted version of the counter

always @(posedge clk) begin
    if (rst)
        shifted_count <= 4'b1000; // Reset the shifted count on reset signal
    else begin
        shifted_count[WIDTH-1] <= shifted_count[0]; // Shift the leftmost bit
        for (i = WIDTH-2; i >= 0; i = i - 1)   shifted_count[i] <= shifted_count[i+1];
	end
    end


assign count = shifted_count;   // Output the shifted count  

endmodule

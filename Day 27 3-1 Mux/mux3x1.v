`timescale 1ns/1ps
module mux3x1 (
    input d0, 
    input d1,
    input d2, 
    input [1:0] sel, 
    output y 
);
    assign y = (sel == 2'b00) ? d0 : (sel == 2'b01) ? d1 : d2;
endmodule


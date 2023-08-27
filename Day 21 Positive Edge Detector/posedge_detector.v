`timescale 1ns/1ps
module posedge_detector ( input data,            
                      input clk,            
                      output pe);           
    reg   pre_data;                          
 

  always @ (posedge clk) begin
    pre_data <= data;
  end
 
  assign pe = data & ~pre_data;            
endmodule 
 
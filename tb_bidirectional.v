`timescale 1ns / 1ps
module tb_bidirectional;
   parameter MSB = 4;        

   reg data;                  
   reg clk;                   
   reg en;                    
   reg dir;                   
   reg rstn;                  
   wire [MSB-1:0] out;        

   // Instantiate design (16-bit shift register) by passing MSB and connect with TB signals
   bidirectional  #(MSB) sr0  (  .d (data),
                             .clk (clk),
                             .en (en),
                             .dir (dir),
                             .rstn (rstn),
                             .out (out));

   // Generate clock time period = 20ns, freq => 50MHz
   always #10 clk = ~clk;

   // Initialize variables to default values at time 0
   initial begin
      clk <= 0;
      en <= 0;
      dir <= 0;
      rstn <= 0;
      data <= 'h1;
   end

   // Drive main stimulus to the design to verify if this works
   initial begin
   
      // 1. Apply reset and deassert reset after some time
      rstn <= 0;
      #20 rstn <= 1;
          en <= 1;
          
	  // 2. For 7 clocks, drive alternate values to data pin
      repeat (7) @ (posedge clk)
         data <= ~data;
   
     // 4. Shift direction and drive alternate value to data pin for another 7 clocks
      #10 dir <= 1;
      repeat (7) @ (posedge clk)
         data <= ~data;

      // 5. Drive nothing for next 7 clocks, allow shift register to simply shift based on dir
      repeat (7) @ (posedge clk);
      
      // 6. Finish the simulation
       #300 $finish;
   end

   // Monitor values of these variables and print them into the logfile for debug
   initial
      $monitor ("rstn=%0b data=%b, en=%0b, dir=%0b, out=%b", rstn, data, en, dir, out);
endmodule

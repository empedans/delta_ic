`timescale 1ns/1ps

module tb_seven_segment;
    reg [3:0] Binary_Num; // 4 bitlik BCD giri?
    wire [6:0] Segment; // 7 segment gösterge ç?k???

    // Instantiate the Binary_7Segment module
    seven_segment dut (
        .Binary_Num(Binary_Num),
        .Segment(Segment)
    );

    // Initialize inputs and perform tests
    initial begin
        Binary_Num = 4'b0000; // BCD 0
        #10;
        
        Binary_Num = 4'b0001; // BCD 1
        #10;
        
        Binary_Num = 4'b0010; // BCD 2
        #10;
        
        Binary_Num = 4'b0011; // BCD 3
        #10;
        
        Binary_Num = 4'b0100; // BCD 4
        #10;
        
        Binary_Num = 4'b0101; // BCD 5
        #10;
        
        Binary_Num = 4'b0110; // BCD 6
        #10;
        
        Binary_Num = 4'b0111; // BCD 7
        #10;
        
        Binary_Num = 4'b1000; // BCD 8
        #10;
        
        Binary_Num = 4'b1001; // BCD 9
        #10;
        
        Binary_Num = 4'b1010; // Di?er durumlar için
        #10;
        
        // Stop the simulation
        $finish;
    end
endmodule

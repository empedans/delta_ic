`timescale 1ns/1ps

module tb_mux;
    reg [15:0] in; // 16 bitlik giri? sinyali
    reg [3:0] sel; // 4 bitlik se�im sinyali
    wire y; // �?k?? sinyali

    // Instantiate the n_1mux module
    mux dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    // Initialize inputs and perform tests
    initial begin
        in = 16'b1010101010101011; // �rnek giri? de?eri
        sel = 4'b0000; // 0 se�imi
        #10;
        
        sel = 4'b0001; // 1 se�imi
        #10;
        
        sel = 4'b0010; // 2 se�imi
        #10;
        
        sel = 4'b0011; // 3 se�imi
        #10;
        
        sel = 4'b0100; // 4 se�imi
        #10;
        
        sel = 4'b0101; // 5 se�imi
        #10;
        
        sel = 4'b0110; // 6 se�imi
        #10;
        
        sel = 4'b0111; // 7 se�imi
        #10;
        
        sel = 4'b1000; // 8 se�imi
        #10;
        
        sel = 4'b1001; // 9 se�imi
        #10;
        
        sel = 4'b1010; // 10 se�imi
        #10;
        
        sel = 4'b1011; // 11 se�imi
        #10;
        
        sel = 4'b1100; // 12 se�imi
        #10;
        
        sel = 4'b1101; // 13 se�imi
        #10;
        
        sel = 4'b1110; // 14 se�imi
        #10;
        
        sel = 4'b1111; // 15 se�imi
        #10;
        
        // Stop the simulation
        $finish;
    end
endmodule

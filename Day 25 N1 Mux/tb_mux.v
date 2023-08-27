`timescale 1ns/1ps

module tb_mux;
    reg [15:0] in; // 16 bitlik giri? sinyali
    reg [3:0] sel; // 4 bitlik seçim sinyali
    wire y; // Ç?k?? sinyali

    // Instantiate the n_1mux module
    mux dut (
        .in(in),
        .sel(sel),
        .y(y)
    );

    // Initialize inputs and perform tests
    initial begin
        in = 16'b1010101010101011; // Örnek giri? de?eri
        sel = 4'b0000; // 0 seçimi
        #10;
        
        sel = 4'b0001; // 1 seçimi
        #10;
        
        sel = 4'b0010; // 2 seçimi
        #10;
        
        sel = 4'b0011; // 3 seçimi
        #10;
        
        sel = 4'b0100; // 4 seçimi
        #10;
        
        sel = 4'b0101; // 5 seçimi
        #10;
        
        sel = 4'b0110; // 6 seçimi
        #10;
        
        sel = 4'b0111; // 7 seçimi
        #10;
        
        sel = 4'b1000; // 8 seçimi
        #10;
        
        sel = 4'b1001; // 9 seçimi
        #10;
        
        sel = 4'b1010; // 10 seçimi
        #10;
        
        sel = 4'b1011; // 11 seçimi
        #10;
        
        sel = 4'b1100; // 12 seçimi
        #10;
        
        sel = 4'b1101; // 13 seçimi
        #10;
        
        sel = 4'b1110; // 14 seçimi
        #10;
        
        sel = 4'b1111; // 15 seçimi
        #10;
        
        // Stop the simulation
        $finish;
    end
endmodule

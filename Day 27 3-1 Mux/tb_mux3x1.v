`timescale 1ns/1ps

module tb_mux3x1;
    reg d0, d1, d2; // 3 giri? sinyali
    reg [1:0]sel; // Seçim sinyali
    wire y; // Ç?k?? sinyali

    // Instantiate the mux_3x1 module
    mux3x1 dut (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .sel(sel),
        .y(y)
    );

    // Initialize inputs and perform tests
    initial begin
        d0 = 1'b0; d1 = 1'b1; d2 = 1'b0; // Örnek giri? de?erleri
        sel = 2'b00; 
        #10;
        
        sel = 2'b10; 
        #10;
        
        d0 = 1'b1; d1 = 1'b1; d2 = 1'b1; // De?i?tirilen giri? de?erleri
        sel = 2'b01; 
        #10;
        
        
        // Stop the simulation
        $finish;
    end
endmodule

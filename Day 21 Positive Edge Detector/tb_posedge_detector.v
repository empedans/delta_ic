`timescale 1ns/1ps

module tb_posedge_detector;
    reg data, clk;
    wire pe;

    // Instantiate the positive edge detector module
    pos_edge_det uut (
        .data(data),
        .clk(clk),
        .pe(pe)
    );

            // Start the clock toggling process
        always  begin
            #5 clk = ~clk;
        end
    initial begin
        // Initialize Inputs
        data = 0;
        clk = 0;

        #15 data = 1;
        #20 data = 0;
        #15 data = 1;
        #10 data = 0;
        #15 data = 1;
        #20 data = 0;
        #15 data = 1;
        #10 data = 0;
        


        // Stop the simulation
        $finish;
    end
endmodule


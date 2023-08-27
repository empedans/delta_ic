`timescale 1ns/1ps 

module tb_subtractor;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] difference;

    // Instantiate the eight-bit subtractor
    subtractor dut (
        .a(a),
        .b(b),
        .difference(difference)
    );

    initial begin
        // Initialize inputs
        a = 8'b11001100; // Example value
        b = 8'b00110011; // Example value

        // Wait a few time units
        #10;

	a = 8'b11101100; // Example value
        b = 8'b00110111; // Example value

        // Wait a few time units
        #10;
	
	a = 8'b00011100; // Example value
        b = 8'b00110011; // Example value

        // Wait a few time units
        #10;

        

        // Stop the simulation
        $finish;
    end

endmodule


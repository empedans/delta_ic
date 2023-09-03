`timescale 1ns / 1ps
module universal_shifter(
    input [3:0] data_in,
    input [1:0] mode,
    input clk,
    input reset,
    output reg [3:0] data_out
);

    always @(posedge clk) begin
        if (reset)
            data_out <= 4'b0000; // Reset the data_out when reset is asserted
        else begin
            case (mode)
                2'b00: data_out <= data_out; // No change in data_out (Hold)
                2'b01: data_out <= {data_out[0], data_in[3:1]}; // Shift right
                2'b10: data_out <= {data_in[2:0], data_out[3]}; // Shift left
                2'b11: data_out <= data_in; // Load data_in
                default: data_out <= 4'b0000; // Default case (Reset data_out)
            endcase
        end
    end

endmodule

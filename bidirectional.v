`timescale 1ns / 1ps

module bidirectional #(parameter MSB = 4) (
    input d,                      // Input for data to the first flop in the shift register
    input clk,                    // Clock input for all flops in the shift register
    input en,                     // Enable input to switch the shift register on/off
    input dir,                    // Input to shift in either left or right direction
    input rstn,                   // Input to reset the register to a default value
    output reg [MSB-1:0] out      // Output to read out the current value of all flops in this register
);

    always @ (posedge clk) begin
        if (!rstn)
            out <= 0;
        else begin
            if (en)
                case (dir)
                    0 : out <= {out[MSB-2:0], d}; // Shift left
                    1 : out <= {d, out[MSB-1:1]}; // Shift right
                endcase
            else
                out <= out;
        end
    end

endmodule

`timescale 1ns/1ps
module moore (
    input clk,
    input reset,
    input data,
    output reg tick
);

    // FSM States
    parameter S0 = 2'b00; // Durum 0
    parameter S1 = 2'b01; // Durum 1
    parameter S2 = 2'b10; // Durum 2
    parameter S3 = 2'b11; // Durum 3
    
    // Current state reg
    reg [1:0] state;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            tick <= 0;
        end else begin
            case (state)
                S0: begin
                    if (data) begin
                        state <= S1;
                        tick <= 0;
                    end else begin
                        state <= S0;
                        tick <= 0;
                    end
                end
                S1: begin
                    if (!data) begin
                        state <= S2;
                        tick <= 0;
                    end else begin
                        state <= S0;
                        tick <= 0;
                    end
                end
                S2: begin
                    if (data) begin
                        state <= S3;
                        tick <= 0;
                    end else begin
                        state <= S0;
                        tick <= 0;
                    end
                end
                S3: begin
                    if (!data) begin
                        state <= S0;
                        tick <= 1; 
                    end else begin
                        state <= S0;
                        tick <= 0;
                    end
                end
                default: begin
                    state <= S0;
                    tick <= 0;
                end
            endcase
        end
    end
endmodule


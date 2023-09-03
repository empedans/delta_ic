module downCounter(
    input wire clk,
    input wire reset,
    output reg [3:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 4'b0000; // Reset the counter to 0 when reset is asserted
        else
            count <= count - 1; // Decrement the counter on every clock edge
    end

endmodule

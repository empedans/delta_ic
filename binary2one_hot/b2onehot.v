module b2onehot(binary_input, one_hot_output);
parameter N = 4;
input wire [N-1:0] binary_input; // N-bit binary input
output reg [2**N-1:0] one_hot_output; // 2^N-bit one-hot encoded output

assign one_hot_output = 0; // Initialize all bits to 0

integer i;
always @* begin
    for (i = 0; i < 2**N; i = i + 1) begin
        if (i == binary_input)
            one_hot_output[i] = 1;		// it shifts from the rightmost bit to the left
        else
            one_hot_output[i] = 0;
    end
end

endmodule


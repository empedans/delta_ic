module multiplier (
    input wire [3:0] A, // 4-bitlik ilk çarpan
    input wire [3:0] B, // 4-bitlik ikinci çarpan
    output wire [7:0] P // 8-bitlik çarp?m sonucu
);
    assign P = A * B;
endmodule

module multiplier (
    input wire [3:0] A, // 4-bitlik ilk �arpan
    input wire [3:0] B, // 4-bitlik ikinci �arpan
    output wire [7:0] P // 8-bitlik �arp?m sonucu
);
    assign P = A * B;
endmodule

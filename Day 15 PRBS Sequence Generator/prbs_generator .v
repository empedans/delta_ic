module prbs_generator (
    input clk,
    input reset,
    output wire prbs_output
);
    parameter BIT_WIDTH = 8; // Parametre ile bit say?s?n? ayarlay?n
    reg [BIT_WIDTH-1:0] shift_register = {BIT_WIDTH{1'b1}}; // Initial value, non-zero
    wire random = shift_register[BIT_WIDTH-1] ^ shift_register[BIT_WIDTH-3] ^ ~shift_register[BIT_WIDTH-5]; // choice of random bit 

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_register <= {BIT_WIDTH{1'b1}};
        else
            shift_register <= {shift_register[BIT_WIDTH-2:0], random};
    end

    assign prbs_output = shift_register[0];
endmodule


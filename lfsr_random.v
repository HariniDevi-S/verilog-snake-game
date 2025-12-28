// LFSR-based random number generator for food placement
module lfsr_random (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [2:0] random_x,
    output reg [2:0] random_y
);

    reg [7:0] lfsr;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            lfsr <= 8'b10101010;
        end else if (enable) begin
            lfsr <= {lfsr[6:0], lfsr[7] ^ lfsr[5] ^ lfsr[4] ^ lfsr[3]};
        end
    end
    
    always @(*) begin
        random_x = lfsr[2:0];
        random_y = lfsr[5:3];
    end

endmodule
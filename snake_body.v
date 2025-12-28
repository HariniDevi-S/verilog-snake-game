// Manages snake position and movement
module snake_body (
    input wire clk,
    input wire reset,
    input wire move_enable,
    input wire [1:0] direction,
    input wire grow,
    output reg [2:0] head_x,
    output reg [2:0] head_y,
    output reg [2:0] body1_x,
    output reg [2:0] body1_y,
    output reg [2:0] body2_x,
    output reg [2:0] body2_y,
    output reg [3:0] length
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            head_x <= 4;
            head_y <= 4;
            body1_x <= 4;
            body1_y <= 3;
            body2_x <= 4;
            body2_y <= 2;
            length <= 3;
        end else if (move_enable) begin
            if (!grow) begin
                body2_x <= body1_x;
                body2_y <= body1_y;
            end
            body1_x <= head_x;
            body1_y <= head_y;
            
            case (direction)
                2'b00: head_y <= head_y - 1;
                2'b01: head_y <= head_y + 1;
                2'b10: head_x <= head_x - 1;
                2'b11: head_x <= head_x + 1;
            endcase
            
            if (grow) begin
                length <= length + 1;
            end
        end
    end

endmodule
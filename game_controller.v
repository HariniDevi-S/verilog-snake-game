// FSM managing game states
module game_controller (
    input wire clk,
    input wire reset,
    input wire start,
    input wire wall_collision,
    input wire self_collision,
    input wire food_eaten,
    output reg [1:0] state,
    output reg move_enable,
    output reg new_food,
    output reg [7:0] score
);

    localparam IDLE = 2'b00;
    localparam PLAYING = 2'b01;
    localparam GAME_OVER = 2'b10;
    
    reg [15:0] move_counter;
    localparam MOVE_SPEED = 16'd10000;
    
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            score <= 0;
            move_enable <= 0;
            new_food <= 0;
            move_counter <= 0;
        end else begin
            move_enable <= 0;
            new_food <= 0;
            
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= PLAYING;
                        score <= 0;
                        new_food <= 1;
                    end
                end
                
                PLAYING: begin
                    if (move_counter >= MOVE_SPEED) begin
                        move_enable <= 1;
                        move_counter <= 0;
                    end else begin
                        move_counter <= move_counter + 1;
                    end
                    
                    if (wall_collision || self_collision) begin
                        state <= GAME_OVER;
                    end
                    
                    if (food_eaten) begin
                        score <= score + 1;
                        new_food <= 1;
                    end
                end
                
                GAME_OVER: begin
                    if (start) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end

endmodule
// Top-level module integrating all components
module snake_game_top (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [1:0] direction,
    output wire [1:0] game_state,
    output wire [7:0] score,
    output wire [2:0] snake_head_x,
    output wire [2:0] snake_head_y,
    output wire [2:0] food_x,
    output wire [2:0] food_y
);

    wire move_enable, new_food, grow;
    wire wall_collision, self_collision;
    wire [2:0] body1_x, body1_y, body2_x, body2_y;
    wire [3:0] length;
    wire food_eaten;
    
    assign food_eaten = (snake_head_x == food_x) && (snake_head_y == food_y);
    assign grow = food_eaten;
    
    game_controller ctrl (
        .clk(clk),
        .reset(reset),
        .start(start),
        .wall_collision(wall_collision),
        .self_collision(self_collision),
        .food_eaten(food_eaten),
        .state(game_state),
        .move_enable(move_enable),
        .new_food(new_food),
        .score(score)
    );
    
    snake_body snake (
        .clk(clk),
        .reset(reset),
        .move_enable(move_enable),
        .direction(direction),
        .grow(grow),
        .head_x(snake_head_x),
        .head_y(snake_head_y),
        .body1_x(body1_x),
        .body1_y(body1_y),
        .body2_x(body2_x),
        .body2_y(body2_y),
        .length(length)
    );
    
    collision_detector collision (
        .head_x(snake_head_x),
        .head_y(snake_head_y),
        .body1_x(body1_x),
        .body1_y(body1_y),
        .body2_x(body2_x),
        .body2_y(body2_y),
        .wall_collision(wall_collision),
        .self_collision(self_collision)
    );
    
    lfsr_random food_gen (
        .clk(clk),
        .reset(reset),
        .enable(new_food),
        .random_x(food_x),
        .random_y(food_y)
    );

endmodule
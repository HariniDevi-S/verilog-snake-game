// Detects wall collision and self-collision
module collision_detector (
    input wire [2:0] head_x,
    input wire [2:0] head_y,
    input wire [2:0] body1_x,
    input wire [2:0] body1_y,
    input wire [2:0] body2_x,
    input wire [2:0] body2_y,
    output wire wall_collision,
    output wire self_collision
);

    assign wall_collision = (head_x > 7) || (head_y > 7);
    
    assign self_collision = ((head_x == body1_x) && (head_y == body1_y)) ||
                           ((head_x == body2_x) && (head_y == body2_y));

endmodule
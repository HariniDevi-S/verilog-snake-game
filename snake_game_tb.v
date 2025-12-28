// Testbench for snake game
`timescale 1ns/1ps

module snake_game_tb;

    reg clk, reset, start;
    reg [1:0] direction;
    wire [1:0] game_state;
    wire [7:0] score;
    wire [2:0] snake_head_x, snake_head_y;
    wire [2:0] food_x, food_y;
    
    snake_game_top dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .direction(direction),
        .game_state(game_state),
        .score(score),
        .snake_head_x(snake_head_x),
        .snake_head_y(snake_head_y),
        .food_x(food_x),
        .food_y(food_y)
    );
    
    initial clk = 0;
    always #5 clk = ~clk;
    
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, snake_game_tb);
        
        reset = 1;
        start = 0;
        direction = 2'b11;
        
        #20 reset = 0;
        #30 start = 1;
        #20 start = 0;
        
        #100000 direction = 2'b01;
        #100000 direction = 2'b10;
        #100000 direction = 2'b00;
        #100000 direction = 2'b11;
        
        #500000;
        
        $display("Final Score: %d", score);
        $display("Game State: %d", game_state);
        
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t | State=%b | Score=%d | Head=(%d,%d) | Food=(%d,%d)", 
                 $time, game_state, score, snake_head_x, snake_head_y, food_x, food_y);
    end

endmodule
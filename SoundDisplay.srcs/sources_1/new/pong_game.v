`timescale 1ns / 1ps

module pong_game(
    input clock,
    input sw_player,
    input btn_left,
    input btn_down,
    input btn_right,
    input btn_up,
    input btn_centre,
    input btnC,
    input [12:0] pixel_index,
    input [3:0] vol,
    output reg [15:0] pixel_data = 0,
    output [3:0] an,
    output [7:0] seg
    );
    
    reg counter_ball = 0;
    reg [17:0] counter_0 = 0; 
    reg [16:0] counter_1 = 0;
    reg [15:0] counter_2 = 0;
    reg [18:0] counter_theme = 1;
    wire [6:0] x;
    wire [6:0] y;
    reg reset;
    reg [23:0] reset_counter = 1;
    reg stop = 1;
    reg point_1 = 0;
    reg point_2 = 0;
    reg [20:0] ai_counter1 = 0;
    reg [20:0] ai_counter2 = 0;
    reg [20:0] ai_counter3 = 0;
    wire [3:0] p1_score;
    wire [3:0] p2_score;

            
    dimension_norm dim(pixel_index,x,y);
    pong_score ps(clock, sw_player, point_1, point_2, reset, an, seg, p1_score, p2_score);
    
    //theme 1
    localparam bg_1 = 16'h4647;
    localparam paddle_r_1 = 16'h035F;
    localparam paddle_l_1 = 16'hE943;
    localparam ball_1 = 16'h0;
    
    //theme 2
    localparam bg_2 = 16'hEE42;
    localparam paddle_r_2 = 16'h6AA1;
    localparam paddle_l_2 = 16'h5924;
    localparam ball_2 = 16'h145D;
    
    //theme 3
    localparam bg_3 = 16'hD145;
    localparam paddle_r_3 = 16'h03B9;
    localparam paddle_l_3 = 16'hEF20;
    localparam ball_3 = 16'hFFFF;
    
    integer theme = 1;
    
    //p1 paddle
    integer p1_paddle_x = 8;
    integer p1_paddle_y_top = 25;
    integer p1_paddle_y_bot = 38;
    
    //p2 paddle
    integer p2_paddle_x = 87;
    integer p2_paddle_y_top = 25;
    integer p2_paddle_y_bot = 38;
    
    //paddles shifts
    integer paddle_shifts = 4;
    
    //ball
    integer ball_x = 48;
    integer ball_y = 31;
    
    //direction
    reg left_flag = 1;
    reg diag_up_flag = 0;
    reg diag_down_flag = 0;
    
    always @ (posedge clock) begin
        if (sw_player == 1) begin
            point_1 <= 0;
            point_2 <= 0;
            
            if (p1_score == 10 || p2_score == 10) stop <= 1;
            else stop <= (reset_counter == 1500000) ? 1 : (btn_centre) ? 0 : stop;
            
            reset <= 0;
            reset_counter <= (btnC) ? reset_counter + 1 : 1;
            if (reset_counter == 0) begin
                reset <= 1;
                reset_counter <= 1;
                ball_x <= 48;
                ball_y <= 31; 
            end
            
            
            
            //User Controls for Paddles
                if (btn_down == 1) begin
                    p1_paddle_y_top <= p1_paddle_y_top + paddle_shifts;
                    p1_paddle_y_bot <= p1_paddle_y_bot + paddle_shifts;
                end
                if (btn_down == 1 && p1_paddle_y_bot + paddle_shifts >= 62) begin
                    p1_paddle_y_top <= 49;
                    p1_paddle_y_bot <= 62;
                end
                
                if (btn_left == 1) begin
                    p1_paddle_y_top <= p1_paddle_y_top - paddle_shifts;
                    p1_paddle_y_bot <= p1_paddle_y_bot - paddle_shifts;
                end
                if (btn_left == 1 && p1_paddle_y_top - paddle_shifts <= 1) begin
                    p1_paddle_y_top <= 1;
                    p1_paddle_y_bot <= 14;
                end
                
                if (btn_right == 1) begin
                    p2_paddle_y_top <= p2_paddle_y_top + paddle_shifts;
                    p2_paddle_y_bot <= p2_paddle_y_bot + paddle_shifts;
                end
                if (btn_right == 1 && p2_paddle_y_bot + paddle_shifts >= 62) begin
                    p2_paddle_y_top <= 49;
                    p2_paddle_y_bot <= 62;
                end
                
                if (btn_up == 1) begin
                    p2_paddle_y_top <= p2_paddle_y_top - paddle_shifts;
                    p2_paddle_y_bot <= p2_paddle_y_bot - paddle_shifts;
                end
                if (btn_up == 1 && p2_paddle_y_top - paddle_shifts <= 1) begin
                    p2_paddle_y_top <= 1;
                    p2_paddle_y_bot <= 14;
                end
    
            //Ball directions depending on flags
           
            if (((theme == 3) ? counter_2 : ((theme == 2) ? counter_1 : counter_0)) == 0 && ~stop) begin
                if (left_flag == 1 && diag_up_flag == 0 && diag_down_flag == 0) begin
                    ball_x <= ball_x - 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 0 && diag_down_flag == 0) begin
                    ball_x <= ball_x + 1;
                end
                
                if (left_flag == 1 && diag_up_flag == 1 && diag_down_flag == 0) begin
                    ball_x <= ball_x - 1;
                    ball_y <= ball_y - 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 1 && diag_down_flag == 0) begin
                    ball_x <= ball_x + 1;
                    ball_y <= ball_y - 1;
                end
                
                if (left_flag == 1 && diag_up_flag == 0 && diag_down_flag == 1) begin
                    ball_x <= ball_x - 1;
                    ball_y <= ball_y + 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 0 && diag_down_flag == 1) begin
                    ball_x <= ball_x + 1;
                    ball_y <= ball_y + 1;
                end
           end
            
            //Flag changes depending on where it hits paddle
            //Player 1 Left Paddle
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= p1_paddle_y_top && ball_y <= (p1_paddle_y_top+4)))) begin
                left_flag <= 0;
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= (p1_paddle_y_top+5) && ball_y <= (p1_paddle_y_top+8)))) begin
                left_flag <= 0;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= (p1_paddle_y_top+9) && ball_y <= (p1_paddle_y_top+13)))) begin
                left_flag <= 0;
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            
            //Player 2 Right Paddle
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= p2_paddle_y_top && ball_y <= (p2_paddle_y_top+4)))) begin
                left_flag <= 1;
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= (p2_paddle_y_top+5) && ball_y <= (p2_paddle_y_top+8)))) begin
                left_flag <= 1;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= (p2_paddle_y_top+9) && ball_y <= (p2_paddle_y_top+13)))) begin
                left_flag <= 1;
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            
            //Flag changes when it hits horizontal sides
            if (ball_y == 0) begin
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            if (ball_y == 63) begin
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            
            
            //Ball reset when it hits vertical sides
            if (ball_x == 0 || ball_x == 95) begin
                ball_x <= 48;
                ball_y <= 31;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
                if (left_flag) point_2 <= 1;
                else point_1 <= 1;
                left_flag <= ~left_flag;
                stop <= 1;
                
            end
            
           
            
            //Switch themes depending on vol change
            if (vol >= 10 && counter_theme != 0) counter_theme <= counter_theme + 1;
            else if (vol >= 10 && counter_theme == 0) counter_theme <= counter_theme;
            else counter_theme <= 1;
            
            if (counter_theme == 0 && vol <= 3) theme <= (theme == 3) ? 1 : theme + 1;
    
            case (theme)
            1 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_1;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_1;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_1;
                else pixel_data <= bg_1;
                paddle_shifts <= 4;
                end
            2 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_2;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_2;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_2;
                else pixel_data <= bg_2;
                paddle_shifts <= 4;  
                end
            3 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_3;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_3;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_3;
                else pixel_data <= bg_3;
                paddle_shifts <= 4;
                end
            endcase
            
            counter_0 <= counter_0 + 1;
            counter_1 <= counter_1 + 1;
            counter_2 <= counter_2 + 1;
        end 
        
        else if (sw_player == 0) begin
            point_1 <= 0;
            point_2 <= 0;
            
            if (p1_score == 10 || p2_score == 10) stop <= 1;
            else stop <= (reset_counter == 1500000) ? 1 : (btn_centre) ? 0 : stop;
            
            reset <= 0;
            reset_counter <= (btnC) ? reset_counter + 1 : 1;
            if (reset_counter == 0) begin
                reset <= 1;
                reset_counter <= 1;
                ball_x <= 48;
                ball_y <= 31; 
            end

            
            
            //User Controls for Paddle
            if (btn_down == 1) begin
                p1_paddle_y_top <= p1_paddle_y_top + paddle_shifts;
                p1_paddle_y_bot <= p1_paddle_y_bot + paddle_shifts;
            end
            if (btn_down == 1 && p1_paddle_y_bot + paddle_shifts >= 62) begin
                p1_paddle_y_top <= 49;
                p1_paddle_y_bot <= 62;
            end
            
            if (btn_up == 1) begin
                p1_paddle_y_top <= p1_paddle_y_top - paddle_shifts;
                p1_paddle_y_bot <= p1_paddle_y_bot - paddle_shifts;
            end
            if (btn_up == 1 && p1_paddle_y_top - paddle_shifts <= 1) begin
                p1_paddle_y_top <= 1;
                p1_paddle_y_bot <= 14;
            end
            
            //AI Paddle
            if (ball_y >= p2_paddle_y_bot-3 && ball_x >= 55 && ((theme == 1) ? ai_counter1 : (theme == 2) ? ai_counter2 : (theme == 3) ? ai_counter3 : 1) == 0) begin
                p2_paddle_y_top <= p2_paddle_y_top + paddle_shifts;
                p2_paddle_y_bot <= p2_paddle_y_bot + paddle_shifts;
                if (p2_paddle_y_bot + paddle_shifts > 62) begin
                    p2_paddle_y_top <= 49;
                    p2_paddle_y_bot <= 62;
                end
            end
            
            if (ball_y <= p2_paddle_y_top+3 && ball_x >= 55 && ((theme == 1) ? ai_counter1 : (theme == 2) ? ai_counter2 : (theme == 3) ? ai_counter3 : 1) == 0) begin
                p2_paddle_y_top <= p2_paddle_y_top - paddle_shifts;
                p2_paddle_y_bot <= p2_paddle_y_bot - paddle_shifts;
                if (p2_paddle_y_top - paddle_shifts < 1) begin
                    p2_paddle_y_top <= 1;
                    p2_paddle_y_bot <= 14;
                end
            end
            
            if ((ball_y > p2_paddle_y_top+3) && (ball_y < p2_paddle_y_bot-3)) begin
                p2_paddle_y_top <= p2_paddle_y_top;
                p2_paddle_y_bot <= p2_paddle_y_bot;
            end
            
            //Ball directions depending on flags
           
            if (((theme == 3) ? counter_2 : ((theme == 2) ? counter_1 : counter_0)) == 0 && ~stop) begin
                if (left_flag == 1 && diag_up_flag == 0 && diag_down_flag == 0) begin
                    ball_x <= ball_x - 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 0 && diag_down_flag == 0) begin
                    ball_x <= ball_x + 1;
                end
                
                if (left_flag == 1 && diag_up_flag == 1 && diag_down_flag == 0) begin
                    ball_x <= ball_x - 1;
                    ball_y <= ball_y - 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 1 && diag_down_flag == 0) begin
                    ball_x <= ball_x + 1;
                    ball_y <= ball_y - 1;
                end
                
                if (left_flag == 1 && diag_up_flag == 0 && diag_down_flag == 1) begin
                    ball_x <= ball_x - 1;
                    ball_y <= ball_y + 1;
                end
                
                if (left_flag == 0 && diag_up_flag == 0 && diag_down_flag == 1) begin
                    ball_x <= ball_x + 1;
                    ball_y <= ball_y + 1;
                end
            end
           
            
            //Flag changes depending on where it hits paddle
            //Player 1 Left Paddle
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= p1_paddle_y_top && ball_y <= (p1_paddle_y_top+3)))) begin
                left_flag <= 0;
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= (p1_paddle_y_top+4) && ball_y <= (p1_paddle_y_top+7)))) begin
                left_flag <= 0;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p1_paddle_x+2)) && ((ball_y >= (p1_paddle_y_top+8) && ball_y <= (p1_paddle_y_top+11)))) begin
                left_flag <= 0;
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            
            //AI Right Paddle
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= p2_paddle_y_top && ball_y <= (p2_paddle_y_top+3)))) begin
                left_flag <= 1;
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= (p2_paddle_y_top+4) && ball_y <= (p2_paddle_y_top+7)))) begin
                left_flag <= 1;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
            end
            
            if ((ball_x == (p2_paddle_x-2)) && ((ball_y >= (p2_paddle_y_top+8) && ball_y <= (p2_paddle_y_top+11)))) begin
                left_flag <= 1;
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            
            //Flag changes when it hits horizontal sides
            if (ball_y == 0) begin
                diag_up_flag <= 0;
                diag_down_flag <= 1;
            end
            if (ball_y == 63) begin
                diag_up_flag <= 1;
                diag_down_flag <= 0;
            end
            
            
            
            //Ball reset when it hits vertical sides
            if (ball_x == 0 || ball_x == 95) begin
                ball_x <= 48;
                ball_y <= 31;
                diag_up_flag <= 0;
                diag_down_flag <= 0;
                if (left_flag) point_2 <= 1;
                else point_1 <= 1;
                left_flag <= ~left_flag;
                stop <= 1;
                
            end
            
            
            //Switch themes depending on vol change
            if (vol >= 10 && counter_theme != 0) counter_theme <= counter_theme + 1;
            else if (vol >= 10 && counter_theme == 0) counter_theme <= counter_theme;
            else counter_theme <= 1;
                        
            if (counter_theme == 0 && vol <= 3) theme <= (theme == 3) ? 1 : theme + 1;
            
            case (theme)
            1 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_1;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_1;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_1;
                else pixel_data <= bg_1;
                paddle_shifts <= 4;
                end
            2 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_2;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_2;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_2;
                else pixel_data <= bg_2;
                paddle_shifts <= 4;  
                end
            3 : begin
                if ((x == ball_x && y == ball_y) || (x == ball_x + 1 && y == ball_y) || (x == ball_x - 1 && y == ball_y) || (x == ball_x && y == ball_y + 1) || (x == ball_x && y == ball_y - 1) || (x == ball_x + 1 && y == ball_y + 1) || (x == ball_x + 1 && y == ball_y - 1) || (x == ball_x - 1 && y == ball_y + 1) || (x == ball_x - 1 && y == ball_y - 1)) pixel_data <= ball_3;
                else if ((x == p1_paddle_x || x == p1_paddle_x - 1) && (y >= p1_paddle_y_top && y <= p1_paddle_y_bot)) pixel_data <= paddle_l_3;
                else if ((x == p2_paddle_x || x == p2_paddle_x + 1) && (y >= p2_paddle_y_top && y <= p2_paddle_y_bot)) pixel_data <= paddle_r_3;
                else pixel_data <= bg_3;
                paddle_shifts <= 4;
                end
            endcase
            
            counter_0 <= counter_0 + 1;
            counter_1 <= counter_1 + 1;
            counter_2 <= counter_2 + 1;
            ai_counter1 <= (ai_counter1 == 20'hFFAFF) ? 0 : ai_counter1 + 1;
            ai_counter2 <= (ai_counter2 == 20'hA00FF) ? 0 : ai_counter2 + 1;
            ai_counter3 <= (ai_counter3 == 20'h500FF) ? 0 : ai_counter3 + 1;
        end
        
    end
endmodule

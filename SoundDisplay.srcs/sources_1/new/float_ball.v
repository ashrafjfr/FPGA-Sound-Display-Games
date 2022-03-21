`timescale 1ns / 1ps

module float_ball(
    input clock,
    input btn_left,
    input btn_right,
    input btn_centre,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data = 0,
    input [3:0] vol,
    output [3:0] an_float,
    output [7:0] seg_float
    );
    
    wire [6:0] x;
    wire [6:0] y;
    reg point = 0;
    wire done = 0;
    reg clear = 0;
        
    dimension dim(pixel_index,x,y);
    float_score scr(clock, point, btn_centre, btn_left, btn_right, an_float, seg_float);
    
    localparam background = 16'h1A90;
    localparam inner = 16'hEB60;
    
    localparam hoop_ring = 16'hD186;
    localparam hoop_net_dark = 16'h9492;
    localparam hoop_net_light = 16'hCE59;
    
    integer x_top_bor_left = 46;
    integer x_top_bor_rgt = 50;
    integer x_diag_left_1 = 45;
    integer x_diag_left_2 = 44;
    integer x_left_bor = 43;
    integer x_diag_rgt_1 = 51;
    integer x_diag_rgt_2 = 52;
    integer x_rgt_bor = 53;
    
    integer y_top_bor = 53;
    integer y_bot_bor = 63;
    integer y_diag_left_1 = 62;
    integer y_diag_left_2 = 61;
    integer y_side_bor_bot = 60;
    integer y_diag_rgt_1 = 55;
    integer y_diag_rgt_2 = 54;
    integer y_side_bor_top = 56;
    
    always @ (posedge clock) begin
    
    point <= 0;
    
    if (((x_left_bor >= 0 && x_rgt_bor <= 12) && (y_top_bor == 20)) || ((x_left_bor >= 84 && x_rgt_bor <= 95) && (y_top_bor == 20))) begin
        point <= 1;
    end
    
    if (btn_left == 1) begin
        x_top_bor_left <= x_top_bor_left - 6;
        x_top_bor_rgt <= x_top_bor_rgt - 6;
        x_diag_left_1 <= x_diag_left_1 - 6;
        x_diag_left_2 <= x_diag_left_2 - 6;
        x_left_bor <= x_left_bor - 6;
        x_diag_rgt_1 <= x_diag_rgt_1 - 6;
        x_diag_rgt_2 <= x_diag_rgt_2 - 6;
        x_rgt_bor <= x_rgt_bor -6;
    end
    
    if (btn_right == 1) begin
        x_top_bor_left <= x_top_bor_left + 6;
        x_top_bor_rgt <= x_top_bor_rgt + 6;
        x_diag_left_1 <= x_diag_left_1 + 6;
        x_diag_left_2 <= x_diag_left_2 + 6;
        x_left_bor <= x_left_bor + 6;
        x_diag_rgt_1 <= x_diag_rgt_1 + 6;
        x_diag_rgt_2 <= x_diag_rgt_2 + 6;
        x_rgt_bor <= x_rgt_bor + 6;
    end
    
    if (btn_left == 1 && x_left_bor == 1) begin
        x_top_bor_left <= x_top_bor_left;
        x_top_bor_rgt <= x_top_bor_rgt;
        x_diag_left_1 <= x_diag_left_1;
        x_diag_left_2 <= x_diag_left_2;
        x_left_bor <= x_left_bor;
        x_diag_rgt_1 <= x_diag_rgt_1;
        x_diag_rgt_2 <= x_diag_rgt_2;
        x_rgt_bor <= x_rgt_bor;
    end
    
    if (btn_right == 1 && x_rgt_bor == 95) begin
        x_top_bor_left <= x_top_bor_left;
        x_top_bor_rgt <= x_top_bor_rgt;
        x_diag_left_1 <= x_diag_left_1;
        x_diag_left_2 <= x_diag_left_2;
        x_left_bor <= x_left_bor;
        x_diag_rgt_1 <= x_diag_rgt_1;
        x_diag_rgt_2 <= x_diag_rgt_2;
        x_rgt_bor <= x_rgt_bor;
    end
    
    
    
    
    case(vol)
        0 : begin
            y_top_bor <= 53;
            y_diag_rgt_2 <= 54;
            y_diag_rgt_1 <= 55;
            y_side_bor_top <= 56;
            y_side_bor_bot <= 60;
            y_diag_left_2 <= 61;
            y_diag_left_1 <= 62;
            y_bot_bor <= 63;
            end
        1 : begin
            y_top_bor <= 50;
            y_diag_rgt_2 <= 51;
            y_diag_rgt_1 <= 52;
            y_side_bor_top <= 53;
            y_side_bor_bot <= 57;
            y_diag_left_2 <= 58;
            y_diag_left_1 <= 59;
            y_bot_bor <= 60;
            end
        2 : begin
            y_top_bor <= 47;
            y_diag_rgt_2 <= 48;
            y_diag_rgt_1 <= 49;
            y_side_bor_top <= 50;
            y_side_bor_bot <= 54;
            y_diag_left_2 <= 55;
            y_diag_left_1 <= 56;
            y_bot_bor <= 57;
            end
        3 : begin
            y_top_bor <= 44;
            y_diag_rgt_2 <= 45;
            y_diag_rgt_1 <= 46;
            y_side_bor_top <= 47;
            y_side_bor_bot <= 52;
            y_diag_left_2 <= 53;
            y_diag_left_1 <= 54;
            y_bot_bor <= 55;
            end
        4 : begin
            y_top_bor <= 41;
            y_diag_rgt_2 <= 42;
            y_diag_rgt_1 <= 43;
            y_side_bor_top <= 44;
            y_side_bor_bot <= 48;
            y_diag_left_2 <= 49;
            y_diag_left_1 <= 50;
            y_bot_bor <= 51;
            end
        5 : begin
            y_top_bor <= 38;
            y_diag_rgt_2 <= 39;
            y_diag_rgt_1 <= 40;
            y_side_bor_top <= 41;
            y_side_bor_bot <= 45;
            y_diag_left_2 <= 46;
            y_diag_left_1 <= 47;
            y_bot_bor <= 48;
            end
        6 : begin
            y_top_bor <= 35;
            y_diag_rgt_2 <= 36;
            y_diag_rgt_1 <= 37;
            y_side_bor_top <= 38;
            y_side_bor_bot <= 42;
            y_diag_left_2 <= 43;
            y_diag_left_1 <= 44;
            y_bot_bor <= 45;
            end
        7 : begin
            y_top_bor <= 32;
            y_diag_rgt_2 <= 33;
            y_diag_rgt_1 <= 34;
            y_side_bor_top <= 35;
            y_side_bor_bot <= 39;
            y_diag_left_2 <= 40;
            y_diag_left_1 <= 41;
            y_bot_bor <= 42;
            end
        8 : begin
            y_top_bor <= 29;
            y_diag_rgt_2 <= 30;
            y_diag_rgt_1 <= 31;
            y_side_bor_top <= 31;
            y_side_bor_bot <= 35;
            y_diag_left_2 <= 36;
            y_diag_left_1 <= 37;
            y_bot_bor <= 38;
            end
        9 : begin
            y_top_bor <= 26;
            y_diag_rgt_2 <= 27;
            y_diag_rgt_1 <= 28;
            y_side_bor_top <= 29;
            y_side_bor_bot <= 33;
            y_diag_left_2 <= 34;
            y_diag_left_1 <= 35;
            y_bot_bor <= 36;
            end
        10 : begin
            y_top_bor <= 23;
            y_diag_rgt_2 <= 24;
            y_diag_rgt_1 <= 25;
            y_side_bor_top <= 26;
            y_side_bor_bot <= 30;
            y_diag_left_2 <= 31;
            y_diag_left_1 <= 32;
            y_bot_bor <= 33;
            end
        11 : begin
            y_top_bor <= 20;
            y_diag_rgt_2 <= 21;
            y_diag_rgt_1 <= 22;
            y_side_bor_top <= 23;
            y_side_bor_bot <= 27;
            y_diag_left_2 <= 28;
            y_diag_left_1 <= 29;
            y_bot_bor <= 30;
            end
        12 : begin
            y_top_bor <= 17;
            y_diag_rgt_2 <= 18;
            y_diag_rgt_1 <= 19;
            y_side_bor_top <= 20;
            y_side_bor_bot <= 24;
            y_diag_left_2 <= 25;
            y_diag_left_1 <= 26;
            y_bot_bor <= 27;
            end
        13 : begin
            y_top_bor <= 14;
            y_diag_rgt_2 <= 15;
            y_diag_rgt_1 <= 16;
            y_side_bor_top <= 17;
            y_side_bor_bot <= 21;
            y_diag_left_2 <= 22;
            y_diag_left_1 <= 23;
            y_bot_bor <= 24;
            end
        14 : begin
            y_top_bor <= 11;
            y_diag_rgt_2 <= 12;
            y_diag_rgt_1 <= 13;
            y_side_bor_top <= 14;
            y_side_bor_bot <= 18;
            y_diag_left_2 <= 19;
            y_diag_left_1 <= 20;
            y_bot_bor <= 21;
            end
        15 : begin
            y_top_bor <= 8;
            y_diag_rgt_2 <= 9;
            y_diag_rgt_1 <= 10;
            y_side_bor_top <= 11;
            y_side_bor_bot <= 15;
            y_diag_left_2 <= 16;
            y_diag_left_1 <= 17;
            y_bot_bor <= 18;
            end
        endcase
        
        if ((x >= x_top_bor_left && x <= x_top_bor_rgt) && (y == y_top_bor)) pixel_data <= inner;
        else if ((x >= x_diag_left_1 && x <= x_diag_rgt_1) && (y == y_diag_rgt_2)) pixel_data <= inner;
        else if ((x >= x_diag_left_2 && x <= x_diag_rgt_2) && (y == y_diag_rgt_1)) pixel_data <= inner;
        else if ((x >= x_left_bor && x <= x_rgt_bor) && (y >= y_side_bor_top && y <= y_side_bor_bot)) pixel_data <= inner;
        else if ((x >= x_diag_left_2 && x <= x_diag_rgt_2) && (y == y_diag_left_2)) pixel_data <= inner;
        else if ((x >= x_diag_left_1 && x <= x_diag_rgt_1) && (y == y_diag_left_1)) pixel_data <= inner;
        else if ((x >= x_top_bor_left && x <= x_top_bor_rgt) && (y == y_bot_bor)) pixel_data <= inner;
        
        else if (x == 85 && y == 20) pixel_data <= hoop_ring;
        else if ((x >= 93 && x <= 95) && (y == 20 )) pixel_data <= hoop_ring;
        else if ((x >= 86 && x <= 92) && (y == 21 )) pixel_data <= hoop_ring;
        else if ((x == 85 || x == 93) && (y >= 21 && y <= 22)) pixel_data <= hoop_net_light;
        else if ((x == 87 || x == 89 || x == 91) && (y == 22)) pixel_data <= hoop_net_light;
        else if ((x == 86 || x == 88 || x == 90 || x == 92) && (y == 22)) pixel_data <= hoop_net_dark;
        else if ((x == 86 || x == 88 || x == 90 || x == 92) && (y == 23)) pixel_data <= hoop_net_light;
        else if ((x == 87 || x == 89 || x == 91) && (y == 23)) pixel_data <= hoop_net_dark;
        else if ((x == 88 || x == 90) && (y == 24)) pixel_data <= hoop_net_dark;
        else if ((x == 86 || x == 87 || x == 89 || x == 91 || x == 92) && (y == 24)) pixel_data <= hoop_net_light;
        else if ((x >= 86 && x <= 92) && (y == 25)) pixel_data <= hoop_net_light;
        else if ((x == 86 || x == 88 || x == 90 || x == 92) && (y == 26)) pixel_data <= hoop_net_light;
        else if ((x == 87 || x == 89 || x == 91) && (y == 26)) pixel_data <= hoop_net_dark;
        
        else if (x == 10 && y == 20) pixel_data <= hoop_ring;
        else if ((x >= 0 && x <= 2) && (y == 20)) pixel_data <= hoop_ring;
        else if ((x >= 3 && x <= 9) && (y == 21)) pixel_data <= hoop_ring;
        else if ((x == 2 || x == 10) && (y >= 21 && y <= 22)) pixel_data <= hoop_net_light;
        else if ((x == 4 || x == 6 || x == 8) && (y == 22)) pixel_data <= hoop_net_light;
        else if ((x == 3 || x == 5 || x == 7 || x == 9) && (y == 22)) pixel_data <= hoop_net_dark;
        else if ((x == 3 || x == 5 || x == 7 || x == 9) && (y == 23)) pixel_data <= hoop_net_light;
        else if ((x == 4 || x == 6 || x == 8) && (y == 23)) pixel_data <= hoop_net_dark;
        else if ((x == 5 || x == 7) && (y == 24)) pixel_data <= hoop_net_dark;
        else if ((x == 3 || x == 4 || x == 6 || x == 8 || x == 9) && (y == 24)) pixel_data <= hoop_net_light;
        else if ((x >= 3 && x <= 9) && (y == 25)) pixel_data <= hoop_net_light;
        else if ((x == 3 || x == 5 || x == 7 || x == 9) && (y == 26)) pixel_data <= hoop_net_light;
        else if ((x == 4 || x == 6 || x == 8) && (y == 26)) pixel_data <= hoop_net_dark;
        else pixel_data <= background;
    end
  
endmodule

`timescale 1ns / 1ps

module draw_oled(
    input clock,
    input reset,
    input btn_left,
    input btn_right,
    input [12:0] pixel_index,
    input sw_onoff_border, //sw2
    input sw_border_type, //sw3
    input sw_vol_bar, //sw4
    input sw_alt_color, //sw5
    input [3:0] level,
    output reg [15:0] pixel_data = 0
    );
    
    
    
    wire [6:0] x;
    wire [6:0] y;
    
    dimension dim(pixel_index, x, y);
    
    localparam border = 16'hFFFF;
    localparam black = 16'h0;
    localparam red = 16'hEA22;
    localparam yellow = 16'hF6E0;
    localparam green = 16'h57A0;
    
    localparam border_alt = 16'hF410;
    localparam white = 16'hFFFF;
    localparam alt_col_bot = 16'hC505;
    localparam alt_col_med = 16'h2B58;
    localparam alt_col_top = 16'h7590;
    
    integer vol_right = 56;
    integer vol_left = 39;
    
    always @ (posedge clock) begin
        
        if (btn_left == 1) begin
            vol_left <= vol_left - 6;
            vol_right <= vol_right - 6;
        end
        if (btn_right == 1) begin
            vol_left <= vol_left + 6;
            vol_right <= vol_right + 6;
        end
        if (btn_left == 1 && vol_left == 3) begin
            vol_left <= vol_left;
            vol_right <= vol_right;
        end
        if (btn_right == 1 && vol_right == 92) begin
            vol_left <= vol_left;
            vol_right <= vol_right;
        end
        if (sw_alt_color == 0) begin 
            if (sw_onoff_border == 1) begin
                if (sw_border_type == 1) begin //border 3 pixels
                    if ((pixel_index % 96) == 0 || (pixel_index % 96) == 1 || (pixel_index % 96) == 2)
                        pixel_data <= border;
                     else if ((pixel_index % 96) == 95 || (pixel_index % 96) == 94 || (pixel_index % 96) == 93)
                        pixel_data <= border;
                     else if ((pixel_index / 96) <= 2)
                        pixel_data <= border;
                     else if ((pixel_index / 96) >= 61)
                        pixel_data <= border;
                     else pixel_data <= black;
                end
                else if (sw_border_type == 0) begin //border 1 pixel
                    if ((pixel_index % 96) == 0 )
                        pixel_data <= border;
                     else if ((pixel_index % 96) == 95)
                        pixel_data <= border;
                     else if ((pixel_index / 96) == 0)
                        pixel_data <= border;
                     else if ((pixel_index / 96) == 63)
                        pixel_data <= border;
                     else pixel_data <= black;
                end 
             end
            else if (sw_onoff_border == 0) begin
                if ((pixel_index % 96) == 0 )
                    pixel_data <= black;
                 else if ((pixel_index % 96) == 95)
                    pixel_data <= black;
                 else if ((pixel_index / 96) == 0)
                    pixel_data <= black;
                 else if ((pixel_index / 96) == 63)
                    pixel_data <= black;
                 else pixel_data <= black;    
            end
            
            if (sw_vol_bar == 1) begin
                case (level)
                    0 : if ((x >= vol_left && x <= vol_right) && (y >= 61 && y <= 63))
                            pixel_data <= green;
                    1 : if ((x >= vol_left && x <= vol_right) && (y >= 57 && y <= 63 && y != 60))
                            pixel_data <= green;                
                    2 : if ((x >= vol_left && x <= vol_right) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                            pixel_data <= green;
                    3 : if ((x >= vol_left && x <= vol_right) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                            pixel_data <= green;
                    4 : if ((x >= vol_left && x <= vol_right) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                            pixel_data <= green;
                    5 : if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                    6 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 37 && y <= 39))
                            pixel_data <= yellow;
                        end
                    7 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 33 && y <= 39 && y != 36))
                            pixel_data <= yellow;
                        end
                    8 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                            pixel_data <= yellow;
                        end
                    9 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                            pixel_data <= yellow;
                        end    
                    10 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        end 
                    11 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 17 && y <= 19 ))
                            pixel_data <= red;
                        end
                    12 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 13 && y <= 19 && y != 16))
                            pixel_data <= red;
                        end
                    13 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                            pixel_data <= red;
                        end
                    14 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                            pixel_data <= red;
                        end
                    15 : begin 
                        if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                            pixel_data <= green;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                            pixel_data <= yellow;
                        else if ((x >= vol_left && x <= vol_right) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                            pixel_data <= red;
                        end
                 endcase
            end
            else if (sw_vol_bar == 0) begin
                if ((x >= vol_left && x <= vol_right) && (y >= 4 && y <= 60))
                    pixel_data <= black;
            end
        end
        else if (sw_alt_color == 1) begin
            if (sw_onoff_border == 1) begin
                        if (sw_border_type == 1) begin //border 3 pixels
                            if ((pixel_index % 96) == 0 || (pixel_index % 96) == 1 || (pixel_index % 96) == 2)
                                pixel_data <= border_alt;
                             else if ((pixel_index % 96) == 95 || (pixel_index % 96) == 94 || (pixel_index % 96) == 93)
                                pixel_data <= border_alt;
                             else if ((pixel_index / 96) <= 2)
                                pixel_data <= border_alt;
                             else if ((pixel_index / 96) >= 61)
                                pixel_data <= border_alt;
                             else pixel_data <= white;
                        end
                        else if (sw_border_type == 0) begin //border 1 pixel
                            if ((pixel_index % 96) == 0 )
                                pixel_data <= border_alt;
                             else if ((pixel_index % 96) == 95)
                                pixel_data <= border_alt;
                             else if ((pixel_index / 96) == 0)
                                pixel_data <= border_alt;
                             else if ((pixel_index / 96) == 63)
                                pixel_data <= border_alt;
                             else pixel_data <= white;
                        end 
                     end
                    else if (sw_onoff_border == 0) begin
                        if ((pixel_index % 96) == 0 )
                            pixel_data <= white;
                         else if ((pixel_index % 96) == 95)
                            pixel_data <= white;
                         else if ((pixel_index / 96) == 0)
                            pixel_data <= white;
                         else if ((pixel_index / 96) == 63)
                            pixel_data <= white;
                         else pixel_data <= white;    
                    end
                    
                    if (sw_vol_bar == 1) begin
                        case (level)
                            0 : if ((x >= vol_left && x <= vol_right) && (y >= 61 && y <= 63))
                                    pixel_data <= alt_col_bot;
                            1 : if ((x >= vol_left && x <= vol_right) && (y >= 57 && y <= 63 && y != 60))
                                    pixel_data <= alt_col_bot;                
                            2 : if ((x >= vol_left && x <= vol_right) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                                    pixel_data <= alt_col_bot;
                            3 : if ((x >= vol_left && x <= vol_right) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                                    pixel_data <= alt_col_bot;
                            4 : if ((x >= vol_left && x <= vol_right) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                                    pixel_data <= alt_col_bot;
                            5 : if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                            6 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 37 && y <= 39))
                                    pixel_data <= alt_col_med;
                                end
                            7 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 33 && y <= 39 && y != 36))
                                    pixel_data <= alt_col_med;
                                end
                            8 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                                    pixel_data <= alt_col_med;
                                end
                            9 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                                    pixel_data <= alt_col_med;
                                end    
                            10 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                end 
                            11 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 17 && y <= 19 ))
                                    pixel_data <= alt_col_top;
                                end
                            12 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 13 && y <= 19 && y != 16))
                                    pixel_data <= alt_col_top;
                                end
                            13 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                                    pixel_data <= alt_col_top;
                                end
                            14 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                                    pixel_data <= alt_col_top;
                                end
                            15 : begin 
                                if ((x >= vol_left && x <= vol_right) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                                    pixel_data <= alt_col_bot;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                                    pixel_data <= alt_col_med;
                                else if ((x >= vol_left && x <= vol_right) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                                    pixel_data <= alt_col_top;
                                end
                         endcase
                    end
                    else if (sw_vol_bar == 0) begin
                        if ((x >= vol_left && x <= vol_right) && (y >= 4 && y <= 60))
                            pixel_data <= white;
                    end
        end   
        
    end
endmodule

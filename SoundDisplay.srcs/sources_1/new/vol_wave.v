//can copy this whole design source
`timescale 1ns / 1ps

module vol_wave(
    input clock,
    input [12:0] pixel_index,
    input [3:0] vol,
    output reg [15:0] pixel_data = 0
    );
    
    wire [6:0] x;
    wire [6:0] y;
        
    dimension dim(pixel_index, x, y);
    
    localparam bg = 16'h19AE;
    localparam red = 16'hE186;
    localparam org = 16'hF404;
    localparam yel = 16'hF745;
    localparam grn = 16'h2FA3;
    localparam blu = 16'h1D3E;
    localparam prp = 16'h6A3F;
    
    localparam bar_1_l = 0;
    localparam bar_1_r = 15;
    localparam bar_2_l = 16;
    localparam bar_2_r = 31;
    localparam bar_3_l = 32;
    localparam bar_3_r = 47;
    localparam bar_4_l = 48;
    localparam bar_4_r = 63;
    localparam bar_5_l = 64;
    localparam bar_5_r = 79;
    localparam bar_6_l = 80;
    localparam bar_6_r = 95;
    
    integer vol_1 = 0;
    integer vol_2 = 0;
    integer vol_3 = 0;
    integer vol_4 = 0;
    integer vol_5 = 0;
    integer vol_6 = 0;
    
    reg [18:0] counter = 0;
    
    always @ (posedge clock) begin
        counter <= counter + 1;
        
        if (counter == 0) begin
            vol_1 <= vol;
            vol_2 <= vol_1;
            vol_3 <= vol_2;
            vol_4 <= vol_3;
            vol_5 <= vol_4;
            vol_6 <= vol_5;
        end
        
        pixel_data <= bg;
        
        case (vol_1)
            0 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 61 && y <= 63))
                    pixel_data <= yel;
            1 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= yel;                
            2 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= yel;
            3 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= yel;
            4 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= yel;
            5 : if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
            6 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 37 && y <= 39))
                    pixel_data <= org;
                end
            7 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= org;
                end
            8 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= org;
                end
            9 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= org;
                end    
            10 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                end 
            11 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= red;
                end
            12 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= red;
                end
            13 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= red;
                end
            14 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= red;
                end
            15 : begin 
                if ((x >= bar_1_l && x <= bar_1_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_1_l && x <= bar_1_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= red;
                end 
        endcase
    
        case (vol_2)
            0 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 61 && y <= 63))
                    pixel_data <= prp;
            1 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= prp;                
            2 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= prp;
            3 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= prp;
            4 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= prp;
            5 : if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
            6 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 37 && y <= 39))
                    pixel_data <= blu;
                end
            7 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= blu;
                end
            8 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= blu;
                end
            9 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= blu;
                end    
            10 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                end 
            11 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= grn;
                end
            12 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= grn;
                end
            13 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= grn;
                end
            14 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= grn;
                end
            15 : begin 
                if ((x >= bar_2_l && x <= bar_2_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_2_l && x <= bar_2_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= grn;
                end 
        endcase
        
        case (vol_3)
            0 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 61 && y <= 63))
                    pixel_data <= yel;
            1 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= yel;                
            2 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= yel;
            3 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= yel;
            4 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= yel;
            5 : if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
            6 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 37 && y <= 39))
                    pixel_data <= org;
                end
            7 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= org;
                end
            8 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= org;
                end
            9 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= org;
                end    
            10 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                end 
            11 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= red;
                end
            12 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= red;
                end
            13 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= red;
                end
            14 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= red;
                end
            15 : begin 
                if ((x >= bar_3_l && x <= bar_3_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_3_l && x <= bar_3_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= red;
                end 
        endcase
    
        case (vol_4)
            0 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 61 && y <= 63))
                    pixel_data <= prp;
            1 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= prp;                
            2 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= prp;
            3 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= prp;
            4 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= prp;
            5 : if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
            6 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 37 && y <= 39))
                    pixel_data <= blu;
                end
            7 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= blu;
                end
            8 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= blu;
                end
            9 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= blu;
                end    
            10 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                end 
            11 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= grn;
                end
            12 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= grn;
                end
            13 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= grn;
                end
            14 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= grn;
                end
            15 : begin 
                if ((x >= bar_4_l && x <= bar_4_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_4_l && x <= bar_4_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= grn;
                end 
        endcase
                
         case (vol_5)
            0 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 61 && y <= 63))
                    pixel_data <= yel;
            1 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= yel;                
            2 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= yel;
            3 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= yel;
            4 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= yel;
            5 : if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
            6 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 37 && y <= 39))
                    pixel_data <= org;
                end
            7 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= org;
                end
            8 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= org;
                end
            9 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= org;
                end    
            10 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                end 
            11 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= red;
                end
            12 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= red;
                end
            13 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= red;
                end
            14 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= red;
                end
            15 : begin 
                if ((x >= bar_5_l && x <= bar_5_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= yel;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= org;
                else if ((x >= bar_5_l && x <= bar_5_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= red;
                end 
        endcase
    
        case (vol_6)
            0 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 61 && y <= 63))
                    pixel_data <= prp;
            1 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 57 && y <= 63 && y != 60))
                    pixel_data <= prp;                
            2 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 53 && y <= 63 && y != 60 && y != 56))
                    pixel_data <= prp;
            3 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 49 && y <= 63 && y != 60 && y != 56 && y != 52))
                    pixel_data <= prp;
            4 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 45 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48))
                    pixel_data <= prp;
            5 : if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
            6 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 37 && y <= 39))
                    pixel_data <= blu;
                end
            7 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 33 && y <= 39 && y != 36))
                    pixel_data <= blu;
                end
            8 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 29 && y <= 39 && y != 32 && y != 36))
                    pixel_data <= blu;
                end
            9 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 25 && y <= 39 && y != 32 && y != 36 && y != 28))
                    pixel_data <= blu;
                end    
            10 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                end 
            11 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 17 && y <= 19 ))
                    pixel_data <= grn;
                end
            12 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 13 && y <= 19 && y != 16))
                    pixel_data <= grn;
                end
            13 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 9 && y <= 19 && y != 16 && y != 12))
                    pixel_data <= grn;
                end
            14 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 5 && y <= 19 && y != 16 && y != 12 && y != 8))
                    pixel_data <= grn;
                end
            15 : begin 
                if ((x >= bar_6_l && x <= bar_6_r) && (y >= 41 && y <= 63 && y != 60 && y != 56 && y != 52 && y != 48 && y != 44))
                    pixel_data <= prp;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 21 && y <= 39 && y != 32 && y != 28 && y != 36 && y != 24))
                    pixel_data <= blu;
                else if ((x >= bar_6_l && x <= bar_6_r) && (y >= 0 && y <= 19 && y != 16 && y != 12 && y != 8 && y != 4))
                    pixel_data <= grn;
                end 
        endcase
    end
endmodule

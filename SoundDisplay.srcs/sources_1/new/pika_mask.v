`timescale 1ns / 1ps

module pika_mask(
    input clock,
    input [12:0] pixel_index,
    output reg [15:0] pixel_data = 0,
    input [3:0] vol
    );
    
    wire [6:0] x;
    wire [6:0] y;
    
    integer mask_lvl = 0;
    
    dimension dim(pixel_index,x,y);
    
        
    localparam pika_yel = 16'hFF65;
    localparam pika_red = 16'hE228;
    localparam pika_mask_grey = 16'hB575;
    localparam pika_mask_blue = 16'h7DBE;
    localparam black = 16'h0;
    localparam white = 16'hFFFF;
    
    always @ (posedge clock) begin
    
        if (vol >= 0 && vol <= 3) mask_lvl <= 0;
        else if (vol >= 4 && vol <= 7) mask_lvl <= 1;
        else if (vol >= 8 && vol <= 11) mask_lvl <= 2;
        else if (vol >= 12 && vol <= 15) mask_lvl <= 3;
    case (mask_lvl)
    0 : begin
           if ((x >= 20 && x <= 23) && (x >= 76 && x <= 79) && (y == 6 || y == 7)) pixel_data <= black;
           
           else if (((x >= 20 && x <= 27) || (x >= 72 && x <= 79)) && (y == 8 || y == 9)) pixel_data <= black;
           
           else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 10 || y == 11)) pixel_data <= black;
           else if (((x == 26 || x == 27) || (x == 72 || x == 73)) && (y == 10 || y == 11)) pixel_data <= pika_yel;
           else if (((x == 28 || x == 29) || (x == 71 || x == 70)) && (y == 10 || y == 11)) pixel_data <= black;
           
           else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 12 || y == 13)) pixel_data <= black;
           else if (((x >= 26 && x <= 29) || (x >= 70 && x <= 73)) && (y == 12 || y == 13)) pixel_data <= pika_yel;
           else if (((x >= 30 && x <= 33) || (x >= 66 && x <= 69)) && (y == 12 || y == 13)) pixel_data <= black;
           
           else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 14 || y == 15)) pixel_data <= black;
           else if (((x >= 26 && x <= 33) || (x >= 66 && x <= 73)) && (y == 14 || y == 15)) pixel_data <= pika_yel;
           else if (((x >= 34 && x <= 35) || (x >= 64 && x <= 65)) && (y == 14 || y == 15)) pixel_data <= black;
           
           else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 16 || y == 17)) pixel_data <= black;
           else if (((x >= 26 && x <= 35) || (x >= 64 && x <= 73)) && (y == 16 || y == 17)) pixel_data <= pika_yel;
           else if (((x >= 36 && x <= 39) || (x >= 60 && x <= 63) || (x >= 44 && x <= 55)) && (y == 16 || y == 17)) pixel_data <= black;
           
           else if (((x >= 24 && x <= 25) || (x >= 40 && x <= 43) || (x >= 56 && x <= 59) || (x >= 74 && x <= 75)) && (y == 18 || y == 19)) pixel_data <= black;
           else if (((x >= 26 && x <= 39) || (x >= 60 && x <= 73) || (x >= 44 && x <= 55)) && (y == 18 || y == 19)) pixel_data <= pika_yel;
           
           else if (((x >= 24 && x <= 25) || (x >= 74 && x <= 75)) && (y == 20 || y == 21)) pixel_data <= black;
           else if (((x >= 26 && x <= 73)) && (y == 20 || y == 21)) pixel_data <= pika_yel;
           
           else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 22 || y == 23)) pixel_data <= black;
           else if (((x >= 28 && x <= 71)) && (y == 22 || y == 23)) pixel_data <= pika_yel;
           
           else if (((x >= 32 && x <= 33) || (x >= 70 && x <= 71) || (x >= 28 && x <= 29) || (x >= 66 && x <= 67)) && (y == 24 || y == 25)) pixel_data <= black;
           else if (((x >= 34 && x <= 65) || (x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 24 || y == 25)) pixel_data <= pika_yel;
           
           else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 26 || y == 27)) pixel_data <= black;
           else if (((x >= 32 && x <= 67)) && (y == 26 || y == 27)) pixel_data <= pika_yel;
           
           else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 28 || y == 29)) pixel_data <= black;
           else if (((x >= 32 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 67)) && (y == 28 || y == 29)) pixel_data <= pika_yel;
           
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 35) || (x >= 38 && x <= 41) || (x >= 64 && x <= 65) || (x >= 58 && x <= 61)) && (y == 30 || y == 31)) pixel_data <= black;
           else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 30 || y == 31)) pixel_data <= pika_yel;
           
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 41) || (x >= 58 && x <= 65)) && (y == 32 || y == 33)) pixel_data <= black;
           else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 32 || y == 33)) pixel_data <= pika_yel;
           
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 34 || y == 35)) pixel_data <= black;
           else if (((x >= 30 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 69)) && (y == 34 || y == 35)) pixel_data <= pika_yel;
           
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 48 && x <= 51)) && (y == 36 || y == 37)) pixel_data <= black; //Nose
           else if (((x >= 30 && x <= 47) || (x >= 52 && x <= 69)) && (y == 36 || y == 37)) pixel_data <= pika_yel;
            
           else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 38 || y == 39)) pixel_data <= black;
           else if (((x >= 28 && x <= 31) || (x >= 68 && x <= 71) || (x >= 36 && x <= 63)) && (y == 38 || y == 39)) pixel_data <= pika_yel;
           else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67)) && (y == 38 || y == 39)) pixel_data <= pika_red;
           
           else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73) || (x >= 48 && x <= 51) || (x >= 44 & x <= 45) || (x >= 54 && x <= 55)) && (y == 40 || y == 41)) pixel_data <= black;
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 38 && x <= 43) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53) || (x >= 56 && x <= 61)) && (y == 40 || y == 41)) pixel_data <= pika_yel;
           else if (((x >= 30 && x <= 37) || (x >= 62 && x <= 69)) && (y == 40 || y == 41)) pixel_data <= pika_red;
           
           else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73) || (x >= 46 && x <= 53)) && (y == 42 || y == 43)) pixel_data <= black;
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 38 && x <= 45) || (x >= 54 && x <= 61)) && (y == 42 || y == 43)) pixel_data <= pika_yel;
           else if (((x >= 30 && x <= 37) || (x >= 62 && x <= 69)) && (y == 42 || y == 43)) pixel_data <= pika_red;
           
           else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53)) && (y == 44 || y == 45)) pixel_data <= black;
           else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 45) || (x >= 54 && x <= 63)) && (y == 44 || y == 45)) pixel_data <= pika_yel;
           else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67) || (x >= 48 && x <= 51)) && (y == 44 || y == 45)) pixel_data <= pika_red;
           
           else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53)) && (y == 46 || y == 47)) pixel_data <= black;
           else if (((x >= 32 && x <= 45) || (x >= 54 && x <= 67)) && (y == 46 || y == 47)) pixel_data <= pika_yel;
           else if (((x >= 48 && x <= 51)) && (y == 46 || y == 47)) pixel_data <= pika_red;
           
           else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67) || (x >= 48 && x <= 51)) && (y == 48 || y == 49)) pixel_data <= black;
           else if (((x >= 36 && x <= 47) || (x >= 52 && x <= 63)) && (y == 48 || y == 49)) pixel_data <= pika_yel;
           
           else if (((x >= 36 && x <= 41) || (x >= 58 && x <= 63)) && (y == 50 || y == 51)) pixel_data <= black;
           else if ((x >= 42 && x <= 57) && (y == 50 || y == 51)) pixel_data <= pika_yel;
           
           else if ((x >= 42 && x <= 57) && (y == 52 || y == 53)) pixel_data <= black;
           
           else pixel_data <= white;
        end
        
      1 : begin
             if ((x >= 20 && x <= 23) && (x >= 76 && x <= 79) && (y == 6 || y == 7)) pixel_data <= black;
                 
             else if (((x >= 20 && x <= 27) || (x >= 72 && x <= 79)) && (y == 8 || y == 9)) pixel_data <= black;
             
             else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 10 || y == 11)) pixel_data <= black;
             else if (((x == 26 || x == 27) || (x == 72 || x == 73)) && (y == 10 || y == 11)) pixel_data <= pika_yel;
             else if (((x == 28 || x == 29) || (x == 71 || x == 70)) && (y == 10 || y == 11)) pixel_data <= black;
             
             else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 12 || y == 13)) pixel_data <= black;
             else if (((x >= 26 && x <= 29) || (x >= 70 && x <= 73)) && (y == 12 || y == 13)) pixel_data <= pika_yel;
             else if (((x >= 30 && x <= 33) || (x >= 66 && x <= 69)) && (y == 12 || y == 13)) pixel_data <= black;
             
             else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 14 || y == 15)) pixel_data <= black;
             else if (((x >= 26 && x <= 33) || (x >= 66 && x <= 73)) && (y == 14 || y == 15)) pixel_data <= pika_yel;
             else if (((x >= 34 && x <= 35) || (x >= 64 && x <= 65)) && (y == 14 || y == 15)) pixel_data <= black;
             
             else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 16 || y == 17)) pixel_data <= black;
             else if (((x >= 26 && x <= 35) || (x >= 64 && x <= 73)) && (y == 16 || y == 17)) pixel_data <= pika_yel;
             else if (((x >= 36 && x <= 39) || (x >= 60 && x <= 63) || (x >= 44 && x <= 55)) && (y == 16 || y == 17)) pixel_data <= black;
             
             else if (((x >= 24 && x <= 25) || (x >= 40 && x <= 43) || (x >= 56 && x <= 59) || (x >= 74 && x <= 75)) && (y == 18 || y == 19)) pixel_data <= black;
             else if (((x >= 26 && x <= 39) || (x >= 60 && x <= 73) || (x >= 44 && x <= 55)) && (y == 18 || y == 19)) pixel_data <= pika_yel;
             
             else if (((x >= 24 && x <= 25) || (x >= 74 && x <= 75)) && (y == 20 || y == 21)) pixel_data <= black;
             else if (((x >= 26 && x <= 73)) && (y == 20 || y == 21)) pixel_data <= pika_yel;
             
             else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 22 || y == 23)) pixel_data <= black;
             else if (((x >= 28 && x <= 71)) && (y == 22 || y == 23)) pixel_data <= pika_yel;
             
             else if (((x >= 32 && x <= 33) || (x >= 70 && x <= 71) || (x >= 28 && x <= 29) || (x >= 66 && x <= 67)) && (y == 24 || y == 25)) pixel_data <= black;
             else if (((x >= 34 && x <= 65) || (x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 24 || y == 25)) pixel_data <= pika_yel;
             
             else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 26 || y == 27)) pixel_data <= black;
             else if (((x >= 32 && x <= 67)) && (y == 26 || y == 27)) pixel_data <= pika_yel;
             
             else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 28 || y == 29)) pixel_data <= black;
             else if (((x >= 32 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 67)) && (y == 28 || y == 29)) pixel_data <= pika_yel;
             
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 35) || (x >= 38 && x <= 41) || (x >= 64 && x <= 65) || (x >= 58 && x <= 61)) && (y == 30 || y == 31)) pixel_data <= black;
             else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 30 || y == 31)) pixel_data <= pika_yel;
             
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 41) || (x >= 58 && x <= 65)) && (y == 32 || y == 33)) pixel_data <= black;
             else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 32 || y == 33)) pixel_data <= pika_yel;
             
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 34 || y == 35)) pixel_data <= black;
             else if (((x >= 30 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 69)) && (y == 34 || y == 35)) pixel_data <= pika_yel;
             
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 48 && x <= 51)) && (y == 36 || y == 37)) pixel_data <= black; //Nose
             else if (((x >= 30 && x <= 47) || (x >= 52 && x <= 69)) && (y == 36 || y == 37)) pixel_data <= pika_yel;
              
             else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 38 || y == 39)) pixel_data <= black;
             else if (((x >= 28 && x <= 31) || (x >= 68 && x <= 71) || (x >= 36 && x <= 63)) && (y == 38 || y == 39)) pixel_data <= pika_yel;
             else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67)) && (y == 38 || y == 39)) pixel_data <= pika_red;
             
             else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73) || (x >= 48 && x <= 51) || (x >= 44 & x <= 45) || (x >= 54 && x <= 55)) && (y == 40 || y == 41)) pixel_data <= black;
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 38 && x <= 43) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53) || (x >= 56 && x <= 61)) && (y == 40 || y == 41)) pixel_data <= pika_yel;
             else if (((x >= 30 && x <= 37) || (x >= 62 && x <= 69)) && (y == 40 || y == 41)) pixel_data <= pika_red;
             
             else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73) || (x >= 46 && x <= 53)) && (y == 42 || y == 43)) pixel_data <= black;
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 38 && x <= 45) || (x >= 54 && x <= 61)) && (y == 42 || y == 43)) pixel_data <= pika_yel;
             else if (((x >= 30 && x <= 37) || (x >= 62 && x <= 69)) && (y == 42 || y == 43)) pixel_data <= pika_red;
             
             else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53)) && (y == 44 || y == 45)) pixel_data <= black;
             else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 45) || (x >= 54 && x <= 63)) && (y == 44 || y == 45)) pixel_data <= pika_yel;
             else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67) || (x >= 48 && x <= 51)) && (y == 44 || y == 45)) pixel_data <= pika_red;
             
             else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 46 || y == 47)) pixel_data <= black;
             else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 46 || y == 47)) pixel_data <= pika_mask_blue;
             else if (((x >= 45 && x <= 54)) && (y == 46 || y == 47)) pixel_data <= pika_mask_grey;
             
             else if (((x >= 32 && x <= 67)) && (y == 48 || y == 49)) pixel_data <= pika_mask_blue;
             
             else if (((x >= 36 && x <= 41) || (x >= 58 && x <= 63)) && (y == 50 || y == 51)) pixel_data <= black;
             else if ((x >= 42 && x <= 57) && (y == 50 || y == 51)) pixel_data <= pika_yel;
             
             else if ((x >= 42 && x <= 57) && (y == 52 || y == 53)) pixel_data <= black;
             
             else pixel_data <= white;
          end
       
       2 : begin
            if ((x >= 20 && x <= 23) && (x >= 76 && x <= 79) && (y == 6 || y == 7)) pixel_data <= black;
                        
            else if (((x >= 20 && x <= 27) || (x >= 72 && x <= 79)) && (y == 8 || y == 9)) pixel_data <= black;
            
            else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 10 || y == 11)) pixel_data <= black;
            else if (((x == 26 || x == 27) || (x == 72 || x == 73)) && (y == 10 || y == 11)) pixel_data <= pika_yel;
            else if (((x == 28 || x == 29) || (x == 71 || x == 70)) && (y == 10 || y == 11)) pixel_data <= black;
            
            else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 12 || y == 13)) pixel_data <= black;
            else if (((x >= 26 && x <= 29) || (x >= 70 && x <= 73)) && (y == 12 || y == 13)) pixel_data <= pika_yel;
            else if (((x >= 30 && x <= 33) || (x >= 66 && x <= 69)) && (y == 12 || y == 13)) pixel_data <= black;
            
            else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 14 || y == 15)) pixel_data <= black;
            else if (((x >= 26 && x <= 33) || (x >= 66 && x <= 73)) && (y == 14 || y == 15)) pixel_data <= pika_yel;
            else if (((x >= 34 && x <= 35) || (x >= 64 && x <= 65)) && (y == 14 || y == 15)) pixel_data <= black;
            
            else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 16 || y == 17)) pixel_data <= black;
            else if (((x >= 26 && x <= 35) || (x >= 64 && x <= 73)) && (y == 16 || y == 17)) pixel_data <= pika_yel;
            else if (((x >= 36 && x <= 39) || (x >= 60 && x <= 63) || (x >= 44 && x <= 55)) && (y == 16 || y == 17)) pixel_data <= black;
            
            else if (((x >= 24 && x <= 25) || (x >= 40 && x <= 43) || (x >= 56 && x <= 59) || (x >= 74 && x <= 75)) && (y == 18 || y == 19)) pixel_data <= black;
            else if (((x >= 26 && x <= 39) || (x >= 60 && x <= 73) || (x >= 44 && x <= 55)) && (y == 18 || y == 19)) pixel_data <= pika_yel;
            
            else if (((x >= 24 && x <= 25) || (x >= 74 && x <= 75)) && (y == 20 || y == 21)) pixel_data <= black;
            else if (((x >= 26 && x <= 73)) && (y == 20 || y == 21)) pixel_data <= pika_yel;
            
            else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 22 || y == 23)) pixel_data <= black;
            else if (((x >= 28 && x <= 71)) && (y == 22 || y == 23)) pixel_data <= pika_yel;
            
            else if (((x >= 32 && x <= 33) || (x >= 70 && x <= 71) || (x >= 28 && x <= 29) || (x >= 66 && x <= 67)) && (y == 24 || y == 25)) pixel_data <= black;
            else if (((x >= 34 && x <= 65) || (x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 24 || y == 25)) pixel_data <= pika_yel;
            
            else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 26 || y == 27)) pixel_data <= black;
            else if (((x >= 32 && x <= 67)) && (y == 26 || y == 27)) pixel_data <= pika_yel;
            
            else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 28 || y == 29)) pixel_data <= black;
            else if (((x >= 32 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 67)) && (y == 28 || y == 29)) pixel_data <= pika_yel;
            
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 35) || (x >= 38 && x <= 41) || (x >= 64 && x <= 65) || (x >= 58 && x <= 61)) && (y == 30 || y == 31)) pixel_data <= black;
            else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 30 || y == 31)) pixel_data <= pika_yel;
            
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 41) || (x >= 58 && x <= 65)) && (y == 32 || y == 33)) pixel_data <= black;
            else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 32 || y == 33)) pixel_data <= pika_yel;
            
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 34 || y == 35)) pixel_data <= black;
            else if (((x >= 30 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 69)) && (y == 34 || y == 35)) pixel_data <= pika_yel;
            
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 48 && x <= 51)) && (y == 36 || y == 37)) pixel_data <= black; //Nose
            else if (((x >= 30 && x <= 47) || (x >= 52 && x <= 69)) && (y == 36 || y == 37)) pixel_data <= pika_yel;
             
            else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 38 || y == 39)) pixel_data <= black;
            else if (((x >= 28 && x <= 31) || (x >= 68 && x <= 71) || (x >= 36 && x <= 63)) && (y == 38 || y == 39)) pixel_data <= pika_yel;
            else if (((x >= 32 && x <= 35) || (x >= 64 && x <= 67)) && (y == 38 || y == 39)) pixel_data <= pika_red;
            
            else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73) || (x >= 48 && x <= 51) || (x >= 44 & x <= 45) || (x >= 54 && x <= 55)) && (y == 40 || y == 41)) pixel_data <= black;
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 38 && x <= 43) || (x >= 46 && x <= 47) || (x >= 52 && x <= 53) || (x >= 56 && x <= 61)) && (y == 40 || y == 41)) pixel_data <= pika_yel;
            else if (((x >= 30 && x <= 37) || (x >= 62 && x <= 69)) && (y == 40 || y == 41)) pixel_data <= pika_red;
            
            else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 42 || y == 43)) pixel_data <= black;
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 42 || y == 43)) pixel_data <= pika_yel;
            else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 42 || y == 43)) pixel_data <= pika_red;
            else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 42 || y == 43)) pixel_data <= pika_mask_blue;
            else if (((x >= 45 && x <= 54)) && (y == 42 || y == 43)) pixel_data <= pika_mask_grey;
            
            else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 44 || y == 45)) pixel_data <= black;
            else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 44 || y == 45)) pixel_data <= pika_yel;
            else if (((x >= 32 && x <= 67)) && (y == 44 || y == 45)) pixel_data <= pika_mask_blue;
            
            else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 46 || y == 47)) pixel_data <= black;
            else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 46 || y == 47)) pixel_data <= pika_mask_blue;
            else if (((x >= 45 && x <= 54)) && (y == 46 || y == 47)) pixel_data <= pika_mask_grey;
            
            else if (((x >= 32 && x <= 67)) && (y == 48 || y == 49)) pixel_data <= pika_mask_blue;
            
            else if (((x >= 36 && x <= 41) || (x >= 58 && x <= 63)) && (y == 50 || y == 51)) pixel_data <= black;
            else if ((x >= 42 && x <= 57) && (y == 50 || y == 51)) pixel_data <= pika_yel;
            
            else if ((x >= 42 && x <= 57) && (y == 52 || y == 53)) pixel_data <= black;
            
            else pixel_data <= white;
         end
       
       3 : begin
               if ((x >= 20 && x <= 23) && (x >= 76 && x <= 79) && (y == 6 || y == 7)) pixel_data <= black;
                                   
               else if (((x >= 20 && x <= 27) || (x >= 72 && x <= 79)) && (y == 8 || y == 9)) pixel_data <= black;
               
               else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 10 || y == 11)) pixel_data <= black;
               else if (((x == 26 || x == 27) || (x == 72 || x == 73)) && (y == 10 || y == 11)) pixel_data <= pika_yel;
               else if (((x == 28 || x == 29) || (x == 71 || x == 70)) && (y == 10 || y == 11)) pixel_data <= black;
               
               else if (((x >= 20 && x <= 25) || (x >= 74 && x <= 79)) && (y == 12 || y == 13)) pixel_data <= black;
               else if (((x >= 26 && x <= 29) || (x >= 70 && x <= 73)) && (y == 12 || y == 13)) pixel_data <= pika_yel;
               else if (((x >= 30 && x <= 33) || (x >= 66 && x <= 69)) && (y == 12 || y == 13)) pixel_data <= black;
               
               else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 14 || y == 15)) pixel_data <= black;
               else if (((x >= 26 && x <= 33) || (x >= 66 && x <= 73)) && (y == 14 || y == 15)) pixel_data <= pika_yel;
               else if (((x >= 34 && x <= 35) || (x >= 64 && x <= 65)) && (y == 14 || y == 15)) pixel_data <= black;
               
               else if (((x >= 22 && x <= 25) || (x >= 74 && x <= 77)) && (y == 16 || y == 17)) pixel_data <= black;
               else if (((x >= 26 && x <= 35) || (x >= 64 && x <= 73)) && (y == 16 || y == 17)) pixel_data <= pika_yel;
               else if (((x >= 36 && x <= 39) || (x >= 60 && x <= 63) || (x >= 44 && x <= 55)) && (y == 16 || y == 17)) pixel_data <= black;
               
               else if (((x >= 24 && x <= 25) || (x >= 40 && x <= 43) || (x >= 56 && x <= 59) || (x >= 74 && x <= 75)) && (y == 18 || y == 19)) pixel_data <= black;
               else if (((x >= 26 && x <= 39) || (x >= 60 && x <= 73) || (x >= 44 && x <= 55)) && (y == 18 || y == 19)) pixel_data <= pika_yel;
               
               else if (((x >= 24 && x <= 25) || (x >= 74 && x <= 75)) && (y == 20 || y == 21)) pixel_data <= black;
               else if (((x >= 26 && x <= 73)) && (y == 20 || y == 21)) pixel_data <= pika_yel;
               
               else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 22 || y == 23)) pixel_data <= black;
               else if (((x >= 28 && x <= 71)) && (y == 22 || y == 23)) pixel_data <= pika_yel;
               
               else if (((x >= 32 && x <= 33) || (x >= 70 && x <= 71) || (x >= 28 && x <= 29) || (x >= 66 && x <= 67)) && (y == 24 || y == 25)) pixel_data <= black;
               else if (((x >= 34 && x <= 65) || (x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 24 || y == 25)) pixel_data <= pika_yel;
               
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 26 || y == 27)) pixel_data <= black;
               else if (((x >= 32 && x <= 67)) && (y == 26 || y == 27)) pixel_data <= pika_yel;
               
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 28 || y == 29)) pixel_data <= black;
               else if (((x >= 32 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 67)) && (y == 28 || y == 29)) pixel_data <= pika_yel;
               
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 35) || (x >= 38 && x <= 41) || (x >= 64 && x <= 65) || (x >= 58 && x <= 61)) && (y == 30 || y == 31)) pixel_data <= black;
               else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 30 || y == 31)) pixel_data <= pika_yel;
               
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 34 && x <= 41) || (x >= 58 && x <= 65)) && (y == 32 || y == 33)) pixel_data <= black;
               else if (((x >= 30 && x <= 33) || (x >= 42 && x <= 57) || (x >= 66 && x <= 69)) && (y == 32 || y == 33)) pixel_data <= pika_yel;
               
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71) || (x >= 36 && x <= 39) || (x >= 60 && x <= 63)) && (y == 34 || y == 35)) pixel_data <= black;
               else if (((x >= 30 && x <= 35) || (x >= 40 && x <= 59) || (x >= 64 && x <= 69)) && (y == 34 || y == 35)) pixel_data <= pika_yel;
               
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 36 || y == 37)) pixel_data <= black; //Nose
               else if (((x >= 32 && x <= 67)) && (y == 36 || y == 37)) pixel_data <= pika_mask_blue;
                
               else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 38 || y == 39)) pixel_data <= black;
               else if (((x >= 28 && x <= 31) || (x >= 68 && x <= 71)) && (y == 38 || y == 39)) pixel_data <= pika_yel;
               else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 38 || y == 39)) pixel_data <= pika_mask_blue;
               else if (((x >= 45 && x <= 54)) && (y == 38 || y == 39)) pixel_data <= pika_mask_grey;
               
               else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 40 || y == 41)) pixel_data <= black;
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 40 || y == 41)) pixel_data <= pika_yel;
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 40 || y == 41)) pixel_data <= pika_red;
               else if (((x >= 32 && x <= 67)) && (y == 40 || y == 41)) pixel_data <= pika_mask_blue;
               
               else if (((x >= 26 && x <= 27) || (x >= 72 && x <= 73)) && (y == 42 || y == 43)) pixel_data <= black;
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 42 || y == 43)) pixel_data <= pika_yel;
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 42 || y == 43)) pixel_data <= pika_red;
               else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 42 || y == 43)) pixel_data <= pika_mask_blue;
               else if (((x >= 45 && x <= 54)) && (y == 42 || y == 43)) pixel_data <= pika_mask_grey;
               
               else if (((x >= 28 && x <= 29) || (x >= 70 && x <= 71)) && (y == 44 || y == 45)) pixel_data <= black;
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 44 || y == 45)) pixel_data <= pika_yel;
               else if (((x >= 32 && x <= 67)) && (y == 44 || y == 45)) pixel_data <= pika_mask_blue;
               
               else if (((x >= 30 && x <= 31) || (x >= 68 && x <= 69)) && (y == 46 || y == 47)) pixel_data <= black;
               else if (((x >= 32 && x <= 44) || (x >= 55 && x <= 67)) && (y == 46 || y == 47)) pixel_data <= pika_mask_blue;
               else if (((x >= 45 && x <= 54)) && (y == 46 || y == 47)) pixel_data <= pika_mask_grey;
               
               else if (((x >= 32 && x <= 67)) && (y == 48 || y == 49)) pixel_data <= pika_mask_blue;
               
               else if (((x >= 36 && x <= 41) || (x >= 58 && x <= 63)) && (y == 50 || y == 51)) pixel_data <= black;
               else if ((x >= 42 && x <= 57) && (y == 50 || y == 51)) pixel_data <= pika_yel;
               
               else if ((x >= 42 && x <= 57) && (y == 52 || y == 53)) pixel_data <= black;
               
               else pixel_data <= white;
            end
       endcase
    end
endmodule

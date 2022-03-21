`timescale 1ns / 1ps

module dino(
    input clock,
    input btnU,
    input btnD,
    input btnC,
    input [12:0] pixel_index,
    input [3:0] vol,
    output [15:0] pixel_data_final,
    output [3:0] an, // added
    output [7:0] seg // added
    );
    wire signed [7:0] X;
    wire [6:0] Y;
    wire [6:0] pos;
    wire signed [7:0] cloud1X;
    wire signed [7:0] cloud2X;
    wire signed [7:0] cloud3X;
    wire signed [7:0] rockX;
    wire [6:0] rockH;
    reg [15:0] dino = 0;
    reg [14:0] counter = 0;
    reg [15:0] pixel_data;
    wire [15:0] sand1; // 1 row
    wire [15:0] sand2; // 1 row
    wire [15:0] sand3;
    wire [15:0] sand4; // 1 row
    wire [15:0] sand5; // 1 row
    wire [15:0] sand6; // 1 row
    wire [15:0] sea1;
    wire [15:0] sea2;
    wire [15:0] sea3;
    wire [15:0] sky;
    wire [15:0] white;
    wire [15:0] sun;
    wire [15:0] rock;
    wire btn_up;
    wire btn_down;
    wire btn_centre;
    reg gg = 0;
    reg [6:0] score = 0;
    reg [16:0] score_counter = 0;
    
    assign pixel_data_final = (gg) ? 16'hFFFF : pixel_data;
    
    localparam cloud1Y = 24;
    localparam cloud2Y = 11;
    localparam cloud3Y = 24;
    localparam sunX = 35;
    localparam sunY = 28;
    localparam rockY = 61;
    
    dimension dim(pixel_index [12:0], X, Y);
    jump jmp(clock, vol [3:0], pos [6:0]);
    move1 cld1(clock, cloud1X [7:0]);
    move2 cld2(clock, cloud2X [7:0]);
    move3 cld3(clock, cloud3X [7:0]);
    rock rk(clock, btn_up, btn_down, rockX [7:0], rockH [6:0]);
    btn_debouncer btn1(clock, btnU, btn_up);
    btn_debouncer btn2(clock, btnD, btn_down);
    btn_debouncer btn3(clock, btnC, btn_centre);
    dino_score ds(clock, score, an, seg);
    
    
    //hex_to_16bit colour1(0, 0, 0, dino);
    hex_to_16bit colour2(211, 196, 120, sand1);
    hex_to_16bit colour3(214, 199, 122, sand2);
    hex_to_16bit colour4(240, 223, 137, sand3);
    hex_to_16bit colour5(238, 220, 132, sand4);
    hex_to_16bit colour6(251, 243, 175, sand5);
    hex_to_16bit colour7(255, 255, 180, sand6);
    hex_to_16bit colour8(31, 203, 255, sea1);
    hex_to_16bit colour9(25, 202, 255, sea2);
    hex_to_16bit colour10(123, 220, 255, sea3);
    hex_to_16bit colour11(148, 230, 255, sky);
    hex_to_16bit colour12(255, 255, 255, white);
    hex_to_16bit colour13(249, 194, 6, sun);
    hex_to_16bit colour14(177, 177, 177, rock);
   
    always @(posedge clock) begin 
    
        if (Y == 64) pixel_data <= sand1;
        else if (Y == 63) pixel_data <= sand2;
        else if (Y <= 62 && Y >= 50) pixel_data <= sand3;
        else if (Y == 49) pixel_data <= sand4;
        else if (Y == 48) pixel_data <= sand5;
        else if (Y == 47) pixel_data <= sand6;
        else if (Y <= 46 && Y >= 31) pixel_data <= sea1;
        else if (Y == 30) pixel_data <= sea2;
        else if (Y == 29) pixel_data <= sea3;
        else if (Y <= 28 && Y >= 1) pixel_data <= sky;
        else pixel_data <= 0;
        
        case (X) 
            sunX:
                if (Y <= sunY && Y >= sunY - 3) pixel_data <= sun; 
            sunX + 1:
                if (Y <= sunY && Y >= sunY - 5) pixel_data <= sun;
            sunX + 2:
                if (Y <= sunY && Y >= sunY - 6) pixel_data <= sun;
            sunX + 3:
                if (Y <= sunY && Y >= sunY - 8) pixel_data <= sun;
            sunX + 4:
                if (Y <= sunY && Y >= sunY - 8) pixel_data <= sun;
            sunX + 5:
                if (Y <= sunY && Y >= sunY - 9) pixel_data <= sun;
            sunX + 6:
                if (Y <= sunY && Y >= sunY - 9) pixel_data <= sun;
            sunX + 7:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;
            sunX + 8:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;
            sunX + 9:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;
            sunX + 10:
                if (Y <= sunY && Y >= sunY - 11) pixel_data <= sun;
            sunX + 11:
                if (Y <= sunY && Y >= sunY - 11) pixel_data <= sun;            
            sunX + 12:
                if (Y <= sunY && Y >= sunY - 11) pixel_data <= sun;
            sunX + 13:
                if (Y <= sunY && Y >= sunY - 11) pixel_data <= sun;
            sunX + 14:
                if (Y <= sunY && Y >= sunY - 11) pixel_data <= sun;            
            sunX + 15:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;
            sunX + 16:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;
            sunX + 17:
                if (Y <= sunY && Y >= sunY - 10) pixel_data <= sun;                    
            sunX + 18:
                if (Y <= sunY && Y >= sunY - 9) pixel_data <= sun;
            sunX + 19:
                if (Y <= sunY && Y >= sunY - 9) pixel_data <= sun;
            sunX + 20:
                if (Y <= sunY && Y >= sunY - 8) pixel_data <= sun;                 
            sunX + 21:
                if (Y <= sunY && Y >= sunY - 8) pixel_data <= sun;
            sunX + 22:
                if (Y <= sunY && Y >= sunY - 6) pixel_data <= sun;
            sunX + 23:
                if (Y <= sunY && Y >= sunY - 5) pixel_data <= sun;            
            sunX + 24:
                if (Y <= sunY && Y >= sunY - 3) pixel_data <= sun;
        endcase
        
        case (X) 
            cloud1X:
                if (Y <= cloud1Y && Y >= cloud1Y - 1) pixel_data <= white; 
            cloud1X + 1:
                if (Y <= cloud1Y && Y >= cloud1Y - 2) pixel_data <= white;
            cloud1X + 2:
                if (Y <= cloud1Y && Y >= cloud1Y - 2) pixel_data <= white;
            cloud1X + 3:
                if (Y <= cloud1Y && Y >= cloud1Y - 2) pixel_data <= white;
            cloud1X + 4:
                if (Y <= cloud1Y && Y >= cloud1Y - 3) pixel_data <= white;
            cloud1X + 5:
                if (Y <= cloud1Y && Y >= cloud1Y - 3) pixel_data <= white;
            cloud1X + 6:
                if (Y <= cloud1Y && Y >= cloud1Y - 4) pixel_data <= white;
            cloud1X + 7:
                if (Y <= cloud1Y && Y >= cloud1Y - 7) pixel_data <= white;
            cloud1X + 8:
                if (Y <= cloud1Y && Y >= cloud1Y - 7) pixel_data <= white;
            cloud1X + 9:
                if (Y <= cloud1Y && Y >= cloud1Y - 7) pixel_data <= white;
            cloud1X + 10:
                if (Y <= cloud1Y && Y >= cloud1Y - 7) pixel_data <= white;
            cloud1X + 11:
                if (Y <= cloud1Y && Y >= cloud1Y - 6) pixel_data <= white;            
            cloud1X + 12:
                if (Y <= cloud1Y && Y >= cloud1Y - 5) pixel_data <= white;
            cloud1X + 13:
                if (Y <= cloud1Y && Y >= cloud1Y - 5) pixel_data <= white;
            cloud1X + 14:
                if (Y <= cloud1Y && Y >= cloud1Y - 6) pixel_data <= white;            
            cloud1X + 15:
                if (Y <= cloud1Y && Y >= cloud1Y - 6) pixel_data <= white;
            cloud1X + 16:
                if (Y <= cloud1Y && Y >= cloud1Y - 5) pixel_data <= white;
            cloud1X + 17:
                if (Y <= cloud1Y && Y >= cloud1Y - 3) pixel_data <= white;                    
            cloud1X + 18:
                if (Y <= cloud1Y && Y >= cloud1Y - 3) pixel_data <= white;
            cloud1X + 19:
                if (Y <= cloud1Y && Y >= cloud1Y - 2) pixel_data <= white;
            cloud1X + 20:
                if (Y <= cloud1Y && Y >= cloud1Y - 2) pixel_data <= white;                 
            cloud1X + 21:
                if (Y <= cloud1Y && Y >= cloud1Y - 1) pixel_data <= white;
            cloud1X + 22:
                if (Y <= cloud1Y && Y >= cloud1Y - 1) pixel_data <= white;
            cloud1X + 23:
                if (Y <= cloud1Y && Y >= cloud1Y) pixel_data <= white;            
            cloud1X + 24:
                if (Y <= cloud1Y && Y >= cloud1Y) pixel_data <= white;
        endcase
             
        case (X) 
            cloud2X:
                if (Y <= cloud2Y && Y >= cloud2Y - 1) pixel_data <= white; 
            cloud2X + 1:
                if (Y <= cloud2Y && Y >= cloud2Y - 2) pixel_data <= white;
            cloud2X + 2:
                if (Y <= cloud2Y && Y >= cloud2Y - 2) pixel_data <= white;
            cloud2X + 3:
                if (Y <= cloud2Y && Y >= cloud2Y - 2) pixel_data <= white;
            cloud2X + 4:
                if (Y <= cloud2Y && Y >= cloud2Y - 3) pixel_data <= white;
            cloud2X + 5:
                if (Y <= cloud2Y && Y >= cloud2Y - 3) pixel_data <= white;
            cloud2X + 6:
                if (Y <= cloud2Y && Y >= cloud2Y - 4) pixel_data <= white;
            cloud2X + 7:
                if (Y <= cloud2Y && Y >= cloud2Y - 7) pixel_data <= white;
            cloud2X + 8:
                if (Y <= cloud2Y && Y >= cloud2Y - 7) pixel_data <= white;
            cloud2X + 9:
                if (Y <= cloud2Y && Y >= cloud2Y - 7) pixel_data <= white;
            cloud2X + 10:
                if (Y <= cloud2Y && Y >= cloud2Y - 7) pixel_data <= white;
            cloud2X + 11:
                if (Y <= cloud2Y && Y >= cloud2Y - 6) pixel_data <= white;            
            cloud2X + 12:
                if (Y <= cloud2Y && Y >= cloud2Y - 5) pixel_data <= white;
            cloud2X + 13:
                if (Y <= cloud2Y && Y >= cloud2Y - 5) pixel_data <= white;
            cloud2X + 14:
                if (Y <= cloud2Y && Y >= cloud2Y - 6) pixel_data <= white;            
            cloud2X + 15:
                if (Y <= cloud2Y && Y >= cloud2Y - 6) pixel_data <= white;
            cloud2X + 16:
                if (Y <= cloud2Y && Y >= cloud2Y - 5) pixel_data <= white;
            cloud2X + 17:
                if (Y <= cloud2Y && Y >= cloud2Y - 3) pixel_data <= white;                    
            cloud2X + 18:
                if (Y <= cloud2Y && Y >= cloud2Y - 3) pixel_data <= white;
            cloud2X + 19:
                if (Y <= cloud2Y && Y >= cloud2Y - 2) pixel_data <= white;
            cloud2X + 20:
                if (Y <= cloud2Y && Y >= cloud2Y - 2) pixel_data <= white;                 
            cloud2X + 21:
                if (Y <= cloud2Y && Y >= cloud2Y - 1) pixel_data <= white;
            cloud2X + 22:
                if (Y <= cloud2Y && Y >= cloud2Y - 1) pixel_data <= white;
            cloud2X + 23:
                if (Y <= cloud2Y && Y >= cloud2Y) pixel_data <= white;            
            cloud2X + 24:
                if (Y <= cloud2Y && Y >= cloud2Y) pixel_data <= white;
        endcase
                
        
        case (X) 
            cloud3X:
                if (Y <= cloud3Y && Y >= cloud3Y - 1) pixel_data <= white; 
            cloud3X + 1:
                if (Y <= cloud3Y && Y >= cloud3Y - 2) pixel_data <= white;
            cloud3X + 2:
                if (Y <= cloud3Y && Y >= cloud3Y - 2) pixel_data <= white;
            cloud3X + 3:
                if (Y <= cloud3Y && Y >= cloud3Y - 2) pixel_data <= white;
            cloud3X + 4:
                if (Y <= cloud3Y && Y >= cloud3Y - 3) pixel_data <= white;
            cloud3X + 5:
                if (Y <= cloud3Y && Y >= cloud3Y - 3) pixel_data <= white;
            cloud3X + 6:
                if (Y <= cloud3Y && Y >= cloud3Y - 4) pixel_data <= white;
            cloud3X + 7:
                if (Y <= cloud3Y && Y >= cloud3Y - 7) pixel_data <= white;
            cloud3X + 8:
                if (Y <= cloud3Y && Y >= cloud3Y - 7) pixel_data <= white;
            cloud3X + 9:
                if (Y <= cloud3Y && Y >= cloud3Y - 7) pixel_data <= white;
            cloud3X + 10:
                if (Y <= cloud3Y && Y >= cloud3Y - 7) pixel_data <= white;
            cloud3X + 11:
                if (Y <= cloud3Y && Y >= cloud3Y - 6) pixel_data <= white;            
            cloud3X + 12:
                if (Y <= cloud3Y && Y >= cloud3Y - 5) pixel_data <= white;
            cloud3X + 13:
                if (Y <= cloud3Y && Y >= cloud3Y - 5) pixel_data <= white;
            cloud3X + 14:
                if (Y <= cloud3Y && Y >= cloud3Y - 6) pixel_data <= white;            
            cloud3X + 15:
                if (Y <= cloud3Y && Y >= cloud3Y - 6) pixel_data <= white;
            cloud3X + 16:
                if (Y <= cloud3Y && Y >= cloud3Y - 5) pixel_data <= white;
            cloud3X + 17:
                if (Y <= cloud3Y && Y >= cloud3Y - 3) pixel_data <= white;                    
            cloud3X + 18:
                if (Y <= cloud3Y && Y >= cloud3Y - 3) pixel_data <= white;
            cloud3X + 19:
                if (Y <= cloud3Y && Y >= cloud3Y - 2) pixel_data <= white;
            cloud3X + 20:
                if (Y <= cloud3Y && Y >= cloud3Y - 2) pixel_data <= white;                 
            cloud3X + 21:
                if (Y <= cloud3Y && Y >= cloud3Y - 1) pixel_data <= white;
            cloud3X + 22:
                if (Y <= cloud3Y && Y >= cloud3Y - 1) pixel_data <= white;
            cloud3X + 23:
                if (Y <= cloud3Y && Y >= cloud3Y) pixel_data <= white;            
            cloud3X + 24:
                if (Y <= cloud3Y && Y >= cloud3Y) pixel_data <= white;
        endcase        
                               
        case (Y)
            pos:
                if (X >= 11 && X <= 18) pixel_data <= dino;
            pos + 1:
                if (X >= 10 && X <= 19) pixel_data <= dino;
            pos + 2:
                if (X >= 10 && X <= 19 && X != 12) pixel_data <= dino;
            pos + 3:
                if (X >= 10 && X <= 19) pixel_data <= dino;
            pos + 4:
                if (X >= 10 && X <= 19) pixel_data <= dino;
            pos + 5:
                if (X >= 10 && X <= 19) pixel_data <= dino; 
            pos + 6:
                if (X >= 10 && X <= 14) pixel_data <= dino;
            pos + 7:
                if (X >= 10 && X <= 17) pixel_data <= dino;
            pos + 8:
                if ((X >= 9 && X <= 13) || X == 0) pixel_data <= dino;
            pos + 9:
                if ((X >= 8 && X <= 13) || X == 0) pixel_data <= dino;
            pos + 10:
                if ((X >= 6 && X <= 15) || X == 0 || X == 1) pixel_data <= dino;
            pos + 11:
                if ((X >= 5 && X <= 13) || X == 15 || X == 0 || X == 1 || X == 2) pixel_data <= dino;
            pos + 12:
                if (X >= 0 && X <= 13) pixel_data <= dino;
            pos + 13:
                if (X >= 0 && X <= 13) pixel_data <= dino;
            pos + 14:
                if (X >= 1 && X <= 12) pixel_data <= dino;
            pos + 15:
                if (X >= 2 && X <= 12) pixel_data <= dino;
            pos + 16:
                if (X >= 3 && X <= 11) pixel_data <= dino;
            pos + 17:
                if (X >= 4 && X <= 10) pixel_data <= dino;
            pos + 18:
                if (X >= 5 && X <= 10 && X != 8) pixel_data <= dino;             
            pos + 19:
                if (X == 5 || X == 6 || X == 10) pixel_data <= dino;                 
            pos + 20:
                if (X == 5 || X == 10) pixel_data <= dino;                
            pos + 21:
                if (X == 5 || X == 6 || X == 10 || X == 11) pixel_data <= dino;
        endcase
            
            
        case (X) 
            rockX:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock; 
            rockX + 1:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 2:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 3:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 4:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 5:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 6:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 7:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 8:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
            rockX + 9:
                if (Y <= rockY && Y >= rockY - rockH) pixel_data <= rock;
        endcase
        
        if (rockX >= 1 && rockX <= 19 && pos + 21 >= rockY - rockH ) gg <= 1;
        
       if (rockX == 1 && ~gg && score_counter == 0) score <= score + 1; 
        
        counter <= counter + 1;
        dino <= (counter == 0) ? dino + 1 : dino;
        score_counter <= score_counter + 1;
        if(btn_centre) begin
            gg <= 0;
            score <= 0;
       end
    end
    
    
endmodule

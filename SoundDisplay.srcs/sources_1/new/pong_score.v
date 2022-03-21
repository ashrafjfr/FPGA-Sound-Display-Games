`timescale 1ns / 1ps

module pong_score(input clock, sw_player, point_1, point_2, reset, output reg [3:0] an, reg [7:0] seg, reg [3:0] p1_score = 0, reg [3:0] p2_score = 0);
    reg [7:0] digits [0:9];
    reg [3:0] d_an_list [0:3];
    reg [1:0] an_counter = 0;
    reg [12:0] counter = 0;
    initial begin
        d_an_list[0] = 4'b0111;
        d_an_list[1] = 4'b1011;
        d_an_list[2] = 4'b1101;
        d_an_list[3] = 4'b1110;

        digits[9] = 8'b10010000; // 9
        digits[8] = 8'b10000000; // 8
        digits[7] = 8'b11111000; // 7
        digits[6] = 8'b10000010; // 6
        digits[5] = 8'b10010010; // 5
        digits[4] = 8'b10011001; // 4
        digits[3] = 8'b10110000; // 3
        digits[2] = 8'b10100100; // 2
        digits[1] = 8'b11111001; // 1
        digits[0] = 8'b11000000; // 0
    end
    
    always @(posedge clock) begin
        if (sw_player == 0) begin
            if (counter == 0) begin
                an <= d_an_list[an_counter];
                case (an_counter)
                    2'b00: seg <= (p1_score == 10 || p2_score == 10) ? 8'b10111111: digits[p1_score];
                    2'b01: seg <= (p2_score == 10) ? 8'b10001000 : ((p1_score == 10) ? 8'b10001100 : 8'b10111111);
                    2'b10: seg <= (p1_score == 10) ? digits[1] : ((p2_score == 10) ? 8'b11001111 : 8'b10111111);
                    2'b11: seg <= (p1_score == 10 || p2_score == 10) ? 8'b10111111: digits[p2_score];
                endcase
                an_counter <= an_counter + 1;
            end
            if (point_1) p1_score <= p1_score + 1;
            if (point_2) p2_score <= p2_score + 1;
            if (reset) begin
                p1_score <= 0;
                p2_score <= 0;
            end  
            counter <= counter + 1;
        end
        
        else if (sw_player == 1) begin
            if (counter == 0) begin
                an <= d_an_list[an_counter];
                case (an_counter)
                    2'b00: seg <= (p1_score == 10 || p2_score == 10) ? 8'b10111111: digits[p1_score];
                    2'b01: seg <= (p1_score == 10 || p2_score == 10) ? 8'b10001100 : 8'b10111111;
                    2'b10: seg <= (p1_score == 10) ? digits[1] : ((p2_score == 10) ? digits[2] : 8'b10111111);
                    2'b11: seg <= (p1_score == 10 || p2_score == 10) ? 8'b10111111: digits[p2_score];
                endcase
                an_counter <= an_counter + 1;
            end
            if (point_1) p1_score <= p1_score + 1;
            if (point_2) p2_score <= p2_score + 1;
            if (reset) begin
                p1_score <= 0;
                p2_score <= 0;
            end  
            counter <= counter + 1;
        end
    end   
endmodule

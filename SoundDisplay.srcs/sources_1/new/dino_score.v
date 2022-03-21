`timescale 1ns / 1ps

module dino_score(input clock, [6:0] score, output reg [3:0] an, reg [7:0] seg);
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
        if (counter == 0) begin
            an <= d_an_list[an_counter];
            case (an_counter)
                2'b00: seg <= 8'b11111111;
                2'b01: seg <= 8'b11111111;
                2'b10: seg <= digits[score/10];
                2'b11: seg <= digits[score%10];
            endcase
            an_counter <= an_counter + 1;
        end

        counter <= counter + 1;
    end   
endmodule

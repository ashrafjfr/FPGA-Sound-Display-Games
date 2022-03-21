`timescale 1ns / 1ps

module ss_display(input switch, CLOCK, [3:0] vol, output reg [3:0] an, reg [7:0] seg);
    reg [7:0] levels [0:2];
    reg [7:0] digits [0:9];
    reg [3:0] d_an_list [0:3];
    reg [3:0] l_an_list [0:3];
    reg [1:0] counter = 0;
    wire new_clk;
    
    initial begin
        d_an_list[0] = 4'b1111;
        d_an_list[1] = 4'b1111;
        d_an_list[2] = 4'b1101;
        d_an_list[3] = 4'b1110;
        
        l_an_list[0] = 4'b1111;
        l_an_list[1] = 4'b1111;
        l_an_list[2] = 4'b1111;
        l_an_list[3] = 4'b1110;   
    
        levels[0] = 8'b11000111; // L
        levels[1] = 8'b11101010; // M
        levels[2] = 8'b10001001; // H
        
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
    static_clk staC(CLOCK, 1, new_clk);
    always @(posedge new_clk) begin
        an <= (switch) ? l_an_list[counter] : d_an_list[counter];
        counter <= counter + 1;
        
        case (counter)
            2'b00: begin
                seg <= 8'b11111111;
            end
            
            2'b01: begin
                seg <= 8'b11111111;
            end
            
            2'b10: begin
                seg <= (~switch && vol >= 10) ? digits[1] : digits[0];
            end
            
            2'b11: begin
                if (switch) begin
                    if (vol <= 5) seg <= levels[0];
                    else if (vol >= 6 && vol <= 10) seg <= levels[1];
                    else seg <= levels[2];        
                end
                else begin
                    if (vol < 10) seg <= digits[vol];
                    else seg <= digits[vol-10];
                end
            end
        endcase
    end
   
endmodule

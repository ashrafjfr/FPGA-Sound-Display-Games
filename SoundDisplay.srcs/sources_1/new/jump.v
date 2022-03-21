`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module jump(input clock, [3:0] vol, output reg [6:0] height = 40);
    wire new_clk;
    reg penalty = 0;
    game_clk gc(clock, 1, new_clk);
    always @(posedge new_clk) begin
        if (~penalty) begin
            if (vol == 6 && height >= 36) height <= height - 1;
            else if (vol == 7 && height >= 32) height <= height - 1; 
            else if (vol == 8 && height >= 28) height <= height - 1; 
            else if (vol == 9 && height >= 24) height <= height - 1; 
            else if (vol == 10 && height >= 20) height <= height - 1; 
            else if (vol == 11 && height >= 16) height <= height - 1; 
            else if (vol == 12 && height >= 12) height <= height - 1; 
            else if (vol == 13 && height >= 8) height <= height - 1; 
            else if (vol == 14 && height >= 4) height <= height - 1; 
            else if (vol == 15 && height >= 0) height <= height - 1;
            else if (vol <= 5 && height < 40)  height <= height + 1;
        end
        
        if (height == 0) penalty = 1;
        if (penalty && height < 40) height <= height + 1;
        else penalty <= 0;
    end
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 17:43:14
// Design Name: 
// Module Name: rock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module rock(input clock, up, down, output reg signed [7:0] pos = 96, output reg [6:0] height = 10);
    wire new_clk;
    game_clk gc(clock, 1, new_clk);
    always @(posedge new_clk) begin
        pos <= (pos == -24) ? 96 : pos - 1; 
    end
    
    always @(posedge clock) begin 
        height <= (up && height <= 30) ? height + 5 : (down && height >= 10) ? height - 5 : height;
    end
endmodule

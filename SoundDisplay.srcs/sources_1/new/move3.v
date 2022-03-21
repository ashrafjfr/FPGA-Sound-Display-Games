`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2021 17:09:57
// Design Name: 
// Module Name: move3
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


module move3(input clock, output reg signed [7:0] pos = 69);
    wire new_clk;
    game_clk gc(clock, 1, new_clk);
    always @(posedge new_clk) begin
        pos <= (pos == -24) ? 96 : pos - 1;     
    end
endmodule
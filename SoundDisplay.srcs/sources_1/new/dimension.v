`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2021 11:06:11
// Design Name: 
// Module Name: dimension
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


module dimension(input [12:0] pixel_index, output wire signed [7:0] X, wire [6:0] Y);
    assign X = pixel_index % 96;
    assign Y = pixel_index / 96;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 13:33:41
// Design Name: 
// Module Name: dimension_norm
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


module dimension_norm(input [12:0] pixel_index, output wire [6:0] X, wire [6:0] Y);
    assign X = pixel_index % 96;
    assign Y = pixel_index / 96;
endmodule

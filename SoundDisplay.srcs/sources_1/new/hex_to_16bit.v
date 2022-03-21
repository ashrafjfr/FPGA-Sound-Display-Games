`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 23:42:05
// Design Name: 
// Module Name: hex_to_16bit
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


module hex_to_16bit(input [7:0] red, input [7:0] green, input [7:0] blue, output [15:0] colour);
    assign colour [4:0] = (blue*31)/255; //(red*31)/255;
    assign colour [10:5] = (green*63)/255;
    assign colour [15:11] = (red*31)/255; //(blue*31)/255;
endmodule

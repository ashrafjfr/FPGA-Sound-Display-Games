`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2021 09:06:33
// Design Name: 
// Module Name: static_clk
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


module static_clk(input CLOCK, start, output reg new_clk);
    reg [17:0] counter;
    initial begin
        counter = 0;
        new_clk = 0;
    end
    always @ (posedge CLOCK) begin
        counter <= (start) ? counter + 1: counter;
        new_clk <= (counter == 0 && start) ? ~new_clk: new_clk;
    end
endmodule

`timescale 1ns / 1ps

module game_clk(input CLOCK, start, output reg new_clk);
    reg [15:0] counter;
    initial begin
        counter = 0;
        new_clk = 0;
    end
    always @ (posedge CLOCK) begin
        counter <= (start) ? counter + 1: counter;
        new_clk <= (counter == 0 && start) ? ~new_clk: new_clk;
    end
endmodule
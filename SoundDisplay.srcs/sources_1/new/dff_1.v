`timescale 1ns / 1ps

module dff_1(
    input clock,
    input d,
    output reg q = 0
    );
    
    always @ (posedge clock) 
    begin
        q <= d;
    end
endmodule

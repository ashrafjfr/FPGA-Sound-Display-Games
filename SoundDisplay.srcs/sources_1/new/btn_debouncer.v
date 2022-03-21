`timescale 1ns / 1ps

module btn_debouncer(
    input clock,
    input btn,
    output signal
    );
    
    wire q1;
    wire q2;
    
    dff_1 dut1(clock, btn, q1);
    dff_1 dut2(clock, q1, q2);
    
    assign signal = q1 & ~q2; 
endmodule

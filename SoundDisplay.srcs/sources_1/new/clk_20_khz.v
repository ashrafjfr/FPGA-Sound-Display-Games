`timescale 1ns / 1ps


module clk_20_khz(
    input clock,
    output reg div_clk = 0
    );
    
    // counter
    integer counter_value = 0;
        
        localparam div_value = 2499;
        // div_value = 100 MHz / (2 * desired frequency) - 1 
        
        always@ (posedge clock)
        begin
            if (counter_value == div_value)
                counter_value = 0; // reset
            else
                counter_value <= counter_value + 1;
        end
        
        always@ (posedge clock)
        begin
            if (counter_value == div_value)
                div_clk <= ~div_clk; // flip signal
            else
                div_clk <= div_clk;
        end
endmodule

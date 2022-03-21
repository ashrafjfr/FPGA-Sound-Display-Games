`timescale 1ns / 1ps

module led_vol(input clk_20khz, [11:0] volume, output reg [15:0] led, reg [3:0] level);
    reg [11:0] sample = 0;
    reg [11:0] counter = 0; //was 10
    
    always @ (posedge clk_20khz) begin
        counter <= counter + 1;
        sample <= ((volume > sample) || (counter == 0 && volume <= 2130)) ? volume : sample; 
    end
    
    always @ (posedge clk_20khz) begin

        if (sample <= 2130) begin
            led <= 1;
            level <= 0;
        end
        
        if (sample >= 2131 && sample <= 2261) begin
            led <= 3;
            level <= 1;
        end
            
        if (sample >= 2262 && sample <= 2392) begin
            led <= 7;
            level <= 2;
        end
        
        if (sample >= 2393 && sample <= 2523) begin
            led <= 15;
            level <= 3;
        end
        
        if (sample >= 2524 && sample <= 2654) begin
            led <= 31;
            level <= 4;
        end
        
        if (sample >= 2655 && sample <= 2785) begin
            led <= 63;
            level <= 5;
        end
        
        if (sample >= 2786 && sample <= 2916) begin
            led <= 127;
            level <= 6;
        end
        
        if (sample >= 2917 && sample <= 3047) begin
            led <= 255;
            level <= 7;
        end
        
        if (sample >= 3048 && sample <= 3178) begin
            led <= 511;
            level <= 8;
        end
        
        if (sample >= 3179 && sample <= 3309) begin
            led <= 1023;
            level <= 9;
        end
        
        if (sample >= 3310 && sample <= 3440) begin
            led <= 2047;
            level <= 10;
        end
        
        if (sample >= 3441 && sample <= 3571) begin
            led <= 4095;
            level <= 11;
        end
        
        if (sample >= 3572 && sample <= 3702) begin
            led <= 8191;
            level <= 12;
        end
        
        if (sample >= 3703 && sample <= 3833) begin
            led <= 16383;
            level <= 13;
        end
        
        if (sample >= 3834 && sample <= 3964) begin
            led <= 32767;
            level <= 14;
        end
        
        if (sample >= 3965) begin
            led <= 65535;
            level <= 15;
        end
    end
endmodule

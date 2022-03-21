`timescale 1ns / 1ps

module determine(
    input [15:6] sw,
    input [15:0] pixel_data,
    output [15:0] pixel_data_main, 
    input [15:0] pixel_data_6,
    input [15:0] pixel_data_7,
    input [15:0] pixel_data_8,
    input [15:0] pixel_data_9,
    input [15:0] pixel_data_10
    );
    
    assign pixel_data_main [15:0] = (sw[10]) ? pixel_data_10 : ((sw[9]) ? pixel_data_9 : ((sw[8]) ? pixel_data_8 : ((sw[7]) ? pixel_data_7 [15:0] : ((sw[6]) ? pixel_data_6 [15:0] : pixel_data [15:0])))); 
    
endmodule

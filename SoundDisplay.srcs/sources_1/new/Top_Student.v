`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY:TUESDAY A.M
//
//  STUDENT A NAME: Joshua Lee 
//  STUDENT A MATRICULATION NUMBER: A0214998L  
//
//  STUDENT B NAME: Muhammad Ashraf
//  STUDENT B MATRICULATION NUMBER: A0217396W 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3,   // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,   // Connect to this signal from Audio_Capture.v
    output [7:0] JC,      // For PmodOLED device
    input btnC,           // Centre Push Button
    input btnR,           // Right Push Button
    input btnL,           // Left Push Button
    input btnU,
    input btnD,
    input clock,          // 100MHz clock
    input [15:0] sw,      // Switches used: 0 - 8
    output [15:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
    wire clk_6p25_mhz;       // 6.25MHz clock
    wire clk_20khz;          // 20kHz clock   
    wire [11:0] sample;
    wire [3:0] vol;
    wire [15:0] pk_in_vol;
    wire [12:0] pixel_index;
    wire [15:0] pixel_data_main;
    wire [15:0] pixel_data; // default pixel_data
    wire [15:0] pixel_data_6; // number corresponds to switch to activate module
    wire [15:0] pixel_data_7; // number corresponds to switch to activate module
    wire [15:0] pixel_data_8; // number corresponds to switch to activate module
    wire [15:0] pixel_data_9;
    wire [15:0] pixel_data_10; //added
    wire [3:0] an_lv;
    wire [7:0] seg_lv; 
    wire [3:0] an_dino;
    wire [7:0] seg_dino;
    wire [3:0] an_pong;
    wire [7:0] seg_pong;
    wire [3:0] an_float;
    wire [7:0] seg_float;
    wire btn_left;
    wire btn_right;
    wire btn_down;
    wire btn_up;
    wire btn_centre;
       
    
    assign led = (sw[0]) ? sample : pk_in_vol;
    assign an = (sw[8]) ? an_float : ((sw[10]) ? an_pong : ((sw[9]) ? an_dino : an_lv));
    assign seg = (sw[8]) ? seg_float : ((sw[10]) ? seg_pong : ((sw[9]) ? seg_dino : seg_lv));

    // Clocks
    clk6p25m dut1(clock, clk_6p25_mhz);
    clk_20_khz dut4(clock, clk_20khz);
    
    // Buttons 
    btn_debouncer dut2(clk_6p25_mhz, btnC, btn_centre);
    btn_debouncer btnl(clk_6p25_mhz, btnL, btn_left);
    btn_debouncer btnr(clk_6p25_mhz, btnR, btn_right);
    btn_debouncer btnu(clk_6p25_mhz, btnU, btn_up);
    btn_debouncer btnd(clk_6p25_mhz, btnD, btn_down);
    
    // Given Modules
    Oled_Display oled_display(clk_6p25_mhz, 0, /*frame_begin*/, /*sending_pixel*/, /*sample_pixel*/,
    pixel_index[12:0], pixel_data_main[15:0], JC[0], JC[1], JC[3], JC[4], JC[5], JC[6], JC[7],);
    Audio_Capture AC(clock, clk_20khz, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, sample [11:0]);  
    
    // Misc
    vol_wave wav(clk_6p25_mhz, pixel_index [12:0], vol [3:0], pixel_data_6 [15:0]); //added
    pika_mask pik(clk_6p25_mhz, pixel_index[12:0], pixel_data_7[15:0], vol);
    float_ball flt(clk_6p25_mhz, btn_left, btn_right, btn_centre, pixel_index[12:0], pixel_data_8[15:0], vol, an_float [3:0], seg_float[7:0]);
    dino rawr(clk_6p25_mhz, btnU, btnD, btnC, pixel_index[12:0], vol [3:0], pixel_data_9[15:0], an_dino [3:0], seg_dino[7:0]);
    pong_game png(clk_6p25_mhz, sw[11], btn_left, btn_down, btn_right, btn_up, btn_centre, btnC, pixel_index[12:0], vol, pixel_data_10[15:0], an_pong [3:0], seg_pong [7:0]);
   
       
    // OLED
    draw_oled do(clk_6p25_mhz, btn_centre, btn_left, btn_right, pixel_index[12:0], sw[2], sw[3], sw[4], sw[5], vol, pixel_data[15:0]);
    
    //Module to assign pixel_data depending on switches
    determine det1(sw [15:6], pixel_data [15:0], pixel_data_main [15:0], 
    pixel_data_6 [15:0], pixel_data_7 [15:0], pixel_data_8 [15:0], pixel_data_9 [15:0], pixel_data_10 [15:0]); 
    //changes and in determine design source oso
    
    // Microphone & 7-Seg
    led_vol lv(clk_20khz, sample [11:0], pk_in_vol [15:0], vol [3:0]); 
    ss_display ds(sw[1], clock, vol [3:0], an_lv [3:0], seg_lv [7:0]);   

endmodule
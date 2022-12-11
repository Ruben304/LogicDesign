`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2022 07:23:50 PM
// Design Name: 
// Module Name: clock_divider_1khz
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

module top_ms ( clk_i, reset_i, mode_switch, b_1, VGA_HS_O, VGA_VS_O, VGA_R,VGA_G,VGA_B); //buttons 1-5

    input clk_i, reset_i;
//   input set_time    
//    input [5:0] set_hrs;
//    input  [4:0] set_min;
//    input  [4:0] set_sec;
//    input [9:0] set_ms;
    
    input [1:0] mode_switch; //mode switch
    input b_1; //buttons2-5 timer
    output VGA_HS_O, VGA_VS_O;
    output [3:0] VGA_R,VGA_G,VGA_B;
    
    reg [5:0] set_hrs = 11;
    reg [4:0] set_min = 35;
    reg [4:0] set_sec = 42;
    reg set_time = 1;
    
    wire CD1; //CLOCK DIVIDER 1KHZ, DB
    
    wire [5:0] DC12_HRS,  DC24_HRS, TI_HRS, SW_HRS;
    wire [4:0] DC12_MIN, DC24_MIN, TI_MIN,  SW_MIN;
    wire [4:0] DC12_SEC, DC24_SEC , TI_SEC, SW_SEC; //12HR, 24HR, TIMER, STOPWATCH
    wire [9:0] DC12_MS, DC24_MS, TI_MS, SW_MS;
    
    reg [5:0] TS_HRS;
    reg [4:0] TS_MIN, TS_SEC;
    reg [9:0] TS_MS;
    
    clock_divider_1khz c1(.clock_in(clk_i),.reset(reset_i), .clock_out(CD1));
    
    digital_clk_12hr_ms dc1 (.clk_i( CD1 ), .reset_i( reset_i ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec ), .sec_o( DC12_SEC ), .min_o( DC12_MIN ), .hour_o( DC12_HRS ), .ms_o(DC12_MS));       
    
    digital_clk_24hr_ms dc2(.clk_i( CD1 ), .reset_i( reset_i ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec ), .sec_o( DC24_SEC ), .min_o( DC24_MIN ), .hour_o( DC24_HRS ), .ms_o(DC24_MS));      
    
    stopwatch_ms ss2( .clk_i( CD1), .reset_i( reset_i ), .start_stop( b_1  ), .Timeset( set_time ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec  ), .sec_o( SW_SEC  ), .min_o( SW_MIN ), .hour_o( SW_HRS ), .Msset(set_ms), .ms_o(SW_MS) );
    
    timer ttl(.clk_i(CD1), .reset_i(reset_i), .start_i(b_1), .ml_o(TI_MS), .sec_o(TI_SEC), .min_o(TI_MIN), .hour_o(TI_HRS));
    
   always @*
        if (mode_switch == 2'b00) begin
            TS_HRS <= DC12_HRS;
            TS_MIN <= DC12_MIN;
            TS_SEC <= DC12_SEC;
            TS_MS <= DC12_MS;
        end else if (mode_switch == 2'b01) begin
            TS_HRS <= DC24_HRS;
            TS_MIN <= DC24_MIN;
            TS_SEC <= DC24_SEC;
            TS_MS <= DC24_MS;
        end else if (mode_switch == 2'b10) begin
            TS_HRS <= TI_HRS;
            TS_MIN <= TI_MIN;
            TS_SEC <= TI_SEC;
            TS_MS <= TI_MS;
        end else if (mode_switch == 2'b11) begin
            TS_HRS <= SW_HRS;
            TS_MIN <= SW_MIN;
            TS_SEC <= SW_SEC;
            TS_MS <= SW_MS;
        end
        
    top_square ts1(.CLK(clk_i),.RST_BTN(reset_i), .sec(TS_SEC),.min(TS_MIN),.hour(TS_HRS),.ms(TS_MS),.VGA_HS_O(VGA_HS_O),.VGA_VS_O(VGA_VS_O),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
    
endmodule      

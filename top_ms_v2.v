module top_ms ( clk_i, reset_i, mode_switch, set_hrs, set_min, set_sec, set_time, set_ms, digit_select, b_1, b_2, b_3, b_4, b_5, VGA_HS_O, VGA_VS_O, VGA_R,VGA_G,VGA_B); //buttons 1-5

    input clk_i, reset_i, set_time;
    input [5:0] set_hrs;
    input  [4:0] set_min;
    input  [4:0] set_sec;
    input [9:0] set_ms;
    
    input [1:0] mode_switch; //mode switch
    input b_1, b_2, b_3, b_4, b_5; //buttons2-5 timer
    output VGA_HS_O, VGA_VS_O;
    output [3:0] VGA_R,VGA_G,VGA_B;
    output reg [2:0] digit_select; //timer switch
    
    wire CD1; //CLOCK DIVIDER 1KHZ, DB
    
    wire [5:0] DC12_HRS,  DC24_HRS, TI_HRS, SW_HRS;
    wire [4:0] DC12_MIN, DC24_MIN, TI_MIN,  SW_MIN;
    wire [4:0] DC12_SEC, DC24_SEC , TI_SEC, SW_SEC; //12HR, 24HR, TIMER, STOPWATCH
    wire [9:0] DC12_MS, DC24_MS, TI_MS, SW_MS;
    
    reg [5:0] TS_HRS;
    reg [4:0] TS_MIN, TS_SEC;
    reg [9:0] TS_MS;
    
    clock_divider_1khz c1(.clock_in(clk_i),.reset(reset_i), .clock_out(CD1));
    
    digital_clk_12hr_ms dc1 (.clk_i( CD1 ), .reset_i( reset_i ), .Timeset( set_time ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec ), .sec_o( DC12_SEC ), .min_o( DC12_MIN ), .hour_o( DC12_HRS ), .ms_o(DC12_MS));       
    
    digital_clk_24hr_ms dc2(.clk_i( CD1 ), .reset_i( reset_i ), .Timeset( set_time ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec ), .sec_o( DC24_SEC ), .min_o( DC24_MIN ), .hour_o( DC24_HRS ), .ms_o(DC24_MS));      
    
    stopwatch_ms ss2( .clk_i( CD1 ), .reset_i( reset_i ), .start_stop( b_1  ), .Timeset( set_time ), .Hourset( set_hrs ), .Minset( set_min ), .Secset( set_sec  ), .sec_o( SW_SEC  ), .min_o( SW_MIN ), .hour_o( SW_HRS ), .Msset(set_ms), .ms_o(SW_MS) );
    
    timer tt1(.clk_i(clk_i), .reset_i(reset_i), .start_i(b_1), .left_i(b_2), .right_i(b_3), .up_i(b_4), .down_i(b_5), .ml_o(TI_MS), .sec_o(TI_SEC), .min_o(TI_MIN), .hour_o(TI_HRS), .digitp(digit_select));
    
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
        end else if (mode_switch == 2'b10) begin
            TS_HRS <= SW_HRS;
            TS_MIN <= SW_MIN;
            TS_SEC <= SW_SEC;
            TS_MS <= SW_MS;
        end
 
    top_square ts1(.CLK(clk_i),.RST_BTN(reset_i), .sec(TS_SEC),.min(TS_MIN),.hour(TS_HRS),.ms(TS_MS),.VGA_HS_O(VGA_HS_O),.VGA_VS_O(VGA_VS_O),.VGA_R(VGA_R),.VGA_G(VGA_G),.VGA_B(VGA_B));
    
endmodule 

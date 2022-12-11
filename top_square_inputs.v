`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2020 12:29:25 PM
// Design Name: 
// Module Name: top_square
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
//////////////////////////////////////////////////////////////////////////////
module top_square(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,
    input wire [7:0] random_num,
    input wire [7:0] hit,         
    input [5:0] sec,
    input [5:0] min,
    input [4:0] hour,
    input [9:0] ms,
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output wire [3:0] VGA_R,    // 4-bit VGA red output
    output wire [3:0] VGA_G,    // 4-bit VGA green output
    output wire [3:0] VGA_B     // 4-bit VGA blue output
    );

    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
    
    //reg [5:0] sec = 16;
    //reg [5:0] min = 26;
    //reg [4:0] hour = 21;
    //reg [9:0] ms = 511;

    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );

    // Wires to hold regions on FPGA
    wire SQ1,SQ2,SQ3,SQ4,SQ5,SQ6,SQ7,SQ8,SQ9,SQ10,SQ11,SQ12,SQ13,SQ14,SQ15,SQ16,SQ17,SQ18,SQ19,SQ20,SQ21,SQ22,SQ23,SQ24,SQ25,SQ26,SQ27,SQ28,SQ29,SQa,SQb,SQc,SQd,SQe,SQMid,SQ10hit,SQ11hit,SQ12hit,SQ13hit,SQ14hit,SQ15hit,SQ16hit,SQ17hit;
    wire SQ30,SQ31,SQ32,SQ33,SQ34,SQ35,SQ36,SQ37,SQ38,SQ39,SQ40,SQ41,SQ42,SQ43,SQ44,SQ45, SQ46,SQ47,SQ48,SQ49, SQ50,SQ51,SQ52,SQ53,SQ54,SQ55,SQ56, SQ57, SQ58, SQ59, SQ60, SQ61, SQ62, SQ63, SQ64, SQ65 ;
	
    //Registers for entities
	reg green,grid,gridh1,gridh2,gridm1,gridm2,grids1,grids2,gridms1,gridms2,gridms3;
	
	// Creating Regions on the VGA Display represented as wires (640x480)
	
	// SQ1 is a large Square, and SQ2-9, along with SQ Mid are areas within SQ1
    assign SQ1 = ((x > 18) & (y > 123) & (x < 60) & (y < 136)) ? 1 : 0; // hour 1
    assign SQ2 = ((x > 5) & (y > 136) & (x < 18) & (y < 175)) ? 1 : 0; // hour 1
    assign SQ3 = ((x > 60) & (y > 136) & (x < 73) & (y < 175)) ? 1 : 0; // hour 1
    assign SQ4 = ((x > 18) & (y > 175) & (x < 60) & (y < 187)) ? 1 : 0; // hour 1
    assign SQ5 = ((x > 60) & (y > 187) & (x < 73) & (y < 226)) ? 1 : 0; // hour 1
    assign SQ6 = ((x > 5) & (y > 187) & (x < 18) & (y < 226)) ? 1 : 0; // hour 1
    assign SQ7 = ((x > 18) & (y > 226) & (x < 60) & (y < 239)) ? 1 : 0; // hour 1
    assign SQ8 = ((x > 99) & (y > 123) & (x < 141) & (y < 136)) ? 1 : 0; // hour 2
    assign SQ9 = ((x > 86) & (y > 136) & (x < 99) & (y < 175)) ? 1 : 0; // hour 2
    assign SQ10 = ((x > 141) & (y > 136) & (x < 154) & (y < 175)) ? 1 : 0; // hour 2
    assign SQ11 = ((x > 99) & (y > 175) & (x < 141) & (y < 187)) ? 1 : 0; // hour 2 
    assign SQ12 = ((x > 141) & (y > 187) & (x < 154) & (y < 226)) ? 1 : 0; // hour 2
    assign SQ13 = ((x > 86) & (y > 187) & (x < 99) & (y < 226)) ? 1 : 0; // hour 2
    assign SQ14 = ((x > 99) & (y > 226) & (x < 141) & (y < 239)) ? 1 : 0; // hour 2
    assign SQa = ((x > 162) & (y > 161) & (x < 170) & (y < 169)) ? 1 : 0; // colon 1
    assign SQb = ((x > 162) & (y > 193) & (x < 170) & (y < 201)) ? 1 : 0; // colon 1
    assign SQ15 = ((x > 191) & (y > 123) & (x < 233) & (y < 136)) ? 1 : 0; // min 1
    assign SQ16 = ((x > 178) & (y > 136) & (x < 191) & (y < 175)) ? 1 : 0; // min 1
    assign SQ17 = ((x > 233) & (y > 136) & (x < 246) & (y < 175)) ? 1 : 0; // min 1
    assign SQ18 = ((x > 191) & (y > 175) & (x < 233) & (y < 187)) ? 1 : 0; // min 1
    assign SQ19 = ((x > 233) & (y > 187) & (x < 246) & (y < 226)) ? 1 : 0; // min 1
    assign SQ20 = ((x > 178) & (y > 187) & (x < 191) & (y < 226)) ? 1 : 0; // min 1 
    assign SQ21 = ((x > 191) & (y > 226) & (x < 233) & (y < 239)) ? 1 : 0; // min 1
    assign SQ22 = ((x > 272) & (y > 123) & (x < 314) & (y < 136)) ? 1 : 0; // min 2
    assign SQ23 = ((x > 259) & (y > 136) & (x < 272) & (y < 175)) ? 1 : 0; // min 2
    assign SQ24 = ((x > 314) & (y > 136) & (x < 327) & (y < 175)) ? 1 : 0; // min 2
    assign SQ25 = ((x > 272) & (y > 175) & (x < 314) & (y < 187)) ? 1 : 0; // min 2
    assign SQ26 = ((x > 314) & (y > 187) & (x < 327) & (y < 226)) ? 1 : 0; // min 2
    assign SQ27 = ((x > 259) & (y > 187) & (x < 272) & (y < 226)) ? 1 : 0; // min 2
    assign SQ28 = ((x > 272) & (y > 226) & (x < 314) & (y < 239)) ? 1 : 0; // min 2
    assign SQc = ((x > 335) & (y > 161) & (x < 343) & (y < 169)) ? 1 : 0; // colon 2
    assign SQd = ((x > 335) & (y > 193) & (x < 343) & (y < 201)) ? 1 : 0; // colon 2
    assign SQ29 = ((x > 364) & (y > 123) & (x < 406) & (y < 136)) ? 1 : 0; // sec 1
    assign SQ30 = ((x > 351) & (y > 136) & (x < 364) & (y < 175)) ? 1 : 0; // sec 1
    assign SQ31 = ((x > 406) & (y > 136) & (x < 419) & (y < 175)) ? 1 : 0; // sec 1
    assign SQ32 = ((x > 364) & (y > 175) & (x < 406) & (y < 187)) ? 1 : 0; // sec 1
    assign SQ33 = ((x > 406) & (y > 187) & (x < 419) & (y < 226)) ? 1 : 0; // sec 1
    assign SQ34 = ((x > 351) & (y > 187) & (x < 364) & (y < 226)) ? 1 : 0; // sec 1
    assign SQ35 = ((x > 364) & (y > 226) & (x < 406) & (y < 239)) ? 1 : 0; // sec 1
    assign SQ36 = ((x > 445) & (y > 123) & (x < 487) & (y < 136)) ? 1 : 0; // sec 2
    assign SQ37 = ((x > 432) & (y > 136) & (x < 445) & (y < 175)) ? 1 : 0; // sec 2
    assign SQ38 = ((x > 487) & (y > 136) & (x < 500) & (y < 175)) ? 1 : 0; // sec 2
    assign SQ39 = ((x > 445) & (y > 175) & (x < 487) & (y < 187)) ? 1 : 0; // sec 2
    assign SQ40 = ((x > 487) & (y > 187) & (x < 500) & (y < 226)) ? 1 : 0; // sec 2
    assign SQ41 = ((x > 432) & (y > 187) & (x <445) & (y < 226)) ? 1 : 0; // sec 2
    assign SQ42 = ((x > 445) & (y > 226) & (x < 487) & (y < 239)) ? 1 : 0; // sec 2
    assign SQe = ((x > 508) & (y > 226) & (x < 516) & (y < 239)) ? 1 : 0; // dec 3
    assign SQ43 = ((x > 530) & (y > 234) & (x < 542) & (y < 239)) ? 1 : 0; // ms 1
    assign SQ44 = ((x > 542) & (y > 219) & (x < 548) & (y < 234)) ? 1 : 0; // ms 1
    assign SQ45 = ((x > 524) & (y > 219) & (x < 530) & (y < 234)) ? 1 : 0; // ms 1
    assign SQ46 = ((x > 530) & (y > 214) & (x < 542) & (y < 219)) ? 1 : 0; // ms 1
    assign SQ47 = ((x > 542) & (y > 199) & (x < 548) & (y < 214)) ? 1 : 0; // ms 1
    assign SQ48 = ((x > 524) & (y > 199) & (x < 530) & (y < 214)) ? 1 : 0; // ms 1
    assign SQ49 = ((x > 530) & (y > 194) & (x < 542) & (y < 199)) ? 1 : 0; // ms 1
    assign SQ50 = ((x > 560) & (y > 234) & (x < 572) & (y < 239)) ? 1 : 0; // ms 2
    assign SQ51 = ((x > 572) & (y > 219) & (x < 578) & (y < 234)) ? 1 : 0; // ms 2
    assign SQ52 = ((x > 554) & (y > 219) & (x < 560) & (y < 234)) ? 1 : 0; // ms 2
    assign SQ53 = ((x > 560) & (y > 214) & (x < 572) & (y < 219)) ? 1 : 0; // ms 2
    assign SQ54 = ((x > 572) & (y > 199) & (x < 578) & (y < 214)) ? 1 : 0; // ms 2
    assign SQ55 = ((x > 554) & (y > 199) & (x < 560) & (y < 214)) ? 1 : 0; // ms 2
    assign SQ56 = ((x > 560) & (y > 194) & (x < 572) & (y < 199)) ? 1 : 0; // ms 2
    assign SQ57 = ((x > 590) & (y > 234) & (x < 602) & (y < 239)) ? 1 : 0; // ms 2
    assign SQ58 = ((x > 602) & (y > 219) & (x < 608) & (y < 234)) ? 1 : 0; // ms 2
    assign SQ59 = ((x > 584) & (y > 219) & (x < 590) & (y < 234)) ? 1 : 0; // ms 2
    assign SQ60 = ((x > 590) & (y > 214) & (x < 602) & (y < 219)) ? 1 : 0; // ms 2
    assign SQ61 = ((x > 602) & (y > 199) & (x < 608) & (y < 214)) ? 1 : 0; // ms 2
    assign SQ62 = ((x > 584) & (y > 199) & (x < 590) & (y < 214)) ? 1 : 0; // ms 2
    assign SQ63 = ((x > 590) & (y > 194) & (x < 602) & (y < 199)) ? 1 : 0; // ms 2
//    assign SQMid = ((x > 279) & (y > 200) & (x < 361) & (y < 280)) ? 1 : 0; // Center Square
    
//	// SQ10-17 are also areas within SQ1
//    assign SQ10 = ((x > 100) & (y > 60) &  (x < 181) & (y < 140)) ? 1 : 0; // Green Square
//    assign SQ11 = ((x > 100) & (y > 200) & (x < 181) & (y < 280)) ? 1 : 0; // Green Square
//    assign SQ12 = ((x > 100) & (y > 340) & (x < 181) & (y < 420)) ? 1 : 0; // Green Square
//    assign SQ13 = ((x > 279) & (y > 60 ) & (x < 361) & (y < 140)) ? 1 : 0; // Green Square
//    assign SQ14 = ((x > 279) & (y > 340) & (x < 361) & (y < 420)) ? 1 : 0; // Green Square
//    assign SQ15 = ((x > 459) & (y > 60 ) & (x < 540) & (y < 140)) ? 1 : 0; // Green Square
//    assign SQ16 = ((x > 459) & (y > 200) & (x < 540) & (y < 280)) ? 1 : 0; // Green Square
//    assign SQ17 = ((x > 459) & (y > 340) & (x < 540) & (y < 420)) ? 1 : 0; // Green Square
//    // SQ10hit-17hit are the same areas as SQ10-17
//    assign SQ10hit = ((x > 100) & (y > 60) &  (x < 181) & (y < 140)) ? 1 : 0; // Hit Square
//    assign SQ11hit = ((x > 100) & (y > 200) & (x < 181) & (y < 280)) ? 1 : 0; // Hit Square
//    assign SQ12hit = ((x > 100) & (y > 340) & (x < 181) & (y < 420)) ? 1 : 0; // Hit Square
//    assign SQ13hit = ((x > 279) & (y > 60 ) & (x < 361) & (y < 140)) ? 1 : 0; // Hit Square
//    assign SQ14hit = ((x > 279) & (y > 340) & (x < 361) & (y < 420)) ? 1 : 0; // Hit Square
//    assign SQ15hit = ((x > 459) & (y > 60 ) & (x < 540) & (y < 140)) ? 1 : 0; // Hit Square
//    assign SQ16hit = ((x > 459) & (y > 200) & (x < 540) & (y < 280)) ? 1 : 0; // Hit Square
//    assign SQ17hit = ((x > 459) & (y > 340) & (x < 540) & (y < 420)) ? 1 : 0; // Hit Square



    
 // Assign the registers to the VGA 3rd output. This will display strong red on the Screen when 
 // grid = 1, and strong green on the screen when green = 1;
 assign VGA_R[3] = grid;
 assign VGA_G[3] = green;
  
  always @ (*)
  begin 
	//At start of every input change reset the screen and grid. Check inputs and update grid accordingly
	
	//Green = 0 means that there will be no values of x/y on the VGA that will display green
    green = 0;
	//This statement makes it so that within SQ1, a 3x3 grid of squares appears, with the middle square blacked out
    // gridh1 =  SQ1 - SQ3 - SQ5;
    // gridh2 =  -SQ8 - SQ10 - SQ11 - SQ13 - SQ14 - SQa - SQb;
    // gridm1 =  -SQ15 - SQ17 - SQ18 - SQ19 - SQ21;
    // gridm2 =  -SQ22 - SQ23 - SQ24 - SQ25 - SQ26 - SQ27 - SQ28 - SQc - SQd;
    // grids1 =  -SQ29 - SQ30 - SQ31 - SQ32 - SQ33 - SQ34 - SQ35;
    // grids2 =  -SQ36 - SQ37 - SQ38 - SQ39 - SQ40 - SQ41 - SQ42 - SQe;
    // gridms1 =  -SQ43 - SQ44 - SQ45 - SQ46 - SQ47 - SQ48 - SQ49;
    // gridms2 =  -SQ50 - SQ51 - SQ52 - SQ53 - SQ54 - SQ55 - SQ56;
    // gridms3 =  -SQ57 - SQ58 - SQ59 - SQ60 - SQ61 - SQ62 - SQ63;    
    // grid = gridh1 + gridh2 + gridm1 + gridm2 + grids1 + grids2 + gridms1 + gridms2 + gridms3;                   
    
    
    if (hour >= 20) begin
        gridh1 = -SQ1 - SQ3 - SQ4 - SQ6 - SQ7;
    end else if (hour >= 10) begin
        gridh1 = -SQ3 - SQ5;
    end else begin
        gridh1 = -SQ1 - SQ2 - SQ3 - SQ5 - SQ6 - SQ7;
    end
    
    if ((hour % 10) == 9) begin
        gridh2 =  -SQ8 - SQ9 - SQ10 - SQ11 - SQ12;
    end else if ((hour % 10) == 8) begin
        gridh2 = -SQ8 - SQ9 - SQ10 - SQ11 - SQ12 - SQ13 - SQ14;
    end else if ((hour % 10) == 7) begin
        gridh2 = -SQ8 - SQ12 - SQ10;
    end else if ((hour % 10) == 6) begin
        gridh2 = -SQ8 - SQ9 - SQ11 - SQ12 - SQ13 - SQ14;
    end else if ((hour % 10) == 5) begin
        gridh2 = -SQ8 - SQ9 - SQ11 - SQ12 - SQ14;
    end else if ((hour % 10) == 4) begin
        gridh2 = -SQ9 - SQ10 - SQ11 - SQ12;
    end else if ((hour % 10) == 3) begin
        gridh2 = -SQ8 - SQ10 - SQ11 - SQ12 - SQ14;
    end else if ((hour % 10) == 2) begin
        gridh2 = -SQ8 - SQ10 - SQ11 - SQ13 - SQ14;
    end else if ((hour % 10) == 1) begin
        gridh2 = -SQ10 - SQ12;
    end else begin
        gridh2 = -SQ8 - SQ9 - SQ10 - SQ12 - SQ13 - SQ14;
    end
    
    if (min >= 50) begin
        gridm1 = -SQ15 - SQ16 - SQ18 - SQ19 - SQ21;
    end else if (min >= 40) begin
        gridm1 = -SQ16 - SQ17 - SQ18 - SQ19;
    end else if (min >= 30) begin
        gridm1 = -SQ15 - SQ17 - SQ18 - SQ19 - SQ21;
    end else if (min >= 20) begin
        gridm1 = -SQ15 - SQ17 - SQ18 - SQ20 - SQ21;
    end else if (min >= 10) begin
        gridm1 = -SQ17 - SQ19;
    end else begin
        gridm1 = -SQ15 - SQ16 - SQ17 - SQ19 - SQ20 - SQ21;
    end
    
    if ((min % 10) == 9) begin
        gridm2 =  -SQ22 - SQ23 - SQ24 - SQ25 - SQ26;
    end else if ((min % 10) == 8) begin
        gridm2 = -SQ22 - SQ23 - SQ24 - SQ25 - SQ26 - SQ27 - SQ28;
    end else if ((min % 10) == 7) begin
        gridm2 = -SQ22 - SQ24 - SQ26;
    end else if ((min % 10) == 6) begin
        gridm2 = -SQ22 - SQ23 - SQ25 - SQ26 - SQ27 - SQ28;
    end else if ((min % 10) == 5) begin
        gridm2 = -SQ22 - SQ23 - SQ25 - SQ26 - SQ28;
    end else if ((min % 10) == 4) begin
        gridm2 = -SQ23 - SQ24 - SQ25 - SQ26;
    end else if ((min % 10) == 3) begin
        gridm2 = -SQ22 - SQ24 - SQ25 - SQ26 - SQ28;
    end else if ((min % 10) == 2) begin
        gridm2 = -SQ22 - SQ24 - SQ25 - SQ27 - SQ28;
    end else if ((min % 10) == 1) begin
        gridm2 = -SQ24 - SQ26;
    end else begin
        gridm2 = -SQ22 - SQ23 - SQ24 - SQ26 - SQ27 - SQ28;
    end
    
    if (sec >= 50) begin
        grids1 = -SQ29 - SQ30 - SQ32 - SQ33 - SQ35;
    end else if (sec >= 40) begin
        grids1 = -SQ30 - SQ31 - SQ32 - SQ33;
    end else if (sec >= 30) begin
        grids1 = -SQ29 - SQ31 - SQ32 - SQ33 - SQ35;
    end else if (sec >= 20) begin
        grids1 = -SQ29 - SQ31 - SQ32 - SQ34 - SQ35;
    end else if (sec >= 10) begin
        grids1 = -SQ31 - SQ33;
    end else begin
        grids1 = -SQ29 - SQ30 - SQ31 - SQ33 - SQ34 - SQ35;
    end
    
    if ((sec % 10) == 9) begin
        grids2 =  -SQ36 - SQ37 - SQ38 - SQ39 - SQ40;
    end else if ((sec % 10) == 8) begin
        grids2 = -SQ36 - SQ37 - SQ38 - SQ39 - SQ40 - SQ41 - SQ42;
    end else if ((sec % 10) == 7) begin
        grids2 = -SQ36 - SQ38 - SQ40;
    end else if ((sec % 10) == 6) begin
        grids2 = -SQ36 - SQ37 - SQ39 - SQ40 - SQ41 - SQ42;
    end else if ((sec % 10) == 5) begin
        grids2 = -SQ36 - SQ37 - SQ39 - SQ40 - SQ42;
    end else if ((sec % 10) == 4) begin
        grids2 = -SQ37 - SQ38 - SQ39 - SQ40;
    end else if ((sec % 10) == 3) begin
        grids2 = -SQ36 - SQ38 - SQ39 - SQ40 - SQ42;
    end else if ((sec % 10) == 2) begin
        grids2 = -SQ36 - SQ38 - SQ39 - SQ41 - SQ42;
    end else if ((sec % 10) == 1) begin
        grids2 = -SQ38 - SQ40;
    end else begin
        grids2 = -SQ36 - SQ37 - SQ38 - SQ40 - SQ41 - SQ42;
    end
    
    if (ms >= 900) begin
        gridms1 =  -SQ44 - SQ46 - SQ47 - SQ48 - SQ49;
    end else if (ms >= 800) begin
        gridms1 = -SQ43 - SQ44 - SQ45 - SQ46 - SQ47 - SQ48 - SQ49;
    end else if (ms >= 700) begin
        gridms1 = -SQ44 - SQ47 - SQ49;
    end else if (ms >= 600) begin
        gridms1 = -SQ43 - SQ44 - SQ45 - SQ46 - SQ48 - SQ49;
    end else if (ms >= 500) begin
        gridms1 = -SQ43 - SQ44 - SQ46 - SQ48 - SQ49;
    end else if (ms >= 400) begin
        gridms1 = -SQ44 - SQ46 - SQ47 - SQ48;
    end else if (ms >= 300) begin
        gridms1 = -SQ43 - SQ44 - SQ46 - SQ47 - SQ49;
    end else if (ms >= 200) begin
        gridms1 = -SQ43 - SQ45 - SQ46 - SQ47 - SQ49;
    end else if (ms >= 100) begin
        gridms1 = -SQ44 - SQ47;
    end else begin
        gridms1 = -SQ43 - SQ44 - SQ45 - SQ47 - SQ48 - SQ49;
    end
    
    if ((ms % 100) >= 90) begin
        gridms2 =  -SQ51 - SQ53 - SQ54 - SQ55 - SQ56;
    end else if ((ms % 100) >= 80) begin
        gridms2 = -SQ50 - SQ51 - SQ52 - SQ53 - SQ54 - SQ55 - SQ56;
    end else if ((ms % 100) >= 70) begin
        gridms2 = -SQ51 - SQ54 - SQ56;
    end else if ((ms % 100) >= 60) begin
        gridms2 = -SQ50 - SQ51 - SQ52 - SQ53 - SQ55 - SQ56;
    end else if ((ms % 100) >= 50) begin
        gridms2 = -SQ50 - SQ51 - SQ53 - SQ55 - SQ56;
    end else if ((ms % 100) >= 40) begin
        gridms2 = -SQ51 - SQ53 - SQ54 - SQ55;
    end else if ((ms % 100) >= 30) begin
        gridms2 = -SQ50 - SQ51 - SQ53 - SQ54 - SQ56;
    end else if ((ms % 100) >= 20) begin
        gridms2 = -SQ50 - SQ52 - SQ53 - SQ54 - SQ56;
    end else if ((ms % 100) >= 10) begin
        gridms2 = -SQ51 - SQ54;
    end else begin
        gridms2 = -SQ50 - SQ51 - SQ52 - SQ54 - SQ55 - SQ56;
    end 
    
    if ((ms % 10) == 9) begin
        gridms3 =  -SQ58 - SQ60 - SQ61 - SQ62 - SQ63;
    end else if ((ms % 10) == 8) begin
        gridms3 = -SQ57 - SQ58 - SQ59 - SQ60 - SQ61 - SQ62 - SQ63;
    end else if ((ms % 10) == 7) begin
        gridms3 = -SQ58 - SQ61 - SQ63;
    end else if ((ms % 10) == 6) begin
        gridms3 = -SQ57 - SQ58 - SQ59 - SQ60 - SQ62 - SQ63;
    end else if ((ms % 10) == 5) begin
        gridms3 = -SQ57 - SQ58 - SQ60 - SQ62 - SQ63;
    end else if ((ms % 10) == 4) begin
        gridms3 = -SQ58 - SQ60 - SQ61 - SQ62;
    end else if ((ms % 10) == 3) begin
        gridms3 = -SQ57 - SQ58 - SQ60 - SQ61 - SQ63;
    end else if ((ms % 10) == 2) begin
        gridms3 = -SQ57 - SQ59 - SQ60 - SQ61 - SQ63;
    end else if ((ms % 10) == 1) begin
        gridms3 = -SQ58 - SQ61;
    end else begin
        gridms3 = -SQ57 - SQ58 - SQ59 - SQ61 - SQ62 - SQ63;
    end
    

    grid = gridh1 + gridh2 - SQa - SQb + gridm1 + gridm2 - SQc - SQd + grids1 + grids2 - SQe + gridms1 + gridms2 + gridms3;
    
//    if(random_num[0] == 1)
//        begin
//			//Add SQ10 to the areas which will display strong green.
//			//Note: This displays yellow on the display, as red+green = yellow.
//            green = green + SQ10; 
//        end
//    else if(random_num[0] == 0 && hit[0]==1)
//        begin
//			//Add SQ10 to the areas which will display strong green, and remove it from the area that displays 
//			//strong red.
//            green = green + SQ10;
//            grid = grid - SQ10hit;
//        end   
//    if(random_num[1] == 1)
//        begin
//            green = green + SQ11;
//        end
//    else if(random_num[1] == 0 && hit[1]==1)
//        begin
//            green = green + SQ11;
//            grid = grid - SQ11hit;
//        end        
//    if(random_num[2] == 1)
//        begin
//            green = green + SQ12;
//        end
//    else if(random_num[2] == 0 && hit[2]==1)
//        begin
//            green = green + SQ12;
//            grid = grid - SQ12hit;
//        end 
//    if(random_num[3] == 1)
//        begin
//            green = green + SQ13;
//        end
//    else if(random_num[3] == 0 && hit[3]==1)
//        begin
//            green = green + SQ13;
//            grid = grid - SQ13hit;
//        end 
//    if(random_num[4] == 1)
//        begin
//            green = green + SQ14;
//        end
//    else if(random_num[4] == 0 && hit[4]==1)
//        begin
//            green = green + SQ14;
//            grid = grid - SQ14hit;
//        end 
//    if(random_num[5] == 1)
//        begin
//            green = green + SQ15;
//        end
//    else if(random_num[5] == 0 && hit[5]==1)
//        begin
//            green = green + SQ15;
//            grid = grid - SQ15hit;
//        end 
//    if(random_num[6] == 1)
//        begin
//            green = green + SQ16;
//        end
//    else if(random_num[6] == 0 && hit[6]==1)
//        begin
//            green = green + SQ16;
//            grid = grid - SQ16hit;
//        end 
//    if(random_num[7] == 1)
//        begin
//            green = green + SQ17;
//        end
//    else if(random_num[7] == 0 && hit[7]==1)
//        begin
//            green = green + SQ17;
//            grid = grid - SQ17hit;
//        end 
  end
    
    
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 09:21:12 PM
// Design Name: 
// Module Name: timer6_test
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


module timer6_test(

    );
    
    reg A;
    reg B;
    reg BB;
    reg BL;
    reg BR;
    reg BU;
    reg BD;
    wire [9:0] CC;
    wire [5:0] C;
    wire [5:0] D;
    wire [5:0] E;
    wire [2:0] F;
    
    timer6 timem(.clk_i(A), .reset_i(B), .start_i(BB), .left_i(BL), .right_i(BR), .up_i(BU), .down_i(BD), .ml_o(CC), .sec_o(C), .min_o(D), .hour_o(E), .digitp(F));
    
    initial begin
    A = 0;
    forever #10 A = ~A;
    end
    initial begin
    B = 0;
    BB = 0;
    BL = 0;
    BR = 0;
    BU = 0;
    BD = 0;
    #51
    BU = 1;
    #17;
    BU = 0;
    #33;
    BU = 1;
    #20;
    BU = 0;
    #78;
    BR = 1;
    #17;
    BR = 0;
    #13;
    BR = 1;
    #20;
    BR = 0;
    #37;
    BD = 1;
    #17;
    BD = 0;
    #13;
    BD = 1;
    #20;
    BD = 0;
    #13;
    BD = 1;
    #20;
    BD = 0;
    #37;
    BU = 1;
    #17;
    BU = 0;
    #13;
    BU = 1;
    #20;
    BU = 0;
    #13;
    BU = 1;
    #20;
    BU = 0;
    #37;
    BU = 1;
    #17;
    BU = 0;
    #13;
    BU = 1;
    #20;
    BU = 0;
    #13;
    BU = 1;
    #20;
    BU = 0;
    #309;
    BB = 1;
    #19;
    BB = 0;
    #489;
    B = 1;
    #12;
    B = 0;
    #753;
    BB = 1;
    #13;
    BB = 0;
    #1523;
    end
    
endmodule

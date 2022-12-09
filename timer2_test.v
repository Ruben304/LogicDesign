`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 07:16:59 PM
// Design Name: 
// Module Name: timer2_test
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


module timer2_test(

    );
    
    reg A;
    reg B;
    wire [5:0] C;
    wire [5:0] D;
    wire [5:0] E;
    
    timer2 timem(.clk_i(A), .reset_i(B), .sec_o(C), .min_o(D), .hour_o(E));
    
    initial begin
    A = 0;
    forever #100 A = ~A;
    end
    initial begin
    B = 0;
    #1309;
    B = 1;
    #12;
    B = 0;
    #1523;
    end
    
endmodule

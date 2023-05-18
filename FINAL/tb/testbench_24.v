`timescale 1s / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 06:40:34 PM
// Design Name: 
// Module Name: testbench_24
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


module testbench_24( );
    reg clk_i, reset_i, Timeset;
    reg [4:0] Hourset;
    reg [5:0] Minset;
    reg [5:0] Secset;
    
    wire [5:0] sec_o;
    wire [5:0] min_o;
    wire [4:0] hour_o;
    
    digital_clk_24hr dc24(.clk_i(clk_i), .reset_i(reset_i), .Timeset(Timeset), .Hourset(Hourset), .Minset(Minset), .Secset(Secset),.sec_o(sec_o), .min_o(min_o), .hour_o(hour_o));
    

 
    
    initial begin
        clk_i = 0;
        reset_i = 1;
        Timeset = 0;
    #5 reset_i = 0;
    #65 Timeset = 1;
        Hourset = 23;
        Minset = 59;
        Secset = 59;
    #100 Timeset = 0;
        forever begin
            #1 clk_i = ~clk_i;
        end
    end
        
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2022 09:52:09 PM
// Design Name: 
// Module Name: clock_reducer1
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


module clock_reducer1(
    input clkin,
    output reg clkout = 0
    );
    
    reg [0:15] clockcounter;
    
    always @ (posedge clkin) begin
    if (clockcounter == 50000) begin
    clkout <= ~clkout;
    clockcounter <= 0;
    end else begin
    clockcounter <= clockcounter + 1;
    end
    end
    
endmodule

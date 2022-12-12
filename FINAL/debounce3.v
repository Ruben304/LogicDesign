`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2022 01:39:10 AM
// Design Name: 
// Module Name: debounce3
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


module debounce3(
    input dbin,
    input clk,
    output reg dbout
    );
    
    reg [0:7] dbcounter = 0;
    reg test1 = 0;

    always @ (posedge clk) begin
     if (dbin == 1) begin
       dbcounter <= dbcounter + 1;
      end else begin
       dbcounter <= 0;
       test1 <= 0;
      end
      if (dbcounter == 25) begin
      test1 <= 1;
      end
      if (test1 == 1) begin
       dbout <= 1;
      end else begin
       dbout = 0;
      end
     end
    
endmodule

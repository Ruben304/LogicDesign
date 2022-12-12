`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2022 08:45:45 PM
// Design Name: 
// Module Name: timer6
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


module timer6(
clk_i, reset_i, start_i, ml_o, sec_o, min_o, hour_o
    );
    input clk_i, start_i, reset_i;
    // clk_i = 1kHz input
    output reg [9:0] ml_o;
    output reg [5:0] sec_o;
    output reg [5:0] min_o;
    output reg [5:0] hour_o;
    reg [5:0] startsec = 0;
    reg [5:0] startmin = 5;
    reg [5:0] starthour = 0;
        
    always @(posedge(clk_i)) begin
          if (reset_i == 1'b1) begin
              hour_o <= starthour;
              sec_o <= startsec;
              min_o <= startmin;
              ml_o <= 0;
          end
          
          if (start_i == 1'b1) begin
              if (hour_o == 0 && min_o == 0 && sec_o == 0 && ml_o == 0) begin
              ml_o <= ml_o;
              min_o <= min_o;
              sec_o <= sec_o;
              hour_o <= hour_o;
              end else if (min_o == 0 && sec_o == 0 && ml_o == 0) begin
              ml_o <= 999;
              min_o <= 59;
              sec_o <= 59;
              hour_o <= hour_o - 1;
              end else if (sec_o == 0 && ml_o == 0) begin
              ml_o <= 999;
              sec_o <= 59;
              min_o <= min_o - 1;
              end else if (ml_o == 0) begin
              ml_o <= 999;
              sec_o <= sec_o - 1;
              end else begin
              ml_o <= ml_o - 1;
              end
          end
    end
    
                       
endmodule

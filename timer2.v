`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 07:15:08 PM
// Design Name: 
// Module Name: timer2
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


module timer2(
clk_i, reset_i, sec_o, min_o, hour_o
    );
    input clk_i, reset_i;
    // clk_i = 1Hz input
    output reg [5:0] sec_o = 0;
    output reg [5:0] min_o = 5;
    output reg [5:0] hour_o = 0;
    
        
    always @(posedge(clk_i) or posedge(reset_i)) begin
        // hour_o <= 0;
        if (reset_i) begin
            hour_o <= 0;
            sec_o <= 0;
            min_o <= 5;
        end else if (clk_i) begin
            sec_o <= sec_o - 1;
            if (sec_o == 0) begin
                sec_o <= 59;
                min_o <= min_o - 1;
                if (min_o == 0 && sec_o == 0) begin
                    min_o <= min_o;
                    sec_o <= sec_o;
                    hour_o <= hour_o;
                end
            end
        end
    end
                        
endmodule


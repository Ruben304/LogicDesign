`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 05:25:24 PM
// Design Name: 
// Module Name: digital_clk_24hr_ms_t
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


module digital_clk_24hr_ms(
    input clk_i, reset_i,
    input [5:0] Hourset,
    input [5:0] Minset,
    input [5:0] Secset,
    output reg [9:0] ms_o,
    output reg [5:0] sec_o,
    output reg [5:0] min_o,
    output reg [5:0] hour_o
    );
    
    always @ (posedge clk_i or negedge reset_i)
    begin 
      if (!reset_i)
            begin 
//                hour_o <= 0;
//                min_o <= 0;
//                sec_o <= 0;
//                ms_o <= 0;
                hour_o <= Hourset;
                min_o <= Minset;
                sec_o <= Secset;
                ms_o <= 0;
            end
       else if (clk_i == 1)
         begin
         ms_o <= ms_o + 1;
         if (ms_o == 999) begin
             ms_o <= 0;
             sec_o <= sec_o + 1;
             if (sec_o == 59)
                begin 
                    min_o <= min_o + 1;
                    sec_o <= 0;
                    if (min_o == 59)
                        begin 
                        hour_o <= hour_o + 1;
                            if(hour_o == 24)begin 
                                    hour_o <= 1;
                                    //min_o <= 0;
                                    end
                                    else begin 
                              //hour_o <= hour_o + 1;
                              min_o <= 0;
                              end
                            end
                   end
             end
        end
     end
endmodule

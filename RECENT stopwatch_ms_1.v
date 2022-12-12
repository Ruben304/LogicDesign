`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2022 06:32:18 PM
// Design Name: 
// Module Name: stopwatch_ms_1
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


module stopwatch_ms_1(
    input clk_i, reset_i, start_stop,
    input [4:0] Hourset,
    input [5:0] Minset,
    input [5:0] Secset,
    //input [9:0] Msset,
    output reg [5:0] sec_o,
    output reg [5:0] min_o,
    output reg [4:0] hour_o,
    output reg [9:0] ms_o //counting till 999
                 );
      reg var_1 = 0;
            
  always @ (posedge clk_i) begin 
       if (var_1 == 1) begin
             ms_o <= ms_o + 1;
                if (ms_o == 999) begin
                 ms_o <= 0;
                 sec_o <= sec_o + 1;
                if (sec_o == 59) begin //&& ms_o==999begin 
                    min_o <= min_o + 1;
                    sec_o <= 0;
                    if (min_o == 59) begin //&& ms_o==999 begin
                            hour_o <= hour_o + 1;
                            min_o <= 0;
                    end
                 end
                end
         end else begin
         if (start_stop) begin
            var_1 <= 1;
         end
       end
     end
             
always @ (negedge reset_i) begin
        if(!reset_i)
            begin 
            hour_o <= Hourset;
            min_o <= Minset;
            sec_o <= Secset;
            ms_o <=  0; 
                var_1 <= 0;
            end
end          
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2022 09:25:10 PM
// Design Name: 
// Module Name: timer5
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


module timer5(
clk_i, reset_i, start_i, left_i, right_i, up_i, down_i, sec_o, min_o, hour_o, digitp
    );
    input clk_i, start_i, reset_i, left_i, right_i, up_i, down_i;
    // clk_i = 1Hz input
    output reg [5:0] sec_o = 0;
    output reg [5:0] min_o = 5;
    output reg [5:0] hour_o = 0;
    output reg [2:0] digitp = 3;
    reg startct = 0;
    reg [5:0] startsec = 0;
    reg [5:0] startmin = 5;
    reg [5:0] starthour = 0;
        
    always @(posedge(clk_i) or posedge(reset_i) or posedge(start_i)) begin
        if (startct) begin
        if (reset_i) begin
            hour_o <= starthour;
            sec_o <= startsec;
            min_o <= startmin;
            startct <= 0;
        end else if (clk_i) begin
            sec_o <= sec_o - 1;
            if (sec_o == 0) begin
                sec_o <= 59;
                min_o <= min_o - 1;
                if (min_o == 0 && sec_o == 0) begin
                    min_o <= min_o;
                    sec_o <= sec_o;
                    hour_o <= hour_o;
                    startct <= 0;
                end
            end
        end
    end else begin
    
    if (start_i) begin
    startct <= 1;
    end
    
    end
    end
    
    always @(posedge(left_i) or posedge(right_i) or posedge(up_i) or posedge(down_i)) begin
    
    if (!startct) begin
    
    if (left_i) begin
     if (digitp != 0) begin
     digitp <= digitp - 1;
     end
    end
    
    if (right_i) begin
     if (digitp != 5) begin
     digitp <= digitp + 1;
     end
    end

    if (up_i) begin
     if (digitp == 0) begin
     starthour <= starthour + 10;
     hour_o <= hour_o + 10;
     end else if  (digitp == 1) begin
     starthour <= starthour + 1;
     hour_o <= hour_o + 1;
     end else if  (digitp == 2) begin
      if (startmin < 50) begin
      startmin <= startmin + 10;
      min_o <= min_o + 10;
      end else begin
      startmin <= startmin - 50;
      min_o <= min_o - 50;
      starthour <= starthour + 1;
      hour_o <= hour_o + 1;
      end
     end else if  (digitp == 3) begin
      if (startmin != 59) begin
      startmin <= startmin + 1;
      min_o <= min_o + 1;
      end else begin
      startmin <= 0;
      min_o <= 0;
      starthour <= starthour + 1;
      hour_o <= hour_o + 1;
      end
     end else if  (digitp == 4) begin
      if (startsec < 50) begin
      startsec <= startsec + 10;
      sec_o <= sec_o + 10;
      end else begin
      startsec <= startsec - 50;
      sec_o <= sec_o - 50;
      startmin <= startmin + 1;
      min_o <= min_o + 1;
      end
     end else if  (digitp == 5) begin
      if (startsec != 59) begin
      startsec <= startsec + 1;
      sec_o <= sec_o + 1;
      end else begin
      startsec <= 0;
      sec_o <= 0;
      startmin <= startmin + 1;
      min_o <= min_o + 1;
      end
     end
    end
    
    if (down_i) begin
     if (digitp == 0) begin
      if (starthour >= 10) begin
      starthour <= starthour - 10;
      hour_o <= hour_o - 10;
      end
     end else if  (digitp == 1) begin
      if (starthour >= 1) begin
      starthour <= starthour - 1;
      hour_o <= hour_o - 1;
      end
     end else if  (digitp == 2) begin
      if (startmin >= 10) begin
      startmin <= startmin - 10;
      min_o <= min_o - 10;
      end else if (starthour > 1) begin
      startmin <= startmin + 50;
      min_o <= min_o + 50;
      starthour <= starthour - 1;
      hour_o <= hour_o - 1;
      end
     end else if  (digitp == 3) begin
      if (startmin >= 1) begin
      startmin <= startmin - 1;
      min_o <= min_o - 1;
      end else if (starthour > 1) begin
      startmin <= 59;
      min_o <= 59;
      starthour <= starthour - 1;
      hour_o <= hour_o - 1;
      end
     end else if  (digitp == 4) begin
      if (startsec >= 10) begin
      startsec <= startsec - 10;
      sec_o <= sec_o - 10;
      end else if (startmin > 1) begin
      startsec <= startsec + 50;
      sec_o <= sec_o + 50;
      startmin <= startmin - 1;
      min_o <= min_o - 1;
      end else if (startmin == 0 && starthour > 1) begin
      startsec <= startsec + 50;
      sec_o <= sec_o + 50;
      startmin <= 59;
      min_o <= 59;
      starthour <= starthour - 1;
      hour_o <= hour_o - 1;
      end
     end else if  (digitp == 5) begin
      if (startsec >= 1) begin
      startsec <= startsec - 1;
      sec_o <= sec_o - 1;
      end else if (startmin > 1) begin
      startsec <= 59;
      sec_o <= 59;
      startmin <= startmin - 1;
      min_o <= min_o - 1;
      end else if (startmin == 0 && starthour > 1) begin
      startsec <= 59;
      sec_o <= 59;
      startmin <= 59;
      min_o <= 59;
      starthour <= starthour - 1;
      hour_o <= hour_o - 1;
      end
     end
    end
    
    end
    end
                        
endmodule

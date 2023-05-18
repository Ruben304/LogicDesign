`timescale 1s / 1ps
module testbench_stopwatch();

    reg clk_i, reset_i, start_stop, Timeset;
    reg [4:0] Hourset;
    reg [5:0] Minset;
    reg [5:0] Secset;

    wire [5:0] sec_o;
    wire [5:0] min_o;
    wire [4:0] hour_o;

    stopwatch SSF (.clk_i(clk_i), .reset_i(reset_i ), .sec_o(sec_o), .min_o( min_o), .hour_o( hour_o), .start_stop(start_stop), 
    .Timeset(Timeset), .Hourset(Hourset), .Minset(Minset),.Secset(Secset));
    
    initial begin
        clk_i=0;
        reset_i = 1;
        Timeset = 0;
        #5
        reset_i = 0;
        #5 
        Timeset = 1;
        Hourset=0;
        Minset=0;
        Secset=0; 
        #10 Timeset=0;
        start_stop = 1;     
        forever 
            begin
            #1 clk_i = ~clk_i;
            end
        end

endmodule

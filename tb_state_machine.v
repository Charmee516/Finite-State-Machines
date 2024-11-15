`timescale 1ns / 1ps

module sequence_detector_tb;

    reg clk;
    reg rst;
    reg [10:0] switches;

    wire [3:0] out;

    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .switches(switches),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    initial begin

        rst = 1;
        switches = 11'b0;

        #20;
        rst = 0;

        switches[10] = 1; 
        switches[9:0] = 10'b1010101010;
        #200; 

        $display("Test Case 1 Output: out = %d", out);

        switches[10] = 0;
        #50;

        switches[10] = 1;
        switches[9:0] = 10'b1100110011;
        #200;

        $display("Test Case 3 Output: out = %d", out);

        rst = 1;
        #20;
        rst = 0;
        #200;

        $display("Test Case 4 Output after reset: out = %d", out);

        $stop;
    end

    initial begin
        $monitor("Time=%0dns, rst=%b, switches=%b, out=%d", $time, rst, switches, out);
    end

endmodule

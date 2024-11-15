`timescale 1ns / 1ps
module Top_module(clk, rst, switches, seven_seg, seven_enable);
    input clk, rst; 
    input [10:0] switches; 
    output [6:0] seven_seg; 
    output [3:0] seven_enable; 

    wire [3:0] out_ss;
    wire out_clock;

    
    ClockDivider CD (
        .clk(clk),
        .clk_out(out_clock) 
    );

    sequence_detector sm (
        .clk(out_clock), 
        .rst(rst),
        .switches(switches),
        .out(out_ss)
    );

    seven_segment sev_seg(
        .in(out_ss),
        .seven_enable(seven_enable),
        .A(seven_seg[0]),
        .B(seven_seg[1]),
        .C(seven_seg[2]),
        .D(seven_seg[3]),
        .E(seven_seg[4]),
        .F(seven_seg[5]),
        .G(seven_seg[6])
    );
endmodule




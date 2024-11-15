`timescale 1ns / 1ps

module seven_segment_tb;

    reg [3:0] in;

    wire [3:0] seven_enable;
    wire A;
    wire B;
    wire C;
    wire D;
    wire E;
    wire F;
    wire G;

    seven_segment uut (
        .in(in),
        .seven_enable(seven_enable),
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .E(E),
        .F(F),
        .G(G)
    );

    initial begin
        $monitor("Time=%0dns, in=%d, segments={A=%b, B=%b, C=%b, D=%b, E=%b, F=%b, G=%b}, seven_enable=%b",
                 $time, in, A, B, C, D, E, F, G, seven_enable);

        in = 4'd0;
        #10;

        in = 4'd0;  #10;
        in = 4'd1;  #10;
        in = 4'd2;  #10;
        in = 4'd3;  #10;
        in = 4'd4;  #10;
        in = 4'd5;  #10;
        in = 4'd6;  #10;
        in = 4'd7;  #10;
        in = 4'd8;  #10;
        in = 4'd9;  #10;

        in = 4'd10; #10;
        in = 4'd15; #10;

        $stop;
    end

endmodule


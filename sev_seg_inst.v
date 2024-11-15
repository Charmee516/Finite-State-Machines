`timescale 1ns / 1ps

module seven_segment(
    input [3:0] in,               
    output reg [3:0] seven_enable, 
    output reg A,                 
    output reg B,
    output reg C,
    output reg D,
    output reg E,
    output reg F,
    output reg G
);

    reg [6:0] segments;

    always @(*) begin
        case (in)
            4'd0: segments = 7'b0000001; 
            4'd1: segments = 7'b1001111; 
            4'd2: segments = 7'b0010010; 
            4'd3: segments = 7'b0000110; 
            4'd4: segments = 7'b1001100;
            4'd5: segments = 7'b0100100; 
            4'd6: segments = 7'b0100000; 
            4'd7: segments = 7'b0001111; 
            4'd8: segments = 7'b0000000; 
            4'd9: segments = 7'b0000100; 
            default: segments = 7'b1111111;
        endcase
    end

    always @(*) begin
        {A, B, C, D, E, F, G} = segments;
    end

    always @(*) begin
        seven_enable = 4'b1110; 
    end

endmodule





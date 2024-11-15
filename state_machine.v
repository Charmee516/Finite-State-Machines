`timescale 1ns / 1ps

module sequence_detector(
    input wire clk,
    input wire rst,
    input wire [10:0] switches,
    output reg [3:0] out
);
    
    parameter STATE0 = 2'b00;
    parameter STATE1 = 2'b01;
    parameter STATE2 = 2'b10;
    parameter STATE3 = 2'b11;
    
    reg [1:0] state;
    reg [3:0] count_11;  
    reg [3:0] switch_index;  
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
           
            state <= STATE0;
            count_11 <= 4'd0;
            switch_index <= 4'd0;
            out <= 4'b0000;
        end
        else begin
            if (switches[10]) begin 
                if (switch_index == 4'd10) begin  
                    switch_index <= 4'd0;  
                    case (count_11)
                        4'd0: out <= 4'b0000;
                        4'd1: out <= 4'b0001;
                        4'd2: out <= 4'b0010;
                        4'd3: out <= 4'b0011;
                        default: out <= 4'b0100;
                    endcase
                    count_11 <= 4'd0;  
                end
                else begin
                    case(state)
                        STATE0: begin
                            state <= (switches[switch_index]) ? STATE1 : STATE0;
                        end
                        STATE1: begin
                            state <= (switches[switch_index]) ? STATE1 : STATE2;
                        end
                        STATE2: begin
                            state <= (switches[switch_index]) ? STATE3 : STATE0;
                            if (switches[switch_index]) begin  
                                count_11 <= count_11 + 4'd1;  
                            end
                        end
                        STATE3: begin
                            state <= (switches[switch_index]) ? STATE1 : STATE2;
                        end
                        default: state <= STATE0;
                    endcase
                    switch_index <= switch_index + 4'd1;  
                end
            end
            else begin  
                switch_index <= 4'd0;
                count_11 <= 4'd0;
            end
        end
    end
endmodule













`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 04:04:26 PM
// Design Name: 
// Module Name: clock_divider1
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




module clock_divider(
    input wire clk,        // Input clock signal (100 MHz)
    input wire rst,        // Reset signal
    output reg clk_out     // Output clock signal (1 Hz)
);

    reg [31:0] counter;    // 32-bit counter to divide the clock

    // Parameter to set the required count for 1Hz clock
    parameter DIVISOR = 50000000;  // 100MHz / 2 for 1Hz clock

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 0;      // Reset counter to 0
            clk_out <= 0;      // Reset output clock
        end
        else begin
            if (counter == DIVISOR - 1) begin
                counter <= 0;      // Reset the counter
                clk_out <= ~clk_out;  // Toggle the output clock
            end
            else begin
                counter <= counter + 1;  // Increment the counter
            end
        end
    end

endmodule

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2024 04:01:55 PM
// Design Name: 
// Module Name: tb_clock_divider
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



module tb_clock_divider;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire clk_out;

    // Instantiate the clock divider
    clock_divider uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Generate 100 MHz clock (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        rst = 0;

        // Apply reset
        #10 rst = 1;
        #10 rst = 0;

        // Run simulation for a long period to observe 1 Hz clock
        #1000000000;  // Simulate long enough to see the 1Hz output clock transition
        
        $stop;  // Stop the simulation
    end

endmodule





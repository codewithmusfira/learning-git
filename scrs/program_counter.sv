`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 03:15:59 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input logic clk,       // Clock
    input logic rst_n,     // Active-low synchronous reset
    input logic [31:0] D,         // Data input
    output logic [31:0] Q         // Data output
);

    // Synchronous D Flip-Flop
    always_ff @(posedge clk) begin
        if (!rst_n)
            Q <= 32'b0;    // Reset output to 0
        else
            Q <= D;       // Capture input on rising edge
    end


endmodule

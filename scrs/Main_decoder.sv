`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 02:22:04 PM
// Design Name: 
// Module Name: Main_decoder
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


module main_decoder(input logic [6:0]op,
output logic [1:0] ResultSrc,
output logic  MemWrite,
output logic  Branch,ALUSrc,
output logic   RegWrite,Jump,
output logic[1:0] ImmSrc,
output logic[1:0]  ALUOp);
logic [10:0] controls;
assign {RegWrite , ImmSrc , ALUSrc , MemWrite , ResultSrc, Branch , ALUOp , Jump}= controls;
always_comb
case(op)
7'b0000011: controls= 11'b1_00_1_0_01_0_00_0;
7'b0100011: controls= 11'b0_01_1_1_00_0_00_0;
7'b0110011: controls= 11'b1_xx_0_0_00_0_10_0;
7'b1100011: controls= 11'b0_10_0_0_00_1_01_0;
7'b0010011: controls= 11'b1_00_1_0_00_0_10_0;
7'b1101111: controls= 11'b1_11_0_0_10_0_00_1;
default: controls = 11'bx_xx_x_x_xx_x_xx_x;
endcase
endmodule

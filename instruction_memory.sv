`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/18/2025 10:54:01 AM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(input logic[31:0] a, 
output logic[31:0] rd);
logic[31:0] RAM[63:0];
initial
$readmemh("inst.mem",RAM);
assign rd=RAM[a[31:2]];

endmodule

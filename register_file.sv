`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 10:32:32 AM
// Design Name: 
// Module Name: register_file
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


module register_file(input logic clk,input logic we3,input logic[4:0] a1,a2,a3,input logic[31:0]wd3,output logic[31:0]rd1,rd2);
logic[31:0] rf[31:0];
always_ff@(posedge clk)
  if(we3) rf[a3]<=wd3;
assign rd1=(a1!=0)?rf[a1]:0;
assign rd2=(a1!=0)?rf[a2]:0;

endmodule

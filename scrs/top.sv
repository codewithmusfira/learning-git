`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/19/2025 03:24:04 PM
// Design Name: 
// Module Name: top
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


module top(input logic clk,reset
    );
    logic [31:0] PC,PCNext,PCTarget,PCPlus4,instr,result,srcA,srcB,immext,rd2,aluresult,rd;
    logic [1:0] immsrc,resultsrc;
    logic [2:0] alu_ctrl;
    logic PCSrc,regwrite,memwrite,jump,zero,alusrc;
    program_counter pc(
        .clk(clk),       // Clock
       .rst_n(reset),     // Active-low synchronous reset
        .D(PCNext),         // Data input
        .Q(PC)         // Data output
    );
    

adder PC_Plus4(.a(PC),.b(32'd4),.sum(PCPlus4)
    );
adder PC_Target(.a(PC),.b(immext),.sum(PCTarget)
        );  
        mux PC_Next(
             .I0(PCPlus4),.I1(PCTarget),
            .s(PCSrc),
            .y(PCNext)
                );  
   instruction_memory instr_mem(.a(PC),.rd(instr));
   register_file regfile(.clk(clk),.we3(regwrite),.a1(instr[19:15]),.a2(instr[24:20]),.a3(instr[11:7]),.wd3(result),.rd1(srcA),.rd2(rd2));
    extend extendunit(.instr(instr[31:7]),.immsrc(immsrc),
  .immext(immext));
   mux SRCB(
 .I0(rd2),.I1(immext),
  .s(alusrc),
.y(srcB));
     alu_8bit alu_result (
   .a(srcA),
 .b(srcB),
    .alu_ctrl( alu_ctrl),
   .result(aluresult),
   .zero(zero)
);
 Data_memory DM(.clk(clk) , .we(memwrite),.a(aluresult),.wd(rd2),.rd(rd));
   mux3to1 res(.d0(aluresult),.d1(rd),.d2(PCPlus4),
                 .s(resultsrc),
                .y(result));
controller CU(.op(instr[6:0]),
               .funct3(instr[14:12]),
                .funct7b5(instr[30]),
                .Zero(zero),
                .ResultSrc(resultsrc),
                .MemWrite(memwrite),
                .PCSrc(PCSrc),.ALUSrc(alusrc),
                 .RegWrite(regwrite),.Jump(jump),
                .ImmSrc(immsrc),
               .ALUControl(alu_ctrl));
endmodule  // 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



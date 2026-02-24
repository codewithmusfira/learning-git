`timescale 1ns / 1ps
module alu_8bit (
    input  logic [31:0]  a,
    input  logic [31:0]  b,
    input  logic [2:0]  alu_ctrl,
    output logic [31:0]  result,
    output logic        zero
);

    always_comb begin
        case (alu_ctrl)
            3'b000: result = a + b;      // ADD
            3'b001: result = a - b;      // SUB
            3'b010: result = a & b;      // AND
            3'b011: result = a | b;      // OR
            3'b100: result = a ^ b;      // XOR
            3'b101: result = ~a;         // NOT A
            3'b110: result = a << 1;     // Shift Left
            3'b111: result = a >> 1;     // Shift Right
            default: result = 32'b0;
        endcase
    end

    // Zero flag
    assign zero = (result == 32'b0);

endmodule

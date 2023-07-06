`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2021 02:38:58 PM
// Design Name: 
// Module Name: ALU_with_extra_OP
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


module ALU_with_extra_OP(
    input [15:0] A,
    input [15:0] B,
    input [2:0] ALUOp,
    output Zero,
    output CarryOut,
    output [15:0] Result,
    output [31:0] MulResult
    );
    wire [15:0]Ror_;
    wire [15:0]Slli_;
    wire[15:0] Sum;
Mul MULTIPLICATOR(A,B,MulResult);

ALU_16bit ALU(A,B,ALUOp[1:0],ALUOp[2],Zero,CarryOut,Sum);
ROR _ror(A,B,Ror_);
SLLI _slli(A,B,Slli_);

mux3ne1 MUX(Sum,Slli_,Ror_,ALUOp,Result);
endmodule
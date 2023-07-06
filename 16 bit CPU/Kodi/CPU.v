`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 06:10:31 PM
// Design Name: 
// Module Name: CPU
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


module CPU(input Clock);

reg[15:0] PC;
wire[15:0] Instruction;

wire RegDst, Branch, MemRead, MemWrite, MemToReg, ALUSrc, RegWrite, MulRegWrite;
wire[1:0] ALUOp;
wire[15:0] BEQPC;


initial
begin
assign PC = 16'd10;
end

InstructionMemory IM(PC, Instruction);

ControlUnit CU(Instruction[15:13], RegDst,
Branch,
RegWrite,
MemToReg,
MemRead,
MemWrite,
ALUSrc,
MulRegWrite,
ALUOp);

DataPath DP(Clock, PC, RegDst,
Branch,
MemRead,
MemWrite,
MemToReg,
ALUSrc,
RegWrite,
MulRegWrite,
ALUOp,
Instruction, BEQPC);

always@(posedge Clock)
begin
// assign PC = BEQPC; //BEQ 
if(PC[0] === 1'bx)
    begin
        PC = 16'd10;
    end
else
    begin
        PC = BEQPC + 16'd2;
    end
end
     
endmodule
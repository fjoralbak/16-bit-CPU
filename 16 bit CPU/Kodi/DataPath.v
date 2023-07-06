`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 05:54:10 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(
input Clock,
input[15:0] PC,
input RegDst,
input Branch,
input MemRead,
input MemWrite,
input MemToReg,
input ALUSrc,
input RegWrite,
input MulRegWrite,
input[1:0] ALUOp,
input[15:0] Instruction, output[15:0] BEQPC);

wire[2:0] opcode;
wire[2:0] RS;
wire[2:0] RT;
wire[2:0] RD;
wire[3:0] Funct;
wire[6:0] Immediate;
wire[15:0] Immediate16;
wire[2:0] percaktoDestinacionin;
wire[15:0] percaktoHyrjenB;
wire[15:0] ALUOut;
wire[31:0] MulResult;
wire[15:0] DMOut;
wire[15:0] WriteDataToRegister;
wire Zero, CarryOut;
wire[2:0] ALUControlOut;
wire[15:0] ReadRS;
wire[15:0] ReadRT;

wire PcCarryOut;

assign opcode = Instruction[15:13];
assign RS = Instruction[12:10];
assign RT = Instruction[9:7];
assign RD = Instruction[6:4];
assign Funct = Instruction[3:0];
assign Immediate = Instruction[6:0];

mux2ne1_3bit mDest(RT, RD, RegDst, percaktoDestinacionin);
mux2ne1_16bit mDalja(ALUOut, DMOut, MemToReg, WriteDataToRegister);

RegisterFile RF(RS, RT, percaktoDestinacionin, WriteDataToRegister, ReadRS, ReadRT, RegWrite, MulRegWrite, MulResult, Clock);

assign Immediate16 = {{9{Immediate[6]}}, Immediate[6:0]};

mux2ne1_16bit mALU(ReadRT, Immediate16, ALUSrc, percaktoHyrjenB);

ALUControl AC(ALUOp, Funct, ALUControlOut);

ALU_with_extra_OP ALU(ReadRS, percaktoHyrjenB, ALUControlOut[2:0], Zero, CarryOut, ALUOut, MulResult);

DataMemory DM(ALUOut, ReadRT, MemWrite, MemRead, Clock, DMOut);

// assign PC = PC + 16'd2;
// Adder_16bit pcAdder(PC, 16'd2, PC, PcCarryOut);

// assign JUMPPC = (Jump) ? {PC[31:28], Instruction[25:0], 2'b00} : PC;

wire [15:0] ImmediateShifted;
wire [15:0] ImmediateShiftedPlusPC;

assign ImmediateShifted = {Immediate16[14:0], 1'b0};

// assign ImmediateShiftedPlusPC = ImmediateShifted + PC;
Adder_16bit beqPlusPc(ImmediateShifted, PC, ImmediateShiftedPlusPC, PcCarryOut);

//  assign BEQPC = (Branch & Zero) ? ImmediateShiftedPlusPC : PC;
mux2ne1_16bit beqOrPc(PC, ImmediateShiftedPlusPC, Branch & Zero, BEQPC);

endmodule
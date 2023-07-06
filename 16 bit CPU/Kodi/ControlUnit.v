`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 03:53:46 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [2:0] OPCODE,
    output reg RegDst,
    output reg Branch,
    output reg RegWrite,
    output reg MemToReg,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg MulRegWrite,
    output reg [1:0] ALUOp
    );

always @(OPCODE)
begin
//R Format
case(OPCODE)
3'b111:
begin
assign RegDst = 1'b1;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
assign MulRegWrite = 1'b0;
end
//MUL
3'b010:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b10;
assign Branch = 1'b0;
assign MulRegWrite = 1'b1;
end
//ADDI
3'b100:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
assign MulRegWrite = 1'b0;
end
//SLLI
3'b101:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b1;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b11;
assign Branch = 1'b0;
assign MulRegWrite = 1'b0;
end
//LW
3'b000:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b1;
assign RegWrite = 1'b1;
assign MemRead = 1'b1;
assign MemWrite = 1'b0;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
assign MulRegWrite = 1'b0;
end
//SW
3'b001:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b1;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;
assign MemWrite = 1'b1;
assign ALUOp = 2'b00;
assign Branch = 1'b0;
assign MulRegWrite = 1'b0;
end
//BEQ
3'b011:
begin
assign RegDst = 1'b0;
assign ALUSrc = 1'b0;
assign MemToReg = 1'b0;
assign RegWrite = 1'b0;
assign MemRead = 1'b0;
assign MemWrite = 1'b0;
assign ALUOp = 2'b01;
assign Branch = 1'b1;
assign MulRegWrite = 1'b0;
end
endcase

end
endmodule
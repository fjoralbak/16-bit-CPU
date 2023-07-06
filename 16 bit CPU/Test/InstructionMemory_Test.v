`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 05:29:06 PM
// Design Name: 
// Module Name: InstructionMemory_Test
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


module InstructionMemory_Test();
reg[15:0] PC;
wire[15:0] Instruction;

initial
begin
#0 PC=16'd0;
end

InstructionMemory IM(PC, Instruction);
endmodule

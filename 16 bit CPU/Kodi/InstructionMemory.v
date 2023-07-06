`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 05:14:25 PM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(input[15:0] PC, output[15:0] Instruction);

reg[7:0] iMem[127:0];

initial $readmemh("instrMemory.mem", iMem);

assign Instruction = {iMem[PC], iMem[PC+1]};

endmodule

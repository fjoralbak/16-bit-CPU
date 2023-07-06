`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 02:58:56 PM
// Design Name: 
// Module Name: ALU_1bit
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

module ALU_1bit(
    input A,
    input B,
    input CIN,
    input BInvert,
    input [1:0] Operation,
    output Result,
    output COUT
    );

wire  JoB, mB, Dhe, Ose, Mbledhesi, XOR;

assign JoB = ~B;

mux2ne1 muxB(B, JoB, BInvert, mB);

assign Dhe = A & mB;
assign Ose = A | mB;
assign XOR = ~Dhe & Ose;
Mbledhesi_1bit Adder(A, mB, CIN, Mbledhesi, COUT);

mux4ne1 muxALU(Dhe, Ose, Mbledhesi, XOR, Operation, Result);
   
endmodule

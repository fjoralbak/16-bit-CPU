`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/30/2021 02:52:35 PM
// Design Name: 
// Module Name: mux4ne1
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


module mux3ne1(
    input[15:0]Hyrja0,
    input [15:0]Hyrja1,
    input [15:0]Hyrja2,
    input [2:0] S,
    output [15:0]Dalja
    );
    
    //S 000 H0 AND +
    //S 001 H1   OR +
    //S 011 H2   XOR +
    //S 010 H3   ADD +
    //S 110 H4   SUB +
    //S 100 H5   SLLI +
    //S 101 H6   ROR  +
    assign Dalja = S[2] ? (S[1] ? Hyrja0 : (S[0] ? Hyrja2 : Hyrja1)) : (Hyrja0);
endmodule
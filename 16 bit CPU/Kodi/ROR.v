`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2021 03:07:01 PM
// Design Name: 
// Module Name: ROR
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


module ROR(
    input[15:0] A,
    input[15:0] B,
    output reg[15:0]  ROR
    );
//Ja shtojm funksionalitetin masnej
reg [15:0] wire_to_beRORed;
reg temp ;
always @(A)
begin
wire_to_beRORed = A ;
temp = wire_to_beRORed[0];
wire_to_beRORed[0] = wire_to_beRORed[15];
wire_to_beRORed[15] = temp ;
ROR = wire_to_beRORed;
end
//wire[15:0] wire_to_beRORed;
//assign wire_to_beRORed = A;
//assign A[15]=A[0];
//wire temp; 
//assign temp = wire_to_beRORed[15];
//assign wire_to_beRORed[15] = wire_to_beRORed[0];
//assign wire_to_beRORed[0] = temp;

endmodule

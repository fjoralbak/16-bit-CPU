`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/07/2021 05:00:50 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
input[2:0] RS,
input[2:0] RT,
input[2:0] RD,
input[15:0] WriteData,
output [15:0] ReadRS,
output [15:0] ReadRT,
input RegWrite,
input MulRegWrite,
input[31:0] MulResult,
input Clock);


reg[15:0] Registers[7:0];
reg[31:0] MULREG;
integer i;

initial
begin
    for(i = 0; i < 8; i = i + 1) begin
       Registers[i] = 16'd0; 
    end
    MULREG = 32'd0;
end

always @ (posedge Clock)
begin
if(RegWrite) Registers[RD] <= WriteData;
end

assign ReadRS = Registers[RS];
assign ReadRT = Registers[RT];

endmodule

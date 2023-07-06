`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2021 12:16:05 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
input [15:0] Adresa,
input [15:0] WriteData,
input MemWrite,
input MemRead,
input Clock,
output reg[15:0] ReadData
);
reg [7:0] singleAdresses[127:0];
initial $readmemh("dataMemory.mem", singleAdresses);

always @(posedge Clock)
begin
    if(MemWrite) 
    begin
        singleAdresses[Adresa] <= WriteData[15:8];
        singleAdresses[Adresa+1] <= WriteData[7:0];
    end
    ReadData = {singleAdresses[Adresa],singleAdresses[Adresa+1]};
end

always @(negedge Clock)
begin
    if(MemWrite)
        $writememh("dataMemory.mem", singleAdresses);
end

endmodule



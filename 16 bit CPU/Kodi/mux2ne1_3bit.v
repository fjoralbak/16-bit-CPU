`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.05.2021 16:47:45
// Design Name: 
// Module Name: mux2ne1_3bit
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


module mux2ne1_3bit(
    input[2:0] Hyrja0,
    input[2:0] Hyrja1,
    input S,
    output[2:0] Dalja
    );
    
assign Dalja = S ? Hyrja1 : Hyrja0;

endmodule

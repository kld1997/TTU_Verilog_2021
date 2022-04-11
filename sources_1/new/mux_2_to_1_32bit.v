`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 01:22:12 AM
// Design Name: 
// Module Name: mux_2_to_1_32bit
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


module mux_2_to_1_32bit(
    input [31:0] r0,
    input [31:0] r1,
    input select,
    output [31:0] operand
    );
    
     assign operand = select ? r1 : r0;
     
endmodule

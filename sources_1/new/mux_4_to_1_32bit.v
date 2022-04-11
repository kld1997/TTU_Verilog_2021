`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 01:24:25 AM
// Design Name: 
// Module Name: mux_4_to_1_32bit
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


module mux_4_to_1_32bit(
    input [31:0] r0,
    input [31:0] r1,
    input [31:0] r2,
    input [31:0] r3,
    input [1:0] select,
    output [31:0] operand
    );
    
     assign operand = (select[1] & select[0]) ? r3 : 
                      (select[1] & !select[0]) ? r2 :
                      (!select[1] & select[0]) ? r1 : r0;
     
endmodule

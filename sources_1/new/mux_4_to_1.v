`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 11:14:26 AM
// Design Name: 
// Module Name: mux_4_to_1
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


module mux_4_to_1(
    input [7:0] r0,
    input [7:0] r1,
    input [7:0] r2,
    input [7:0] r3,
    input [1:0] select,
    output reg [7:0] operand
    );
    
    always @ (*) begin
        case (select)
            0: operand <= r0;
            1: operand <= r1;
            2: operand <= r2;
            3: operand <= r3;
        endcase
     end   
endmodule

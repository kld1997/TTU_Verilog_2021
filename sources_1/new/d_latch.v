`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2021 12:12:10 PM
// Design Name: 
// Module Name: d_latch
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


module d_latch(
    input D,
    input clk,
    input reset,
    output reg Q
    );
    
    initial begin Q = 0; end
    
    always @ (posedge clk) begin
        if(reset)
            Q <= 0;
        else
            Q <= D;
    end   
endmodule

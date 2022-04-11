`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 09:48:47 AM
// Design Name: 
// Module Name: input_edges
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


module input_edges(
    input clk,
    input reset,
    input signal,
    output reg in_changed
    );
    
    reg old_signal = 0;
    
    always@(posedge clk) begin
        if(reset)
            old_signal <= 0;
        else
            old_signal <= signal;
    end
    
    always@(*) begin
        if((old_signal == 0) & signal)
            in_changed = 1;
        else
            in_changed = 0;
    end
endmodule

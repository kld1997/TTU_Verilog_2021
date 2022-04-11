`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 04:19:45 AM
// Design Name: 
// Module Name: synchronize_inputs
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


module synchronize_inputs(
    input clk,
    input reset,
    input async_signal,
    output sync
    );
    
    reg old_signal = 0;
    reg old_old_signal = 0;
    
    assign sync = old_old_signal;
    
    always@(posedge clk) begin
        if(reset) begin
            old_signal <= 0;
            old_old_signal <= 0;
        end
        else begin
            old_signal <= async_signal;
            old_old_signal <= old_signal;
        end
    end
endmodule

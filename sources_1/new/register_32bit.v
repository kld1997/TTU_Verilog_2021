`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 04:46:23 AM
// Design Name: 
// Module Name: register_32bit
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


module register_32bit(
    input clk,
    input reset,
    input write_enable,
    input [31:0] in_data,
    output reg [31:0] out_data
    );
    
    initial begin
        out_data = 0;
    end
    
    always @ (posedge clk) begin
        if(reset)
            out_data <= 0;
        else begin
            if(write_enable)
                out_data <= in_data;
        end
    end              
endmodule

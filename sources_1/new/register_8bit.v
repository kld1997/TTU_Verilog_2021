`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 12:48:55 PM
// Design Name: 
// Module Name: register_8bit
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


module register_8bit(
    input clk,
    input reset,
    input load_enable,
    input [7:0] in_data,
    output reg [7:0] out_data
    );
    
    initial begin
        out_data = 0;
    end
    
    always @ (posedge clk) begin
        if(reset)
            out_data <= 0;
        else begin
            if(load_enable)
                out_data <= in_data;
        end
    end              
endmodule

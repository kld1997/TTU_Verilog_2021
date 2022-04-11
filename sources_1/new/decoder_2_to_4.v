`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 12:08:50 PM
// Design Name: 
// Module Name: decoder_2_to_4
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


module decoder_2_to_4(
    input [1:0] dest_reg,
    output reg [3:0] load
    );
    
    always @ (*)  begin
        case (dest_reg)
            0: load <= 1;
            1: load <= 2;
            2: load <= 4;
            3: load <= 8;
        endcase
    end
endmodule

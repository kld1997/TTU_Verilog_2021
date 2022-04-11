`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 06:00:47 AM
// Design Name: 
// Module Name: MIPS_constant_unit
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


module MIPS_constant_unit(
    input const_sign,
    input [14:0] const,
    output reg [31:0] const_out
    );
    
    always @ (*) begin
        if (const_sign & const[14])
            const_out = {{17{1'b1}}, const};
        else
            const_out = {17'b0, const};
        end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2021 02:51:55 AM
// Design Name: 
// Module Name: MIPS_cpu_tb
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


module MIPS_cpu_tb;

    reg clock, reset;
    
    MIPS_cpu cpu(.clock(clock), .reset(reset));
    
    initial begin
        clock = 0;
        reset = 1;
        #20;
        reset = 0;
        #20000;
    end
    
    always
        #5 clock = ~clock;

endmodule

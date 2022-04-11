`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2021 03:00:59 PM
// Design Name: 
// Module Name: mealy_machine_hw1_tb
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


module mealy_machine_hw1_tb;
        
    reg clock, reset, control;
    wire out;
    
    mealy_machine_hw1 uut(
        .clk(clock),
        .reset(reset),
        .control(control),
        .out(out)
    );
        
    initial begin
        clock = 0;
        reset = 1;
        control = 0;
        #100
        
        reset = 0;
        #20
        
        control = 1;
        #40
        
        control = 0;
        #20
        
        control = 1;
        #10
        
        control = 0;
        #20
        
        control = 1;
        #20
        
        reset = 1;
        #20
        
        reset = 0;
        #20
        
        control = 0;
    end
    
    always
        #5 clock = ~clock;
        
endmodule

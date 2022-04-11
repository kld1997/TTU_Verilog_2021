`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2021 06:10:08 PM
// Design Name: 
// Module Name: mealy_machine_hw1Switch_tb
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


module mealy_machine_hw1Switch_tb;

reg clock, reset, control;
    wire out;
    
    mealy_machine_hw1Switch uut(
        .clock(clock),
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

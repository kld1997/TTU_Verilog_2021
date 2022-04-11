`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2021 05:49:43 PM
// Design Name: 
// Module Name: mealy_machine_hw1Switch
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


module mealy_machine_hw1Switch(
        input clock,
        input reset,
        input control,
        output reg out
    );
    
    reg [1:0] state = 0;
    
    initial begin
        out = 0;
    end
    
    always @ (posedge clock) begin
        if(reset)
            {state, out} <= 0;
        else
            begin
                case (state)
                    0: if(control)      {state, out} <= {2'b01, 1'b1};
                        else            {state, out} <= {2'b00, 1'b0};
                    1: if(control)      {state, out} <= {2'b01, 1'b0};
                        else            {state, out} <= {2'b10, 1'b0};
                    2: if(control)      {state, out} <= {2'b11, 1'b1};
                        else            {state, out} <= {2'b10, 1'b0};
                    3: if(control)      {state, out} <= {2'b00, 1'b0};
                        else            {state, out} <= {2'b11, 1'b0};
                endcase
            end
    end
    
endmodule

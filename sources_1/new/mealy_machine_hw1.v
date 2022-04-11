`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/29/2021 12:08:34 PM
// Design Name: 
// Module Name: mealy_machine_hw1
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


module mealy_machine_hw1(
    input clk,
    input reset,
    input control,
    output out
    );
    
    wire D1_in, D0_in, D1_out, D0_out;
    reg ctrl;
    
    d_latch latch_1(D1_in, clk, reset, D1_out),
            latch_0(D0_in, clk, reset, D0_out);
    
    always @ (posedge clk) begin
        if(reset)
            ctrl <= 0;
        else
            ctrl <= control;
    end
    
    assign D1_in = D0_out & ~ctrl;
    assign D0_in = (D1_out & D0_out & ~ctrl) | out | (~D1_out & ctrl);
    assign out = ~D0_out & ctrl;
    
endmodule

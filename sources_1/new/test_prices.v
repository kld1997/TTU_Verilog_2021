`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2021 09:44:07 AM
// Design Name: 
// Module Name: test_prices
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


module test_prices(
    input clock,
    input [4:0] pressed_button,
    output reg [3:0] out1,
    output reg [3:0] out2,
    output reg [3:0] out3,
    output reg rdy
    );
    
    reg state = 0;
    
    initial begin
        out1 = 0;
        out2 = 0;
        out3 = 0;
        rdy = 0;
    end
    
    always@(posedge clock) begin
        case(state)
            0:
            if(pressed_button[4] & (pressed_button[3:0] == 4'b1111))
                {out1, out2, out3} <= 0;
            else begin
                if(pressed_button[4] & (out1 == 0))
                    out1 <= pressed_button[3:0];
                else if(pressed_button[4] & (out2 == 0))
                    out2 <= pressed_button[3:0];
                else if(pressed_button[4] & (out3 == 0)) begin
                    out3 <= pressed_button[3:0];
                    state <= 1;
                    rdy <= 1;
                end
            end
            1:
                {out1, out2, out3, state, rdy} <= 0;
        endcase
    end
endmodule

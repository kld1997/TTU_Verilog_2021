`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2021 09:30:46 PM
// Design Name: 
// Module Name: vend_machine_keypad
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


module vend_machine_keypad(
    input clk,
    input reset,
    input busy,
    input clear,
    input [4:0] pressed_button,
    output reg check_price,
    output reg [11:0] concat_press
    );
    
    reg [1:0] keypad_state;
    
    initial begin
        concat_press = 12'b0;
        check_price = 0;
    end
    
    always@(posedge clk) begin
        if((pressed_button[4] & (pressed_button[3:0] == 4'b1111)) | reset | clear) begin
                concat_press <= 0;
                keypad_state <= 0;
                check_price <= 0;
        end
        else begin
            case(keypad_state)
                0:  if(pressed_button[4] & !busy) begin
                        concat_press[3:0] <= pressed_button[3:0];
                        keypad_state <= 2'b1;
                    end
                1:  if(pressed_button[4]) begin
                        concat_press[7:4] <= pressed_button[3:0];
                        keypad_state <= 2'b10;
                    end
                2:  if(pressed_button[4]) begin
                        concat_press[11:8] <= pressed_button[3:0];
                        keypad_state <= 2'b11;
                        check_price <= 1;
                    end
                3:  begin
                        keypad_state <= 0;
                        check_price <= 0;
                        concat_press <= 0;
                    end
            endcase  
        end
    end
    
endmodule

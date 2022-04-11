`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 04:15:38 AM
// Design Name: 
// Module Name: vend_machine_controller
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


module vend_machine_controller(
    input clk,
    input reset,
    input return_all,
    input dispenser_done_signal,
    input keypad_ready_signal,
    input [11:0] valid_input,
    input [39:0] inventory_signal,
    input [7:0] coin,
    output [39:0] curr_inv,
    output [9:0] view_price,
    output reg [9:0] change,
    output reg [9:0] total,
    output reg keypad_wait,
    output reg clear_keypad,
    output reg dispenser_go,
    output reg [6:0] overflow,
    output reg [8:0] vend
    );
    
    reg [1:0] controller_state = 0;
    reg [11:0] keypad_input = 0;
    reg return_reg = 0;
    wire [10:0] price;
        
    prices lookup_price(.in1(keypad_input[11:8]), .in2(keypad_input[7:4]),
                        .in3(keypad_input[3:0]), .inventory(inventory_signal),
                        .snack_price(price), .curr_inv(curr_inv));
    
    assign view_price = price[9:0];
    
    always@(*) begin
        if(coin[7] | return_all)
            clear_keypad = 1;
    end
    
    always@(posedge clk) begin
        if(reset) begin
            {controller_state, keypad_input, keypad_wait, change,
             total, dispenser_go, clear_keypad, overflow, vend} <= 0;
        end
        else begin
            overflow <= 0;
            if(controller_state != 0)
                overflow <= coin[6:0];
            else if(return_all & (total > 0) & !keypad_ready_signal) begin
                overflow <= coin[6:0];
                keypad_input <= 0;
                return_reg <= 1;
                clear_keypad <= 0;
                controller_state <= 1;
                change <= total;
                keypad_wait <= 1;
            end
                
            case(controller_state)
                0:  if(coin[7] & !keypad_ready_signal) begin
                        if((total >= 10'd1000) | return_all)
                            overflow <= coin[6:0];
                        else begin
                            total <= (total + coin[6:0]);
                            overflow <= 0;
                        end
                        clear_keypad <= 0;
                    end
                    else if(keypad_ready_signal) begin
                            keypad_input <= {valid_input[3:0], valid_input[7:4], valid_input[11:8]};
                            controller_state <= 1;
                            keypad_wait <= 1;
                            overflow <= coin[6:0];
                            clear_keypad <= 0;
                    end
                1:  if(return_reg) begin
                            dispenser_go <= 1;
                            controller_state <= 2;
                    end
                    else if((total >= price[9:0]) & price[10]) begin
                        change <= total[9:0] - price[9:0];
                        dispenser_go <= 1;
                        controller_state <= 2;
                        vend <= keypad_input[8:0];
                    end
                    else begin
                        keypad_wait <= 0;
                        controller_state <= 0;
                        keypad_input <= 0;
                    end
                2: controller_state <= 3;    
                3:  begin
                        dispenser_go <= 0;
                        if(dispenser_done_signal)
                            {controller_state, keypad_wait, keypad_input,
                             vend, change, total, clear_keypad, return_reg} <= 0;
                    end
            endcase
        end
    end
    
endmodule

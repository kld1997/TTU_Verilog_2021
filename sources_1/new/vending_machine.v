`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 04:39:05 AM
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk,
    input reset,
    input low_nickels,
    input [4:0] coin_signal,
    input [39:0] inventory_signal,
    input [7:0] coin,
    input [4:0] button_press,
    input return_money,    
    output [9:0] cost,
    output [6:0] change,
    output [6:0] overflow,
    output [9:0] total,
    output [8:0] vend,
    output exact_change_only,
    output [39:0] current_inv
    );
   
    wire [7:0] synchronized_coin;
    wire [4:0] synchronized_button;
    wire [10:0] big_cost;
    wire dispense_done, keypad_ready, keypad_wait, keypad_clear, dispense_go;
    wire [11:0] keypad_to_controller_data;
    wire [9:0] total_change;
   
    
    synchronize_inputs coin_input[7:0](.clk(clk), .reset(reset), .async_signal(coin), .sync(synchronized_coin)),
                       button_input[4:0](.clk(clk), .reset(reset), .async_signal(button_press), .sync(synchronized_button));
                       
    vend_machine_controller     controller(.clk(clk), .reset(reset), .return_all(return_money), .dispenser_done_signal(dispense_done),
                                           .keypad_ready_signal(keypad_ready), .valid_input(keypad_to_controller_data), .inventory_signal(inventory_signal),
                                           .coin(synchronized_coin), .view_price(cost), .change(total_change), .total(total), .keypad_wait(keypad_wait), .clear_keypad(keypad_clear),
                                           .dispenser_go(dispense_go), .overflow(overflow), .vend(vend), .curr_inv(current_inv));
                       
    vend_machine_keypad         keypad(.clk(clk), .reset(reset), .busy(keypad_wait), .clear(keypad_clear), .pressed_button(synchronized_button),
                                       .check_price(keypad_ready), .concat_press(keypad_to_controller_data));
    
    change_dispenser            dispenser(.clk(clk), .reset(reset), .change(total_change), .avail_coins(coin_signal), .low_nickels(low_nickels),
                                          .go_signal(dispense_go), .done(dispense_done), .change_dispensed(change), .exact_change_only(exact_change_only));
    
endmodule

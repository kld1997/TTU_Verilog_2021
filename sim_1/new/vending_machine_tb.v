`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 04:39:42 AM
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb;

   `include "vending_machine.vh"
    reg clock, reset, low_nickels, return_money;
    wire exact_change_only;
    reg [4:0] coin_signal, button_press;
    reg [39:0] inventory_signal;
    reg [7:0] coin;
    
    wire [9:0] cost, total;
    wire [6:0] change, overflow;
    wire [8:0] vend;
    wire [6:0] coin_insert;
    wire [3:0] bp;
    wire [39:0] current_inventory;
    
    assign bp = button_press[3:0];
    assign coin_insert = coin[6:0];
    
    
    vending_machine     uut(.clk(clock), .reset(reset), .low_nickels(low_nickels), .coin_signal(coin_signal),
                            .inventory_signal(inventory_signal), .coin(coin), .button_press(button_press),
                            .return_money(return_money), .cost(cost), .change(change), .overflow(overflow),
                            .total(total), .vend(vend), .exact_change_only(exact_change_only), .current_inv(current_inventory));

    
    initial begin
        clock = 0;
        reset = 1;
        low_nickels = 0;
        return_money = 0;
        coin_signal = 31;
        button_press = 0;
        inventory_signal = {40{1'b1}};
        coin = 0;
        #20;
        reset = 0;
        
        button_press = PRESS_ONE;
        #10;
        button_press = PRESS_ZERO;
        #10;
        button_press = PRESS_ZERO;
        #10;
        button_press = PRESS_NOTHING;
        #50;
        button_press = PRESS_ONE;
        #10;
        button_press = PRESS_SIX;
        #10;
        button_press = PRESS_TWO;
        #10;
        button_press = PRESS_NOTHING;
        #50;
        
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_NOTHING;
        button_press = PRESS_NINE;
        #10;
        coin = INSERT_DIME;
        button_press = PRESS_NOTHING;
        #10;
        coin = INSERT_NOTHING;
        button_press = PRESS_ONE;
        #10;
        button_press = PRESS_THREE;
        #10;
        button_press = PRESS_ZERO;
        #10;
        button_press = PRESS_NOTHING;
        #100;
        
        inventory_signal[0] = 0;
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_QUARTER;
        #10;
        coin = INSERT_NOTHING;
        button_press = PRESS_ONE;
        #10;
        button_press = PRESS_ZERO;
        #10;
        button_press = PRESS_ZERO;
        #10;
        button_press = PRESS_NOTHING;
        #60;
        return_money = 1;
        coin_signal = 5'b00101;
        #10;
        return_money = 0;
        #60
        low_nickels = 1;
        #50;
        coin_signal = 5'b00001;
        #10;
        
        
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_DOLLAR;
        #10;
        coin = INSERT_NOTHING;
        button_press = PRESS_ONE;
        #10;
        button_press = PRESS_FIVE;
        #10;
        button_press = PRESS_TWO;
        #10;
        button_press = PRESS_NOTHING;
        coin = INSERT_DIME;
        #10;
        coin = INSERT_NOTHING;
        #60;
        coin_signal = 5'b0;
        #40;
        
        
        
        
    end


    always begin
        #5 clock = ~clock;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2021 04:07:47 PM
// Design Name: 
// Module Name: change_dispenser
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


module change_dispenser(
    input clk,
    input reset,
    input [9:0] change,
    input [4:0] avail_coins,
    input low_nickels,
    input go_signal,
    output reg done,
    output reg [6:0] change_dispensed,
    output reg exact_change_only
    );
    
    reg dispenser_state;
    reg [9:0] current_change;
    
    
    always@(posedge clk) begin
        if(reset) begin
            done <= 1;
            dispenser_state <= 0;
            current_change <= 0;
            exact_change_only <= 0;
            change_dispensed <= 0;
        end
        else begin
            case(dispenser_state)
                0:  if(go_signal) begin
                        dispenser_state <= 1;
                        done <= 0;
                        current_change <= change;
                    end
                1:  if(avail_coins[4] && (current_change >= 10'd100)) begin
                        change_dispensed <= 100;
                        current_change <= (current_change - 100);
                    end
                    else if(avail_coins[3] && (current_change >= 10'd50)) begin
                        change_dispensed <= 50;
                        current_change <= (current_change - 50);
                    end
                    else if(avail_coins[2] && (current_change >= 10'd25)) begin
                        change_dispensed <= 25;
                        current_change <= (current_change - 25);
                    end
                    else if(avail_coins[1] && (current_change >= 10'd10)) begin
                        change_dispensed <= 10;
                        current_change <= (current_change - 10);
                    end
                    else if(avail_coins[0] && (current_change >= 10'd5)) begin
                        change_dispensed <= 5;
                        current_change <= (current_change - 5);
                    end
                    else begin
                        if(low_nickels)
                            exact_change_only <= 1;
                        else
                            exact_change_only <= 0;   
                        change_dispensed <= 0;
                        current_change <= 0;
                        dispenser_state <= 0;
                        done <= 1;
                    end
            endcase
        end
    end
endmodule

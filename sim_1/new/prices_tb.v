`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 07:48:02 PM
// Design Name: 
// Module Name: prices_tb
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

module prices_tb;

    reg clock;
    reg [4:0] pressed_button;
    reg [39:0] inv;
    integer counter0 = 0, counter1 = 0, counter2 = 0, counter3 = 0;
    wire [10:0] out;
    
    doodoo uut(.clock(clock), .pressed_but(pressed_button), .inventory(inv), .snack_p(out));
    
    
    initial begin
        clock = 0;
        inv = {40{1'b1}};
        pressed_button = 5'b11111;
        #20;
        
        for(counter0 = 0; counter0 < 10; counter0 = counter0 + 1) begin
            for(counter1 = 0; counter1 < 10; counter1 = counter1 + 1) begin
                for(counter2 = 0; counter2 < 10; counter2 = counter2 + 1) begin
                    for(counter3 = 0; counter3 < 3; counter3 = counter3 + 1) begin
                        case(counter3)
                            0: pressed_button = {1'b1, counter0[3:0]};
                            1: pressed_button = {1'b1, counter1[3:0]};
                            2: pressed_button = {1'b1, counter2[3:0]};
                        endcase
                        #10;
                        if(counter3 == 2)
                            #10;
                    end
                end
            end
        end
        
    end
    
    always begin
        #5 clock = ~clock;
    end
endmodule

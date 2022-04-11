`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2021 01:38:44 AM
// Design Name: 
// Module Name: prices
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


module prices(
    input [3:0] in1,
    input [3:0] in2,
    input [3:0] in3,
    input [39:0] inventory,
    output reg [10:0] snack_price,
    output [39:0] curr_inv
    );
    
    reg [10:0] snacks[9:0][9:0][9:0];
    
    always@(*) begin
        snacks[1][0][0] = {inventory[0], 10'd100};
        snacks[1][0][2] = {inventory[1], 10'd100};
        snacks[1][0][4] = {inventory[2], 10'd100};
        snacks[1][0][6] = {inventory[3], 10'd100};
        snacks[1][0][8] = {inventory[4], 10'd100};
        snacks[1][1][0] = {inventory[5], 10'd100};
        snacks[1][1][2] = {inventory[6], 10'd100};
        snacks[1][1][4] = {inventory[7], 10'd100};
        snacks[1][1][6] = {inventory[8], 10'd100};
        snacks[1][1][8] = {inventory[9], 10'd100};
        snacks[1][2][0] = {inventory[10], 10'd100};
        snacks[1][2][2] = {inventory[11], 10'd100};
        snacks[1][2][4] = {inventory[12], 10'd100};
        snacks[1][2][6] = {inventory[13], 10'd100};
        snacks[1][2][8] = {inventory[14], 10'd100};
        snacks[1][3][0] = {inventory[15], 10'd125};
        snacks[1][3][2] = {inventory[16], 10'd125};
        snacks[1][3][4] = {inventory[17], 10'd200};
        snacks[1][3][6] = {inventory[18], 10'd200};
        snacks[1][3][8] = {inventory[19], 10'd200};
        snacks[1][4][0] = {inventory[20], 10'd100};
        snacks[1][4][1] = {inventory[21], 10'd100};
        snacks[1][4][2] = {inventory[22], 10'd100};
        snacks[1][4][3] = {inventory[23], 10'd100};
        snacks[1][4][4] = {inventory[24], 10'd100};
        snacks[1][4][5] = {inventory[25], 10'd100};
        snacks[1][4][6] = {inventory[26], 10'd100};
        snacks[1][4][7] = {inventory[27], 10'd100};
        snacks[1][4][8] = {inventory[28], 10'd100};
        snacks[1][4][9] = {inventory[29], 10'd100};
        snacks[1][5][0] = {inventory[30], 10'd125};
        snacks[1][5][2] = {inventory[31], 10'd125};
        snacks[1][5][4] = {inventory[32], 10'd150};
        snacks[1][5][6] = {inventory[33], 10'd150};
        snacks[1][5][8] = {inventory[34], 10'd150};
        snacks[1][6][0] = {inventory[35], 10'd50};
        snacks[1][6][1] = {inventory[36], 10'd50};
        snacks[1][6][2] = {inventory[37], 10'd75};
        snacks[1][6][3] = {inventory[38], 10'd60};
        snacks[1][6][4] = {inventory[39], 10'd25};
    end
  
    assign cur_inv = {snacks[1][6][4][10], snacks[1][6][3][10], snacks[1][6][2][10], snacks[1][6][1][10],
                      snacks[1][6][0][10], snacks[1][5][8][10], snacks[1][5][6][10], snacks[1][5][4][10],
                      snacks[1][5][2][10], snacks[1][5][0][10], snacks[1][4][9][10], snacks[1][4][8][10],
                      snacks[1][4][7][10], snacks[1][4][6][10], snacks[1][4][5][10], snacks[1][4][4][10],
                      snacks[1][4][3][10], snacks[1][4][2][10], snacks[1][4][1][10], snacks[1][4][0][10],
                      snacks[1][3][8][10], snacks[1][3][6][10], snacks[1][3][4][10], snacks[1][3][2][10],
                      snacks[1][3][0][10], snacks[1][2][8][10], snacks[1][2][6][10], snacks[1][2][4][10],
                      snacks[1][2][2][10], snacks[1][2][0][10], snacks[1][1][8][10], snacks[1][1][6][10],
                      snacks[1][1][4][10], snacks[1][1][2][10], snacks[1][1][0][10], snacks[1][0][8][10],
                      snacks[1][0][6][10], snacks[1][0][4][10], snacks[1][0][2][10], snacks[1][0][0][10]};
  
  
  /*  
    initial begin
        snacks[1][0][0] = 10'd100;
        snacks[1][0][2] = 10'd100;
        snacks[1][0][4] = 10'd100;
        snacks[1][0][6] = 10'd100;
        snacks[1][0][8] = 10'd100;
        snacks[1][1][0] = 10'd100;
        snacks[1][1][2] = 10'd100;
        snacks[1][1][4] = 10'd100;
        snacks[1][1][6] = 10'd100;
        snacks[1][1][8] = 10'd100;
        snacks[1][2][0] = 10'd100;
        snacks[1][2][2] = 10'd100;
        snacks[1][2][4] = 10'd100;
        snacks[1][2][6] = 10'd100;
        snacks[1][2][8] = 10'd100;
        snacks[1][3][0] = 10'd125;
        snacks[1][3][2] = 10'd125;
        snacks[1][3][4] = 10'd200;
        snacks[1][3][6] = 10'd200;
        snacks[1][3][8] = 10'd200;
        snacks[1][4][0] = 10'd100;
        snacks[1][4][1] = 10'd100;
        snacks[1][4][2] = 10'd100;
        snacks[1][4][3] = 10'd100;
        snacks[1][4][4] = 10'd100;
        snacks[1][4][5] = 10'd100;
        snacks[1][4][6] = 10'd100;
        snacks[1][4][7] = 10'd100;
        snacks[1][4][8] = 10'd100;
        snacks[1][4][9] = 10'd100;
        snacks[1][5][0] = 10'd125;
        snacks[1][5][2] = 10'd125;
        snacks[1][5][4] = 10'd150;
        snacks[1][5][6] = 10'd150;
        snacks[1][5][8] = 10'd150;
        snacks[1][6][0] = 10'd50;
        snacks[1][6][1] = 10'd50;
        snacks[1][6][2] = 10'd75;
        snacks[1][6][3] = 10'd60;
        snacks[1][6][4] = 10'd25;
    end
    
    always@(*) begin
        internal_inv[1][0][0] = inventory[0];
        internal_inv[1][0][2] = inventory[1];
        internal_inv[1][0][4] = inventory[2];
        internal_inv[1][0][6] = inventory[3];
        internal_inv[1][0][8] = inventory[4];
        internal_inv[1][1][0] = inventory[5];
        internal_inv[1][1][2] = inventory[6];
        internal_inv[1][1][4] = inventory[7];
        internal_inv[1][1][6] = inventory[8];
        internal_inv[1][1][8] = inventory[9];
        internal_inv[1][2][0] = inventory[10];
        internal_inv[1][2][2] = inventory[11];
        internal_inv[1][2][4] = inventory[12];
        internal_inv[1][2][6] = inventory[13];
        internal_inv[1][2][8] = inventory[14];
        internal_inv[1][3][0] = inventory[15];
        internal_inv[1][3][2] = inventory[16];
        internal_inv[1][3][4] = inventory[17];
        internal_inv[1][3][6] = inventory[18];
        internal_inv[1][3][8] = inventory[19];
        internal_inv[1][4][0] = inventory[20];
        internal_inv[1][4][1] = inventory[21];
        internal_inv[1][4][2] = inventory[22];
        internal_inv[1][4][3] = inventory[23];
        internal_inv[1][4][4] = inventory[24];
        internal_inv[1][4][5] = inventory[25];
        internal_inv[1][4][6] = inventory[26];
        internal_inv[1][4][7] = inventory[27];
        internal_inv[1][4][8] = inventory[28];
        internal_inv[1][4][9] = inventory[29];
        internal_inv[1][5][0] = inventory[30];
        internal_inv[1][5][2] = inventory[31];
        internal_inv[1][5][4] = inventory[32];
        internal_inv[1][5][6] = inventory[33];
        internal_inv[1][5][8] = inventory[34];
        internal_inv[1][6][0] = inventory[35];
        internal_inv[1][6][1] = inventory[36];
        internal_inv[1][6][2] = inventory[37];
        internal_inv[1][6][3] = inventory[38];
        internal_inv[1][6][4] = inventory[39];
    end

    */
   
   /* 
    always@(*) begin
        if(in1 == 1) begin
            if((in2 == 0) | (in2 == 1) | (in2 == 2) | (in2 == 3) | (in2 == 5)) begin
                if((in3 == 0) | (in3 == 2) | (in3 == 4) | (in3 == 6) | (in3 == 8))
                    snack_price = snacks[in1][in2][in3];
                else
                    snack_price = 0;
            end
            else if(in2 == 5) begin
                if((in3 == 0) | (in3 == 2) | (in3 == 4) | (in3 == 6) | (in3 == 8) | (in3 == 1) | (in3 == 3) | (in3 == 5) | (in3 == 7) | (in3 == 9))
                    snack_price <= snacks[in1][in2][in3];
                else
                    snack_price = 0;
            end
            else if(in2 == 6) begin
                if((in2 == 0) | (in2 == 1) | (in2 == 2) | (in2 == 3) | (in2 == 4))
                    snack_price <= snacks[in1][in2][in3];
                else
                    snack_price = 0;
            end
        end
        else if(in1 == 10)
            snack_price = snacks[in1][in2][in3];
        else
            snack_price = 0;
    end
    */
   always@(*) begin
            if(in1 == 4'b1) begin
                case(in2)
                    4'd0, 4'd1, 4'd2, 4'd3,
                    4'd5:   case(in3) 4'd0, 4'd2, 4'd4, 4'd6, 
                                4'd8: snack_price = snacks[in1][in2][in3];
                                default: snack_price = 0;
                            endcase
                    4'd4:   case(in3) 4'd0, 4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8,
                                4'd9: snack_price = snacks[in1][in2][in3];
                                default: snack_price = 0;
                            endcase
                    4'd6:   case(in3) 4'd0, 4'd1, 4'd2, 4'd3,
                                4'd4: snack_price = snacks[in1][in2][in3];
                                default: snack_price = 0;
                            endcase
                    default: snack_price = 0;
                endcase
            end
            else
                snack_price = 0;
    end
    
endmodule

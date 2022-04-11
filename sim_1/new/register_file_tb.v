`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 01:31:20 PM
// Design Name: 
// Module Name: register_file_tb
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


module register_file_tb;
    integer i = 0;

    reg clock, reset, load_enable;
    reg [1:0] aReg_select, bReg_select, dest_select;
    reg [7:0] reg_data;
    wire [7:0] operandA, operandB;
    
    register_file uut(.clk(clock), .reset(reset), .aReg_select(aReg_select), 
                  .bReg_select(bReg_select), .load_enable(load_enable),
                  .dest_select(dest_select), .reg_data(reg_data),
                  .operandA(operandA), .operandB(operandB));
    
    initial begin
        clock <= 0;
        reset <= 1;
        load_enable <= 0;
        aReg_select <= 0;
        bReg_select <= 0;
        dest_select <= 0;
        reg_data <= 0;
        #25;
        
        reset <= 0;
        load_enable <= 1;
        for(i = 0; i < 4; i = i + 1) begin
            dest_select <= i;
            reg_data <= i + 1;
            #10;
            aReg_select <= i;
            bReg_select <= i;
         end
         
         dest_select <= 1;
         reg_data <= 130;  //Should put -126 in Reg1
         #10;
         aReg_select <= 0;
         bReg_select <= 1;
         
         dest_select <= 2;
         reg_data <= 125;  //Should put 125 in Reg2
         #10;
         aReg_select <= 2;
         bReg_select <= 1;
         
         dest_select <= 3;
         reg_data <= 255;  //Should put -1 in Reg3
         #10;
         aReg_select <= 3;
         bReg_select <= 2;
         
         dest_select <= 0;
         reg_data <= 7;  //Should put 7 in Reg0
         #10;
         aReg_select <= 2;
         bReg_select <= 0;
         
         reset <= 1;  //Should put 0 in all registers
         #10;
         
         dest_select <= 3; //All registers should stay at 0 bc reset = 1
         reg_data <= 100;
         #10;
         aReg_select <= 1;
         bReg_select <= 3;
         
         reset <= 0;
         dest_select <= 3;
         reg_data <= 110;   //Should put 110 in Reg3
         #10;
         aReg_select <= 4;
         bReg_select <= 3;
         
         for(i = 0; i < 4; i = i + 1) begin
            if(i == 2)
                load_enable <= 0;
            dest_select <= i;
            reg_data <= i + 1;
            #10;
            aReg_select <= i;
            bReg_select <= i;
         end
         
    end
    
    

    always
        #5 clock = ~clock;
endmodule

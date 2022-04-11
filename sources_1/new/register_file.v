`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2021 11:09:19 AM
// Design Name: 
// Module Name: register_file
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


module register_file(
    input clk,
    input reset,
    input [1:0] aReg_select,
    input [1:0] bReg_select,
    input load_enable,
    input [1:0] dest_select,
    input [7:0] reg_data,
    output [7:0] operandA,
    output [7:0] operandB
    );
    
    wire r0_load, r1_load, r2_load, r3_load;
    wire [7:0] r0_out, r1_out, r2_out, r3_out;
    wire [3:0] decoded_dest;
    
    assign r0_load = load_enable & decoded_dest[0];
    assign r1_load = load_enable & decoded_dest[1];
    assign r2_load = load_enable & decoded_dest[2];
    assign r3_load = load_enable & decoded_dest[3];
    
    register_8bit register0(clk, reset, r0_load, reg_data, r0_out),
                  register1(clk, reset, r1_load, reg_data, r1_out),
                  register2(clk, reset, r2_load, reg_data, r2_out),
                  register3(clk, reset, r3_load, reg_data, r3_out);
                  
    mux_4_to_1 aData(r0_out, r1_out, r2_out, r3_out, aReg_select, operandA),
               bData(r0_out, r1_out, r2_out, r3_out, bReg_select, operandB);
    
    decoder_2_to_4 decode_dest(dest_select, decoded_dest);
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 04:45:24 AM
// Design Name: 
// Module Name: MIPS_registerFile
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


module MIPS_registerFile(
    input clk,
    input reset,
    input [4:0] aReg_select,
    input [4:0] bReg_select,
    input load_enable,
    input [4:0] dest_select,
    input [31:0] reg_data,
    output [31:0] operandA,
    output [31:0] operandB
    );
    
    wire [31:0] output_data [31:0];
    wire [31:0] load_split = {32{load_enable}};
    wire [31:0] load_signals = load_split & (32'b1 << dest_select);
    
    register_32bit register0 (clk, reset, load_signals[0] & 1'b0, reg_data, output_data[0]),
                   register1 (clk, reset, load_signals[1], reg_data, output_data[1]),
                   register2 (clk, reset, load_signals[2], reg_data, output_data[2]),
                   register3 (clk, reset, load_signals[3], reg_data, output_data[3]),
                   register4 (clk, reset, load_signals[4], reg_data, output_data[4]),
                   register5 (clk, reset, load_signals[5], reg_data, output_data[5]),
                   register6 (clk, reset, load_signals[6], reg_data, output_data[6]),
                   register7 (clk, reset, load_signals[7], reg_data, output_data[7]),
                   register8 (clk, reset, load_signals[8], reg_data, output_data[8]),
                   register9 (clk, reset, load_signals[9], reg_data, output_data[9]),
                   register10 (clk, reset, load_signals[10], reg_data, output_data[10]),
                   register11 (clk, reset, load_signals[11], reg_data, output_data[11]),
                   register12 (clk, reset, load_signals[12], reg_data, output_data[12]),
                   register13 (clk, reset, load_signals[13], reg_data, output_data[13]),
                   register14 (clk, reset, load_signals[14], reg_data, output_data[14]),
                   register15 (clk, reset, load_signals[15], reg_data, output_data[15]),
                   register16 (clk, reset, load_signals[16], reg_data, output_data[16]),
                   register17 (clk, reset, load_signals[17], reg_data, output_data[17]),
                   register18 (clk, reset, load_signals[18], reg_data, output_data[18]),
                   register19 (clk, reset, load_signals[19], reg_data, output_data[19]),
                   register20 (clk, reset, load_signals[20], reg_data, output_data[20]),
                   register21 (clk, reset, load_signals[21], reg_data, output_data[21]),
                   register22 (clk, reset, load_signals[22], reg_data, output_data[22]),
                   register23 (clk, reset, load_signals[23], reg_data, output_data[23]),
                   register24 (clk, reset, load_signals[24], reg_data, output_data[24]),
                   register25 (clk, reset, load_signals[25], reg_data, output_data[25]),
                   register26 (clk, reset, load_signals[26], reg_data, output_data[26]),
                   register27 (clk, reset, load_signals[27], reg_data, output_data[27]),
                   register28 (clk, reset, load_signals[28], reg_data, output_data[28]),
                   register29 (clk, reset, load_signals[29], reg_data, output_data[29]),
                   register30 (clk, reset, load_signals[30], reg_data, output_data[30]),
                   register31 (clk, reset, load_signals[31], reg_data, output_data[31]);
                   
    assign operandA = output_data[aReg_select];
    assign operandB = output_data[bReg_select];
    
endmodule

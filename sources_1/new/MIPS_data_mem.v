`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 11:36:13 PM
// Design Name: 
// Module Name: MIPS_data_mem
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


module MIPS_data_mem(
    input clk,
    input reset,
    input [31:0] addr,
    input [31:0] store_data,
    input mem_write_signal,
    output reg [31:0] load_data
    );
    
    integer i;
    reg [31:0] mem_cells [1023:0];
    
    initial begin
        for(i = 0; i < 1024; i = i + 1)
            mem_cells[i] = {32{1'b0}};  
    end
    
    always@(posedge clk) begin
        if(reset) begin
            for(i = 0; i < 1024; i = i + 1)
                mem_cells[i] = {32{1'b0}};
            mem_cells[10] = 32'd785;
            mem_cells[0] = 32'd64;
            mem_cells[1] = 32'b00000000110111010011111000110101;
            mem_cells[2] = 32'b10000000000000000011101011010001;
            mem_cells[3] = 32'b11101010110000011111101001111010;
        end
        else if(mem_write_signal)
            mem_cells[addr] <= store_data;  
    end
    
    always@(*) begin
        load_data = mem_cells[addr];
    end
    
endmodule

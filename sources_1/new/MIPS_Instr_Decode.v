`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 09:00:09 AM
// Design Name: 
// Module Name: MIPS_Instr_Decode
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


module MIPS_Instr_Decode(
    input [31:0] instruction,
    output reg mux_A,
    output reg mux_B,
    output reg [4:0] addr_A,
    output reg [4:0] addr_B,
    output reg const_Select,
    output reg reg_Write,
    output reg [4:0] addr_D,
    output reg [1:0] mux_D,
    output reg [1:0] branch_Select,
    output reg polarity_Select,
    output reg mem_Write,
    output reg [4:0] func_Select
    );
    
    always @ (*) begin
        case(instruction[31:25])
            0:  begin
                    {reg_Write, mux_D, branch_Select, polarity_Select, mem_Write, func_Select, mux_B, mux_A, const_Select, addr_A, addr_B, addr_D} = 0;
                end
            1:  begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    mem_Write = 1;
                    {func_Select, reg_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0; 
                end
            2:  begin
                    reg_Write = 1;
                    func_Select = 2;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            5:  begin
                    reg_Write = 1;
                    func_Select = 5;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0; 
                end
            7:  begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    branch_Select = 3;
                    mux_B = 1;
                    mux_A = 1;
                    const_Select = 1;
                    func_Select = 7;
                    reg_Write = 1;
                    {mem_Write, mux_D, polarity_Select} = 0;
                end
            8:  begin
                    reg_Write = 1;
                    func_Select = 8;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            10: begin
                    reg_Write = 1;
                    func_Select = 10;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            12: begin
                    reg_Write = 1;
                    func_Select = 12;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            32: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    branch_Select = 1;
                    mux_B = 1;
                    const_Select = 1;
                    {mem_Write, mux_D, polarity_Select, mux_A, reg_Write, func_Select} = 0;
                end    
            33: begin
                    reg_Write = 1;
                    mux_D = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {func_Select, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0; 
                end
            34: begin
                    reg_Write = 1;
                    func_Select = 2;
                    mux_B = 1;
                    const_Select = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A} = 0; 
                end
            35: begin
                    reg_Write = 1;
                    func_Select = 3;
                    mux_B = 1;
                    const_Select = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A} = 0;
                end
            37: begin
                    reg_Write = 1;
                    func_Select = 5;
                    mux_B = 1;
                    const_Select = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A} = 0; 
                end
            40: begin
                    reg_Write = 1;
                    func_Select = 8;
                    mux_B = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A, const_Select} = 0;
                end
            42: begin
                    reg_Write = 1;
                    func_Select = 10;
                    mux_B = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A, const_Select} = 0;
                end
            44: begin
                    reg_Write = 1;
                    func_Select = 12;
                    mux_B = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A, const_Select} = 0;
                end  
            46: begin
                    reg_Write = 1;
                    func_Select = 14;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            48: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    reg_Write = 1;
                    func_Select = 16;
                    {mem_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0;
                end
            49: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    reg_Write = 1;
                    func_Select = 17;
                    {mem_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0;
                end
            50: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    reg_Write = 1;
                    func_Select = 18;
                    {mem_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0;
                end
            51: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    reg_Write = 1;
                    func_Select = 19;
                    {mem_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0;
                end   
            64: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    reg_Write = 1;
                    {func_Select, mem_Write, mux_D, branch_Select, polarity_Select, mux_B, mux_A, const_Select} = 0; 
                end
            68: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    branch_Select = 3;
                    mux_B = 1;
                    const_Select = 1;
                    {polarity_Select, reg_Write, func_Select, mem_Write, mux_D, mux_A} = 0;
                end     
            69: begin
                    reg_Write = 1;
                    func_Select = 5;
                    mux_B = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A, const_Select} = 0;
                end
            96: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    polarity_Select = 1;
                    branch_Select = 1;
                    mux_B = 1;
                    const_Select = 1;
                    {reg_Write, func_Select, mem_Write, mux_D, mux_A} = 0;
                end
            97: begin
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    branch_Select = 2;
                    {mem_Write, mux_D, func_Select, reg_Write, polarity_Select, mux_B, mux_A, const_Select} = 0;
                end     
            98: begin
                    reg_Write = 1;
                    func_Select = 2;
                    mux_B = 1;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    {mux_D, branch_Select, polarity_Select, mem_Write, mux_A, const_Select} = 0;
                end   
            101:
                begin
                    reg_Write = 1;
                    func_Select = 5;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    mux_D = 2;
                    {branch_Select, polarity_Select, mem_Write, mux_B, mux_A, const_Select} = 0;
                end
            127:
                begin
                    reg_Write = 1;
                    func_Select = 31;
                    addr_A = instruction[19:15];
                    addr_B = instruction[14:10];
                    addr_D = instruction[24:20];
                    mux_A = 1;
                    mux_B = 1;
                    const_Select = 1;
                    {mux_D, branch_Select, polarity_Select, mem_Write} = 0;
                end
        endcase
    end
    
endmodule

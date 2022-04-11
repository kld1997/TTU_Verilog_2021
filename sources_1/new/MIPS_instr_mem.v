`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 11:35:56 PM
// Design Name: 
// Module Name: MIPS_instr_mem
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


module MIPS_instr_mem(
    input [31:0] pc_addr,
    output reg [31:0] instr
    );
    
    `include "MIPS_instr_set.vh"
    integer j;
    reg [31:0] instructions [1023:0];
    
    initial begin
        for(j = 0; j < 1024; j = j + 1)
            instructions[j] = 32'b0;
            
        instructions[0]={LD,R10,R0,ZI};
        instructions[1]={ADI,R16,R0,15'd1};
        instructions[2]={ADI,R15,R0,15'd2};
        instructions[3]={LD,R1,R16,ZI};
        instructions[4]={ADI,R12,R15,15'd1};
        instructions[5]={LD,R3,R15,ZI};
        instructions[6]={SBI,R11,R0,15'd1};
        instructions[7]={LD,R2,R12,ZI};
        instructions[8]={SLT,R20,R1,R11, ZR};
        instructions[9]={SLT,R21,R3,R11,ZR};
        instructions[10]={BNZ,R0,R20,15'd49};
        instructions[11]={LSL,R13,R16,15'd31};
        instructions[12]={PCST,R31,R0,15'd0};
        instructions[13]={BNZ,R0,R21,15'd58};
        instructions[14]={PCST,R31,R0,15'd1};
        instructions[15]={LSL,R8,R8,15'd1};
        instructions[16]={LSL,R2,R2,15'd1};
        instructions[17]={SHLC,R1,R1,ZI};
        instructions[18]={SHLC,R4,R4,ZI};
        instructions[19]={SBI,R10,R10,15'd1};
        instructions[20]={SLT,R12,R3,R4,ZR};
        instructions[21]={AND,R15,R13,R4,ZR};
        instructions[22]={NOP};
        instructions[23]={SLT,R15,R15,R13,ZR};
        instructions[24]={NOP};
        instructions[25]={OR,R12,R12,R15,ZR};
        instructions[26]={XOR,R14,R13,R8,ZR};
        instructions[27]={BNZ,R0,R12,15'd55};
        instructions[28]={SLT,R12,R14,R11,ZR};
        instructions[29]={SLT,R15,R10,R0,ZR};
        instructions[30]={SUB,R12,R16,R12,ZR};
        instructions[31]={SUB,R15,R16,R15,ZR};
        instructions[32]={XOR,R15,R20,R21,ZR};
        instructions[33]={AND,R12,R12,R15,ZR};
        instructions[34]={SLT,R12,R8,R13,ZR};
        instructions[35]={BNZ,R0,R12,15'd31};
        instructions[36]={AND,R12,R12,R15,ZR};
        instructions[37]={SLT,R15,R8,R11,ZR};
        instructions[38]={BNZ,R0,R10,-15'd24};
        instructions[39]={SUB,R15,R16,R15,ZR};
        instructions[40]={NOP};
        instructions[41]={OR,R16,R15,R12,ZR};
        instructions[42]={XOR,R12,R20,R21,ZR};
        instructions[43]={NOP};
        instructions[44]={NOP};
        instructions[45]={NOP};
        instructions[46]={BZ,R0,R16,15'd20};
        instructions[47]={NOP};
        instructions[48]={MOV,R30,R8,ZI};
        instructions[49]={BNZ,R0,R12,15'd22};
        instructions[50]={PCST,R31,R0,15'd1};
        instructions[51]={NOP};
        instructions[52]={MOV,R8,R30,ZI};
        instructions[53]={MOV,R30,R4,ZI};
        instructions[54]={BNZ,R0,R20,15'd17};
        instructions[55]={PCST,R31,R0,15'd1};
        instructions[56]={NOP};
        instructions[57]={JMP,R0,R0,15'd33};
        instructions[58]={MOV,R9,R30,ZI};
        instructions[59]={NOP};
        instructions[60]={NOT,R2,R2,ZI};
        instructions[61]={NOT,R1,R1,ZI};
        instructions[62]={ADI,R2,R2,15'd1};
        instructions[63]={ADCI,R1,R1,15'd0};
        instructions[64]={JMR,R0,R31,ZI};
        instructions[65]={NOP};
        instructions[66]={NOP};
        instructions[67]={MOV,R8,R13,ZI};
        instructions[68]={MOV,R9,R13,ZI};
        instructions[69]={JMP,R0,R0,15'd21};
        instructions[70]={NOP};
        instructions[71]={NOP};
        instructions[72]={BNZ,R0,R10,15'd6};
        instructions[73]={NOP};
        instructions[74]={NOP};
        instructions[75]={SUB,R30,R0,R30,ZR};
        instructions[76]={JMR,R0,R31,ZI};
        instructions[77]={NOP};
        instructions[78]={NOP};
        instructions[79]={SUB,R3,R0,R3,ZR};
        instructions[80]={JMR,R0,R31,ZI};
        instructions[81]={NOP};
        instructions[82]={NOP};
        instructions[83]={ADI,R8,R8,15'd1};
        instructions[84]={SUB,R4,R4,R3,ZR};
        instructions[85]={XOR,R14,R13,R8,ZR};
        instructions[86]={SLT,R15,R10,R0,ZR};
        instructions[87]={SLT,R12,R14,R11,ZR};
        instructions[88]={JMP,R0,R0,-15'd59};
        instructions[89]={NOP};
        instructions[90]={NOP};
        instructions[91]={NOP};
        instructions[92]={NOP};
        instructions[93]={NOP};





 
    end
    
    always@(*) begin
        instr = instructions[pc_addr[9:0]];
    end
    
endmodule

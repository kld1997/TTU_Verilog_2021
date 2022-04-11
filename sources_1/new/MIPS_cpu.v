`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2021 11:54:24 PM
// Design Name: 
// Module Name: MIPS_cpu
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


module MIPS_cpu(
    input clock,
    input reset
    );
    
    reg [31:0] pc1, pc2, pc3;
    reg [31:0] instr_reg;
    reg [21:0] control_signal1;
    reg [7:0] control_signal2;
    reg [31:0] valA_reg, valB_reg;
    reg [64:0] func_unit_reg;
    reg [3:0] status_bit_reg;
    
    initial begin
        {pc1, pc2, pc3, instr_reg, control_signal1, control_signal2, valA_reg, valB_reg, func_unit_reg, status_bit_reg} = 0;
    end    
    
    wire [31:0] instr_wire, data_mem_out, func_unit_out, muxD_out, branch_add_out;
    wire [31:0] regFileA_out, regFileB_out, const_unit_out, muxA_out, muxB_out, muxC_out, pc1_to_2;
    wire [4:0] addrA_wire, addrB_wire, addrD_wire, fs;
    wire [1:0] muxD_wire, muxC_sel, bs;
    wire cs, rw, ps, mw, n_xor_v_status, muxA_sig_wire, muxB_sig_wire, z_out_wire, c_out_wire, n_out_wire, v_out_wire;
    
    MIPS_instr_mem instr_mem(pc1, instr_wire);
    MIPS_data_mem data_mem(clock, reset, valA_reg, valB_reg, control_signal1[10], data_mem_out);
    MIPS_constant_unit constant_unit(cs, instr_reg[14:0], const_unit_out);
    
    MIPS_Instr_Decode instr_decode(instr_reg, muxA_sig_wire, muxB_sig_wire, addrA_wire, addrB_wire, cs, rw,
                                   addrD_wire, muxD_wire, bs, ps, mw, fs);
                                   
    MIPS_function_unit func_unit(control_signal1[4:0], control_signal1[9:5], valA_reg, valB_reg, status_bit_reg[0],
                                 z_out_wire, n_out_wire, c_out_wire, v_out_wire, n_xor_v_status, func_unit_out);
                                 
    MIPS_registerFile reg_file(clock, reset, addrA_wire, addrB_wire, control_signal2[7], control_signal2[6:2],
                               muxD_out, regFileA_out, regFileB_out);
    
    mux_2_to_1_32bit muxA(regFileA_out, pc2, muxA_sig_wire, muxA_out),
                     muxB(regFileB_out, const_unit_out, muxB_sig_wire, muxB_out);
                     
    mux_4_to_1_32bit muxC(pc1_to_2, branch_add_out, valA_reg, branch_add_out, muxC_sel, muxC_out),
                     muxD(func_unit_reg[63:32], func_unit_reg[31:0], {31'b0, func_unit_reg[64]}, {32'b0},
                          control_signal2[1:0], muxD_out);
                     
    assign pc1_to_2 = pc1 + 32'b1;
    assign branch_add_out = pc3 + valB_reg;
    assign muxC_lsb = ((control_signal1[11] ^ z_out_wire) | control_signal1[13]) & control_signal1[12];
    assign muxC_sel = {control_signal1[13], muxC_lsb};
    
    always@(negedge clock) begin
        if(reset)
            {pc1, pc2, pc3, instr_reg, control_signal1, control_signal2, valA_reg, valB_reg, func_unit_reg} <= 0;
        else begin
            pc1 <= muxC_out;
            pc2 <= pc1_to_2;
            pc3 <= pc2;
            instr_reg <= instr_wire;
            control_signal1 <= {rw, addrD_wire, muxD_wire, bs, ps, mw, fs, instr_reg[4:0]};
            control_signal2 <= control_signal1[21:14];
            valA_reg <= muxA_out;
            valB_reg <= muxB_out;
            func_unit_reg <= {n_xor_v_status, func_unit_out, data_mem_out};
            status_bit_reg <= {z_out_wire, v_out_wire, n_out_wire, c_out_wire};
        end
    end
                     
endmodule

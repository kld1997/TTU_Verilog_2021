`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 10:15:14 AM
// Design Name: 
// Module Name: MIPS_function_unit
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


module MIPS_function_unit(
    input [4:0] shift,
    input [4:0] func_sel,
    input [31:0] in_A,
    input [31:0] in_B,
    input c_in,
    output z,
    output reg n,
    output reg c_out,
    output reg v,
    output n_xor_v_or_z,
    output reg [31:0] func_out
    );
    
    reg [31:0] not_B = 0;
    reg [63:0] shift_right = 64'b0;
    
    always @ (*) begin
        v = 0;
        c_out = 0;
        not_B = ~in_B + 1;
        if((!func_sel[4] & !func_sel[3] & func_sel[2] & func_sel[1] & func_sel[0]) | (~(|func_sel))) begin
            func_out = in_A;
            n = func_out[31];
        end
        else begin
            case(func_sel)  
                2:  begin
                        func_out = in_A + in_B;
                        v = (in_A[31] & in_B[31] & !func_out[31]) ? 1 :
                            (!in_A[31] & !in_B[31] & func_out[31]) ? 1 : 0;
                        c_out = ((in_A[31] | in_B[31]) & !func_out[31]) ? 1 : 0;
                        n = func_out[31];
                    end
                3:  begin
                        func_out = in_A + in_B + c_in;
                        v = (in_A[31] & in_B[31] & !func_out[31]) ? 1 :
                            (!in_A[31] & !in_B[31] & func_out[31]) ? 1 : 0;
                        c_out = ((in_A[31] | in_B[31]) & !func_out[31]) ? 1 : 0;
                        n = func_out[31];
                    end
                5:  begin
                        func_out = in_A + not_B;
                        n = func_out[31];
                        v = (in_A[31] & not_B[31] & !func_out[31]) ? 1 :
                            (!in_A[31] & !not_B[31] & func_out[31]) ? 1 : 0;
                        if(in_B[31] & (~(|in_B[30:0]))) begin
                            if(in_A[31])
                                v = 0;
                            else begin
                                v = 1;
                            end
                        end
                    end
                8:  begin
                        func_out = in_A & in_B;
                        n = func_out[31];
                    end 
                10: begin
                        func_out = in_A | in_B;
                        n = func_out[31];
                    end
                12: begin
                        func_out = in_A ^ in_B;
                        n = func_out[31];
                    end
                14: begin
                        func_out = ~in_A;
                        n = func_out[31];
                    end
                16: begin
                        shift_right = {32'b0, in_A} << shift;
                        c_out = shift_right[32];
                        func_out = shift_right[31:0];
                        n = func_out[31];
                    end
                17: begin
                        shift_right = {32'b0, in_A} << (6'd32 - shift);
                        c_out = shift_right[31];
                        func_out = shift_right[63:32];
                        n = func_out[31];
                    end
                18: begin
                        c_out = in_A[31];
                        func_out = {in_A[30:0], c_in};
                        n = func_out[31];
                    end
                19: begin
                        c_out = in_A[0];
                        func_out = {c_in, in_A[31:1]};
                        n = func_out[31];
                    end
                31: begin
                        func_out = in_A + in_B;
                        n = func_out[31];
                    end
                default:
                    begin
                        func_out = in_A;
                        n = func_out[31];
                    end
            endcase
        end
    end
    
    assign n_xor_v_or_z = (n ^ v) | z;
    assign z = !(|func_out);
    
endmodule

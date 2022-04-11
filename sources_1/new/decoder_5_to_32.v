`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 07:15:21 AM
// Design Name: 
// Module Name: decoder_5_to_32
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


module decoder_5_to_32(
    input [4:0] dest_reg,
    output reg [31:0] load
    );
    
    always @ (*)  begin
        case (dest_reg)
            0: load <= {31'b0, 1'b1};
            1: load <= {30'b0, 1'b1, 1'b0};
            2: load <= {30'b0, 1'b1, 1'b0};
            3: load <= {30'b0, 1'b1, 1'b0};
            4: load <= {30'b0, 1'b1, 1'b0};
            5: load <= {30'b0, 1'b1, 1'b0};
            6: load <= {30'b0, 1'b1, 1'b0};
            7: load <= {30'b0, 1'b1, 1'b0};
            8: load <= {30'b0, 1'b1, 1'b0};
            9: load <= {30'b0, 1'b1, 1'b0};
            10: load <= {30'b0, 1'b1, 1'b0};
            11: load <= {30'b0, 1'b1, 1'b0};
            12: load <= {30'b0, 1'b1, 1'b0};
            13: load <= {30'b0, 1'b1, 1'b0};
            14: load <= {30'b0, 1'b1, 1'b0};
            15: load <= {30'b0, 1'b1, 1'b0};
            16: load <= {30'b0, 1'b1, 1'b0};
            17: load <= {30'b0, 1'b1, 1'b0};
            18: load <= {30'b0, 1'b1, 1'b0};
            19: load <= {30'b0, 1'b1, 1'b0};
            20: load <= {30'b0, 1'b1, 1'b0};
            21: load <= {30'b0, 1'b1, 1'b0};
            22: load <= {30'b0, 1'b1, 1'b0};
            23: load <= {30'b0, 1'b1, 1'b0};
            24: load <= {30'b0, 1'b1, 1'b0};
            25: load <= {30'b0, 1'b1, 1'b0};
            26: load <= {30'b0, 1'b1, 1'b0};
            27: load <= {30'b0, 1'b1, 1'b0};
            28: load <= {30'b0, 1'b1, 1'b0};
            29: load <= {30'b0, 1'b1, 1'b0};
            30: load <= {30'b0, 1'b1, 1'b0};
            31: load <= {30'b0, 1'b1, 1'b0};
        endcase
    end
endmodule

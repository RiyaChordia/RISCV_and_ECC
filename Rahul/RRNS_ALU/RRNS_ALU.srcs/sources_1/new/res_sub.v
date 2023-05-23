`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2023 14:34:19
// Design Name: 
// Module Name: res_sub
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


module res_sub(input [48:0] res_in, output [48:0] res_out);

//This module is used to take the complement of the residues which can be directly added in case of subtraction
//Complement is nothing just the subtraction of residues from the magnitude of their corresponding moduli

assign res_out[48:42] = 7'd101 - res_in[48:42];
assign res_out[41:35] = 7'd103 - res_in[41:35];
assign res_out[34:28] = 7'd107 - res_in[34:28];
assign res_out[27:21] = 7'd109 - res_in[27:21];
assign res_out[20:14] = 7'd113 - res_in[20:14];
assign res_out[13:7] = 7'd127 - res_in[13:7];
assign res_out[6:0] = 8'd128 - res_in[6:0];
endmodule

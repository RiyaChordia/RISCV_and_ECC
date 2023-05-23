`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 16:02:26
// Design Name: 
// Module Name: residue_adder
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


module residue_adder(input [48:0] residue1, residue2, output [48:0] res_out);
wire [7:0] res101,res103,res107,res109,res113,res127;

//This module adds the residues corresponding to similar moduli together and then give the final result in RRNS domain
assign res101 = residue1[48:42] + residue2[48:42];
assign res103 = residue1[41:35] + residue2[41:35];
assign res107 = residue1[34:28] + residue2[34:28];
assign res109 = residue1[27:21] + residue2[27:21];
assign res113 = residue1[20:14] + residue2[20:14];
assign res127 = residue1[13:7] + residue2[13:7];

//After additon, it should also be ensured that the residue should be smaller than the magnitude of the moduli
assign res_out[48:42] = (res101<8'd101) ? res101[6:0] : (res101 - 8'd101);
assign res_out[41:35] = (res103<8'd103) ? res103[6:0] : (res103 - 8'd103);
assign res_out[34:28] = (res107<8'd107) ? res107[6:0] : (res107 - 8'd107);
assign res_out[27:21] = (res109<8'd109) ? res109[6:0] : (res109 - 8'd109);
assign res_out[20:14] = (res113<8'd113) ? res113[6:0] : (res113 - 8'd113);
assign res_out[13:7]  = (res127<8'd127) ? res127[6:0] : (res127 - 8'd127);
assign res_out[6:0]   = residue1[6:0] + residue2[6:0] ;
endmodule

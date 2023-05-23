`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.04.2023 13:44:14
// Design Name: 
// Module Name: RRNS_ALU
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

// Main module
module RRNS_ALU(input [31:0] in1,in2, input sub_add,input [48:0] in_err, output [31:0] out, output error);
wire [48:0] r1,r2,r3,r_err,r2_sub,r2_add;

bin2RRNS b1(.bin(in1), .residue(r1)); 
//in1 is first 32 bit operand and r1 is its RRNS representation
bin2RRNS b2(.bin(in2), .residue(r2_add));
//in2 is second 32 bit operand and r2_add is its RRNS representation

assign r2 = sub_add ? r2_sub : r2_add;
//if sub_add is High then subtraction is performed
//complement of r2_add is taken which is r2_sub
res_sub b5 (.res_in(r2_add), .res_out(r2_sub)); //this module is called for taking complement of r2_add

residue_adder b3(.residue1(r1), .residue2(r2), .res_out(r3)); // both the operands are added

assign r_err = in_err^r3; // output of residue adder is corrupted by xor it with external input which is used to inject errors

residue_check b4(.res_in(r_err), .bin_out(out), .error(error)); //final result in RRNS is given to residue check for error correction and detection algorithm and it gives output in binary format

//residue_check b4(.res_in(r3), .bin_out(out), .error(error)); //to run the code without external error injection, comment aboove two line and uncomment this line

endmodule

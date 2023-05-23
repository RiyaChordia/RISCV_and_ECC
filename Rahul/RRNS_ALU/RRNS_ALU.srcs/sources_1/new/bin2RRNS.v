`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 16:08:05
// Design Name: 
// Module Name: bin2RRNS
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


module bin2RRNS(input [31:0] bin, output [48:0] residue);

//Different modulo operations are done on the 32-bit input to calculate all the residues
//Moduli set (101, 103, 107, 109, 113, 127, 128) is chosen for modulo operation
//each of the seven bits of the 49-bit output of this module represents a residue
modulo101n m1(.bin(bin),.mod101(residue[48:42]));
modulo103n m2(.bin(bin),.mod103(residue[41:35]));
modulo107n m3(.bin(bin),.mod107(residue[34:28]));
modulo109n m4(.bin(bin),.mod109(residue[27:21]));
modulo113n m5(.bin(bin),.mod113(residue[20:14]));
modulo127n m6(.bin(bin),.mod127(residue[13:7]));
assign residue[6:0] = bin[6:0]; // this is modulo128 operation which just requires masking of least significant 7-bits

endmodule

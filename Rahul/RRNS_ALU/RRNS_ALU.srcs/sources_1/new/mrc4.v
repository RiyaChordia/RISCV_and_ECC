`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2023 16:04:41
// Design Name: 
// Module Name: mrc4
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


module mrc4(input [6:0] res107,res109,res113,res127,res128, output [31:0] bin_out);
wire [6:0] v1,v2,v3,v4,v5;
wire [31:0] v2n,v3n,v4n,v5n,b1;

//This MRC block is used to convert the residue from Moduli set (107, 109, 113, 127, 128)
//These are the coefficients that are their in mixed radix conversion and are calculated using MATLAB
localparam c12 =8'd54; localparam c13 =8'd94; localparam c14 =8'd19; localparam c15 =8'd67;
localparam c23 =8'd28; localparam c24 =8'd7; localparam c25 =8'd101;
localparam c34 =8'd9; localparam c35 =8'd17;
localparam c45 =8'd127;

//All the below lines are as per the formula of mixed radix conversion
assign v1 = res107;

assign v2n = (res109 - v1)*c12;
modulo109n m1(.bin(v2n),.mod109(v2));

assign v3n = ((res113 - v1)*c13 - v2)*c23;
modulo113n m2(.bin(v3n),.mod113(v3));

assign v4n = (((res127 - v1)*c14 - v2)*c24 - v3)*c34;
modulo127n m3(.bin(v4n),.mod127(v4));

assign v5n = ((((res128 - v1)*c15 - v2)*c25 - v3)*c35 - v4)*c45;
assign v5 = v5n[6:0];

assign b1 = v1 + v2*107 + v3*107*109 + v4*107*109*113 + v5*107*109*113*127;
assign bin_out = b1[31] ? b1 -107*109*113*127*128 : b1; //For -ve numbers, the converted binary output is to be subtracted from the dynamic range

endmodule

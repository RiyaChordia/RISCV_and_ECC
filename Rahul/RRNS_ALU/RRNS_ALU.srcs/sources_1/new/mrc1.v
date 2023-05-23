`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 15:02:16
// Design Name: 
// Module Name: mrc1
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


module mrc1(input [6:0] res101,res103,res107,res109,res113, output [31:0] bin_out);
wire [6:0] v1,v2,v3,v4,v5;
wire [31:0] v2n,v3n,v4n,v5n,b1;
//This MRC block is used to convert the residue from Moduli set (101, 103, 107, 109, 113)
//These are the coefficients that are their in mixed radix conversion and are calculated using MATLAB
localparam c12 =8'd51; localparam c13 =8'd89; localparam c14 =8'd68; localparam c15 =8'd47;
localparam c23 =8'd80; localparam c24 =8'd18; localparam c25 =8'd79;
localparam c34 =8'd54; localparam c35 =8'd94;
localparam c45 =8'd28;

//All the below lines are as per the formula of mixed radix conversion
assign v1 = res101;

assign v2n = (res103 - v1)*c12;
modulo103n m1(.bin(v2n),.mod103(v2));

assign v3n = ((res107 - v1)*c13 - v2)*c23;
modulo107n m2(.bin(v3n),.mod107(v3));

assign v4n = (((res109 - v1)*c14 - v2)*c24 - v3)*c34;
modulo109n m3(.bin(v4n),.mod109(v4));

assign v5n = ((((res113 - v1)*c15 - v2)*c25 - v3)*c35 - v4)*c45;
modulo113n m4(.bin(v5n),.mod113(v5));

assign b1 = v1 + v2*101 + v3*101*103 + v4*101*103*107 + v5*101*103*107*109;
assign bin_out = b1[31] ? b1 -101*103*107*109*113 : b1; //For -ve numbers, the converted binary output is to be subtracted from the dynamic range
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 16:06:45
// Design Name: 
// Module Name: modulo127n
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


module modulo127n(input [31:0] bin, output reg [6:0] mod127);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

assign s31 = bin[31] ? 7'd119 : 7'd0;
assign s30 = bin[30] ? 7'd4 : 7'd0;
assign s29 = bin[29] ? 7'd2 : 7'd0;
assign s28 = bin[28] ? 7'd1 : 7'd0;
assign s27 = bin[27] ? 7'd64 : 7'd0;
assign s26 = bin[26] ? 7'd32 : 7'd0;
assign s25 = bin[25] ? 7'd16 : 7'd0;
assign s24 = bin[24] ? 7'd8 : 7'd0;
assign s23 = bin[23] ? 7'd4 : 7'd0;
assign s22 = bin[22] ? 7'd2 : 7'd0;
assign s21 = bin[21] ? 7'd1 : 7'd0;
assign s20 = bin[20] ? 7'd64 : 7'd0;
assign s19 = bin[19] ? 7'd32 : 7'd0;
assign s18 = bin[18] ? 7'd16 : 7'd0;
assign s17 = bin[17] ? 7'd8 : 7'd0;
assign s16 = bin[16] ? 7'd4 : 7'd0;
assign s15 = bin[15] ? 7'd2 : 7'd0;
assign s14 = bin[14] ? 7'd1 : 7'd0;
assign s13 = bin[13] ? 7'd64 : 7'd0;
assign s12 = bin[12] ? 7'd32 : 7'd0;
assign s11 = bin[11] ? 7'd16 : 7'd0;
assign s10 = bin[10] ? 7'd8 : 7'd0;
assign s9 = bin[9] ? 7'd4 : 7'd0;
assign s8 = bin[8] ? 7'd2 : 7'd0;
assign s7 = bin[7] ? 7'd1 : 7'd0;

assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

always@(*)
begin
    if(sum < 12'd127)
        mod127 = sum;
    else if(sum < 12'd254)
        mod127 = sum - 12'd127;
    else if(sum < 12'd381)
        mod127 = sum - 12'd254;
    else if(sum < 12'd508)
        mod127 = sum - 12'd381;
    else 
        mod127 = sum - 12'd508;
        
end
endmodule

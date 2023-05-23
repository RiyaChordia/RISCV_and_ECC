`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 15:48:08
// Design Name: 
// Module Name: modulo113
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


module modulo113(input [31:0] bin, output reg [6:0] mod113);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

assign s31 = bin[31] ? 7'd8 : 7'd0;
assign s30 = bin[30] ? 7'd4 : 7'd0;
assign s29 = bin[29] ? 7'd2 : 7'd0;
assign s28 = bin[28] ? 7'd1 : 7'd0;
assign s27 = bin[27] ? 7'd57 : 7'd0;
assign s26 = bin[26] ? 7'd85 : 7'd0;
assign s25 = bin[25] ? 7'd99 : 7'd0;
assign s24 = bin[24] ? 7'd106 : 7'd0;
assign s23 = bin[23] ? 7'd53 : 7'd0;
assign s22 = bin[22] ? 7'd83 : 7'd0;
assign s21 = bin[21] ? 7'd98 : 7'd0;
assign s20 = bin[20] ? 7'd49 : 7'd0;
assign s19 = bin[19] ? 7'd81 : 7'd0;
assign s18 = bin[18] ? 7'd97 : 7'd0;
assign s17 = bin[17] ? 7'd105 : 7'd0;
assign s16 = bin[16] ? 7'd109 : 7'd0;
assign s15 = bin[15] ? 7'd111 : 7'd0;
assign s14 = bin[14] ? 7'd112 : 7'd0;
assign s13 = bin[13] ? 7'd56 : 7'd0;
assign s12 = bin[12] ? 7'd28 : 7'd0;
assign s11 = bin[11] ? 7'd14 : 7'd0;
assign s10 = bin[10] ? 7'd7 : 7'd0;
assign s9 = bin[9] ? 7'd60 : 7'd0;
assign s8 = bin[8] ? 7'd30 : 7'd0;
assign s7 = bin[7] ? 7'd15 : 7'd0;

assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

always@(*)
begin
    if(sum < 12'd113)
        mod113 = sum;
    else if(sum < 12'd226)
        mod113 = sum - 12'd113;
    else if(sum < 12'd339)
        mod113 = sum - 12'd226;
    else if(sum < 12'd452)
        mod113 = sum - 12'd339;
    else if(sum < 12'd565)
        mod113 = sum - 12'd452;
    else if(sum < 12'd678)
        mod113 = sum - 12'd565;
    else if(sum < 12'd791)
        mod113 = sum - 12'd678;
    else if(sum < 12'd904)
        mod113 = sum - 12'd791;
    else if(sum < 12'd1017)
        mod113 = sum - 12'd904;
    else if(sum < 12'd1130)
        mod113 = sum - 12'd1017;
    else if(sum < 12'd1243)
        mod113 = sum - 12'd1130;
    else if(sum < 12'd1356)
        mod113 = sum - 12'd1243;
    else if(sum < 12'd1469)
        mod113 = sum - 12'd1356;
    else if(sum < 12'd1582)
        mod113 = sum - 12'd1469;
    else
        mod113 = sum - 12'd1582;
    
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 16:00:20
// Design Name: 
// Module Name: modulo109n
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


module modulo109n(input [31:0] bin, output reg [6:0] mod109);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

//refer to modulo101n module to understand the logic
assign s31 = bin[31] ? 7'd17 : 7'd0;
assign s30 = bin[30] ? 7'd46 : 7'd0;
assign s29 = bin[29] ? 7'd23 : 7'd0;
assign s28 = bin[28] ? 7'd66 : 7'd0;
assign s27 = bin[27] ? 7'd33 : 7'd0;
assign s26 = bin[26] ? 7'd71 : 7'd0;
assign s25 = bin[25] ? 7'd90 : 7'd0;
assign s24 = bin[24] ? 7'd45 : 7'd0;
assign s23 = bin[23] ? 7'd77 : 7'd0;
assign s22 = bin[22] ? 7'd93 : 7'd0;
assign s21 = bin[21] ? 7'd101 : 7'd0;
assign s20 = bin[20] ? 7'd105 : 7'd0;
assign s19 = bin[19] ? 7'd107 : 7'd0;
assign s18 = bin[18] ? 7'd108 : 7'd0;
assign s17 = bin[17] ? 7'd54 : 7'd0;
assign s16 = bin[16] ? 7'd27 : 7'd0;
assign s15 = bin[15] ? 7'd68 : 7'd0;
assign s14 = bin[14] ? 7'd34 : 7'd0;
assign s13 = bin[13] ? 7'd17 : 7'd0;
assign s12 = bin[12] ? 7'd63 : 7'd0;
assign s11 = bin[11] ? 7'd86 : 7'd0;
assign s10 = bin[10] ? 7'd43 : 7'd0;
assign s9 = bin[9] ? 7'd76 : 7'd0;
assign s8 = bin[8] ? 7'd38 : 7'd0;
assign s7 = bin[7] ? 7'd19 : 7'd0;

assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

always@(*)
begin
    if(sum < 12'd109)
        mod109 = sum;
    else if(sum < 12'd218)
        mod109 = sum - 12'd109;
    else if(sum < 12'd327)
        mod109 = sum - 12'd218;
    else if(sum < 12'd436)
        mod109 = sum - 12'd327;
    else if(sum < 12'd545)
        mod109 = sum - 12'd436;
    else if(sum < 12'd654)
        mod109 = sum - 12'd545;
    else if(sum < 12'd763)
        mod109 = sum - 12'd654;
    else if(sum < 12'd872)
        mod109 = sum - 12'd763;
    else if(sum < 12'd981)
        mod109 = sum - 12'd872;
    else if(sum < 12'd1090)
        mod109 = sum - 12'd981;
    else if(sum < 12'd1199)
        mod109 = sum - 12'd1090;
    else if(sum < 12'd1308)
        mod109 = sum - 12'd1199;
    else if(sum < 12'd1417)
        mod109 = sum - 12'd1308;
    else if(sum < 12'd1526)
        mod109 = sum - 12'd1417;
    else
        mod109 = sum - 12'd1526;     

end
endmodule

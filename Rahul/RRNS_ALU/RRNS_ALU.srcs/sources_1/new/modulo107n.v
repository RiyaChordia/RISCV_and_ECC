`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 15:56:02
// Design Name: 
// Module Name: modulo107n
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


module modulo107n(input [31:0] bin, output reg [6:0] mod107);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

//refer to modulo101n module to understand the logic
assign s31 = bin[31] ? 7'd39 : 7'd0;
assign s30 = bin[30] ? 7'd34 : 7'd0;
assign s29 = bin[29] ? 7'd17 : 7'd0;
assign s28 = bin[28] ? 7'd62 : 7'd0;
assign s27 = bin[27] ? 7'd31 : 7'd0;
assign s26 = bin[26] ? 7'd69 : 7'd0;
assign s25 = bin[25] ? 7'd88 : 7'd0;
assign s24 = bin[24] ? 7'd44 : 7'd0;
assign s23 = bin[23] ? 7'd22 : 7'd0;
assign s22 = bin[22] ? 7'd11 : 7'd0;
assign s21 = bin[21] ? 7'd59 : 7'd0;
assign s20 = bin[20] ? 7'd83 : 7'd0;
assign s19 = bin[19] ? 7'd95 : 7'd0;
assign s18 = bin[18] ? 7'd101 : 7'd0;
assign s17 = bin[17] ? 7'd104 : 7'd0;
assign s16 = bin[16] ? 7'd52 : 7'd0;
assign s15 = bin[15] ? 7'd26 : 7'd0;
assign s14 = bin[14] ? 7'd13 : 7'd0;
assign s13 = bin[13] ? 7'd60 : 7'd0;
assign s12 = bin[12] ? 7'd30 : 7'd0;
assign s11 = bin[11] ? 7'd15 : 7'd0;
assign s10 = bin[10] ? 7'd61 : 7'd0;
assign s9 = bin[9] ? 7'd84 : 7'd0;
assign s8 = bin[8] ? 7'd42 : 7'd0;
assign s7 = bin[7] ? 7'd21 : 7'd0;

assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

always@(*)
begin
    if(sum < 12'd107)
        mod107 = sum;
    else if(sum < 12'd214)
        mod107 = sum - 12'd107;
    else if(sum < 12'd321)
        mod107 = sum - 12'd214;
    else if(sum < 12'd428)
        mod107 = sum - 12'd321;
    else if(sum < 12'd535)
        mod107 = sum - 12'd428;
    else if(sum < 12'd642)
        mod107 = sum - 12'd535;
    else if(sum < 12'd749)
        mod107 = sum - 12'd642;
    else if(sum < 12'd856)
        mod107 = sum - 12'd749;
    else if(sum < 12'd963)
        mod107 = sum - 12'd856;
    else if(sum < 12'd1070)
        mod107 = sum - 12'd963;
    else if(sum < 12'd1177)
        mod107 = sum - 12'd1070;
    else if(sum < 12'd1284)
        mod107 = sum - 12'd1177;
    else
        mod107 = sum - 12'd1284;     

end
endmodule

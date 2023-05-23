`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 15:14:45
// Design Name: 
// Module Name: modulo103
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


module modulo103(input [31:0] bin, output reg [6:0] mod103);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

assign s31 = bin[31] ? 7'd83 : 7'd0;
assign s30 = bin[30] ? 7'd93 : 7'd0;
assign s29 = bin[29] ? 7'd98 : 7'd0;
assign s28 = bin[28] ? 7'd49 : 7'd0;
assign s27 = bin[27] ? 7'd76 : 7'd0;
assign s26 = bin[26] ? 7'd38 : 7'd0;
assign s25 = bin[25] ? 7'd19 : 7'd0;
assign s24 = bin[24] ? 7'd61 : 7'd0;
assign s23 = bin[23] ? 7'd82 : 7'd0;
assign s22 = bin[22] ? 7'd41 : 7'd0;
assign s21 = bin[21] ? 7'd72 : 7'd0;
assign s20 = bin[20] ? 7'd36 : 7'd0;
assign s19 = bin[19] ? 7'd18 : 7'd0;
assign s18 = bin[18] ? 7'd9 : 7'd0;
assign s17 = bin[17] ? 7'd56 : 7'd0;
assign s16 = bin[16] ? 7'd28 : 7'd0;
assign s15 = bin[15] ? 7'd14 : 7'd0;
assign s14 = bin[14] ? 7'd7 : 7'd0;
assign s13 = bin[13] ? 7'd55 : 7'd0;
assign s12 = bin[12] ? 7'd79 : 7'd0;
assign s11 = bin[11] ? 7'd91 : 7'd0;
assign s10 = bin[10] ? 7'd97 : 7'd0;
assign s9 = bin[9] ? 7'd100 : 7'd0;
assign s8 = bin[8] ? 7'd50 : 7'd0;
assign s7 = bin[7] ? 7'd25 : 7'd0;

assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

always@(*)
begin
    if(sum < 12'd103)
        mod103 = sum;
    else if(sum < 12'd206)
        mod103 = sum - 12'd103;
    else if(sum < 12'd309)
        mod103 = sum - 12'd206;
    else if(sum < 12'd412)
        mod103 = sum - 12'd309;
    else if(sum < 12'd515)
        mod103 = sum - 12'd412;
    else if(sum < 12'd618)
        mod103 = sum - 12'd515;
    else if(sum < 12'd721)
        mod103 = sum - 12'd618;
    else if(sum < 12'd824)
        mod103 = sum - 12'd721;
    else if(sum < 12'd927)
        mod103 = sum - 12'd824;
    else if(sum < 12'd1030)
        mod103 = sum - 12'd927;
    else if(sum < 12'd1133)
        mod103 = sum - 12'd1030;
    else if(sum < 12'd1236)
        mod103 = sum - 12'd1133;
    else if(sum < 12'd1339)
        mod103 = sum - 12'd1236;
    else if(sum < 12'd1442)
        mod103 = sum - 12'd1339;
    else
        mod103 = sum -12'd1442;     

end
endmodule

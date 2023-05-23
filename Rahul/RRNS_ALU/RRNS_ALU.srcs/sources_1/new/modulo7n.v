`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2023 12:23:32
// Design Name: 
// Module Name: modulo7n
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


module modulo7n(input [31:0] bin, output reg [2:0] mod7);
wire [2:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7,s6,s5,s4,s3;
wire [2:0] ss7,ss6,ss5,ss4,ss3;
wire [7:0] sum;
wire [4:0]sum2;

assign s31 = bin[31] ? 3'd5 : 7'd0;
assign s30 = bin[30] ? 3'd1 : 7'd0;
assign s29 = bin[29] ? 3'd4 : 7'd0;
assign s28 = bin[28] ? 3'd2 : 7'd0;
assign s27 = bin[27] ? 3'd1 : 7'd0;
assign s26 = bin[26] ? 3'd4 : 7'd0;
assign s25 = bin[25] ? 3'd2 : 7'd0;
assign s24 = bin[24] ? 3'd1 : 7'd0;
assign s23 = bin[23] ? 3'd4 : 7'd0;
assign s22 = bin[22] ? 3'd2 : 7'd0;
assign s21 = bin[21] ? 3'd1 : 7'd0;
assign s20 = bin[20] ? 3'd4 : 7'd0;
assign s19 = bin[19] ? 3'd2 : 7'd0;
assign s18 = bin[18] ? 3'd1 : 7'd0;
assign s17 = bin[17] ? 3'd4 : 7'd0;
assign s16 = bin[16] ? 3'd2 : 7'd0;
assign s15 = bin[15] ? 3'd1 : 7'd0;
assign s14 = bin[14] ? 3'd4 : 7'd0;
assign s13 = bin[13] ? 3'd2 : 7'd0;
assign s12 = bin[12] ? 3'd1 : 7'd0;
assign s11 = bin[11] ? 3'd4 : 7'd0;
assign s10 = bin[10] ? 3'd2 : 7'd0;
assign s9 = bin[9] ? 3'd1 : 7'd0;
assign s8 = bin[8] ? 3'd4 : 7'd0;
assign s7 = bin[7] ? 3'd2 : 7'd0;
assign s6 = bin[6] ? 3'd1 : 7'd0;
assign s5 = bin[5] ? 3'd4 : 7'd0;
assign s4 = bin[4] ? 3'd2 : 7'd0;
assign s3 = bin[3] ? 3'd1 : 7'd0;

assign sum = bin[2:0]+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

assign ss7 = sum[7] ? 3'd2 : 7'd0;
assign ss6 = sum[6] ? 3'd1 : 7'd0;
assign ss5 = sum[5] ? 3'd4 : 7'd0;
assign ss4 = sum[4] ? 3'd2 : 7'd0;
assign ss3 = sum[3] ? 3'd1 : 7'd0;

assign sum2 = sum[2:0]+ss3+ss4+ss5+ss6+ss7;

always @(*)
begin
    if (sum2<5'd7)
        mod7 = sum2;
    else if (sum2<5'd14)
        mod7 = sum2 - 5'd7;
    else
        mod7 = sum2 - 5'd14;
end
     
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2023 15:46:28
// Design Name: 
// Module Name: modulo101n
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


module modulo101n(input [31:0] bin, output reg [6:0] mod101);
wire [6:0] s31,s30,s29,s28,s27,s26,s25,s24,s23,s22,s21,s20,s19,s18,s17,s16,s15,s14,s13,s12,s11,s10,s9,s8,s7;
wire [10:0] sum;

//refer to modulo101n module to understand the logic
assign s31 = bin[31] ? 7'd67 : 7'd0; // -2^31 mod 101 = 67
assign s30 = bin[30] ? 7'd17 : 7'd0; // 2^30 mod 101 = 17
assign s29 = bin[29] ? 7'd59 : 7'd0; // 2^29 mod 101 = 59
assign s28 = bin[28] ? 7'd80 : 7'd0; // 2^28 mod 101 = 80
assign s27 = bin[27] ? 7'd40 : 7'd0; // 2^27 mod 101 = 40
assign s26 = bin[26] ? 7'd20 : 7'd0; // 2^26 mod 101 = 20
assign s25 = bin[25] ? 7'd10 : 7'd0; // 2^25 mod 101 = 10
assign s24 = bin[24] ? 7'd5 : 7'd0; // 2^24 mod 101 = 5
assign s23 = bin[23] ? 6'd53 : 7'd0; // 2^23 mod 101 = 53
assign s22 = bin[22] ? 7'd77 : 7'd0; // 2^22 mod 101 = 77
assign s21 = bin[21] ? 7'd89 : 7'd0; // 2^21 mod 101 = 89
assign s20 = bin[20] ? 7'd95 : 7'd0; // 2^20 mod 101 = 95
assign s19 = bin[19] ? 7'd98 : 7'd0; // 2^19 mod 101 = 98
assign s18 = bin[18] ? 7'd49 : 7'd0; // 2^18 mod 101 = 49
assign s17 = bin[17] ? 7'd75 : 7'd0; // 2^17 mod 101 = 75
assign s16 = bin[16] ? 7'd88 : 7'd0; // 2^16 mod 101 = 88
assign s15 = bin[15] ? 7'd44 : 7'd0; // 2^15 mod 101 = 44
assign s14 = bin[14] ? 7'd22 : 7'd0; // 2^14 mod 101 = 22
assign s13 = bin[13] ? 7'd11 : 7'd0; // 2^13 mod 101 = 11
assign s12 = bin[12] ? 7'd56 : 7'd0; // 2^12 mod 101 = 56
assign s11 = bin[11] ? 7'd28 : 7'd0; // 2^11 mod 101 = 28
assign s10 = bin[10] ? 7'd14 : 7'd0; // 2^10 mod 101 = 14
assign s9 = bin[9] ? 7'd7 : 7'd0; // 2^9 mod 101 = 7
assign s8 = bin[8] ? 7'd54 : 7'd0; // 2^8 mod 101 = 54
assign s7 = bin[7] ? 7'd27 : 7'd0; // 2^7 mod 101 = 27

// all the modulo weights are added to the sum
assign sum = bin[6:0]+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21+s22+s23+s24+s25+s26+s27+s28+s29+s30+s31;

//proper reduction is done so that the modulo operation give result under 101
always@(*)
begin
    if(sum < 12'd101)
        mod101 = sum;
    else if(sum < 12'd202)
        mod101 = sum - 12'd101;
    else if(sum < 12'd303)
        mod101 = sum - 12'd202;
    else if(sum < 12'd404)
        mod101 = sum - 12'd303;
    else if(sum < 12'd505)
        mod101 = sum - 12'd404;
    else if(sum < 12'd606)
        mod101 = sum - 12'd505;
    else if(sum < 12'd707)
        mod101 = sum - 12'd606;
    else if(sum < 12'd808)
        mod101 = sum - 12'd707;
    else if(sum < 12'd909)
        mod101 = sum - 12'd808;
    else if(sum < 12'd1010)
        mod101 = sum - 12'd909;
    else if(sum < 12'd1111)
        mod101 = sum - 12'd1010;
    else if(sum < 12'd1212)
        mod101 = sum - 12'd1111;
    else
        mod101 = sum - 12'd1212;    

end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.03.2023 18:15:07
// Design Name: 
// Module Name: residue_check
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


module residue_check(input [48:0] res_in, output reg [31:0] bin_out, output reg error);
wire [31:0] b1,b2,b3,b4;
wire [6:0] res101,res103,res107,res109,res113,res127,res128;
wire [6:0] check101,check103_1,check103_2,check107,check109,check113,check127,check128;
wire s1,s2,s3,s4;

assign res101 = res_in[48:42];
assign res103 = res_in[41:35];
assign res107 = res_in[34:28];
assign res109 = res_in[27:21];
assign res113 = res_in[20:14];
assign res127 = res_in[13:7];
assign res128 = res_in[6:0];

//mrc1 takes all the residues except res127 and res128
mrc1 m1(.res101(res101),.res103(res103),.res107(res107),.res109(res109),.res113(res113),.bin_out(b1));
//Now the residues that are ignored initially are calculated again and check with previous values
modulo127n md1(.bin(b1),.mod127(check127));
assign check128 = b1[6:0];
assign s1 = (check127==res127)||(check128==res128); // This bit is high only if alteast one of the residue matches

//mrc1 takes all the residues except res109 and res113
mrc2 m2(.res101(res101),.res103(res103),.res107(res107),.res127(res127),.res128(res128),.bin_out(b2));
//Now the residues that are ignored initially are calculated again and check with previous values
modulo109n md2(.bin(b2),.mod109(check109));
modulo113n md3(.bin(b2),.mod113(check113));
assign s2 = (check109==res109)||(check113==res113);// This bit is high only if alteast one of the residue matches

//mrc1 takes all the residues except res103 and res107
mrc3 m3(.res101(res101),.res109(res109),.res113(res113),.res127(res127),.res128(res128),.bin_out(b3));
//Now the residues that are ignored initially are calculated again and check with previous values
modulo103n md4(.bin(b3),.mod103(check103_1));
modulo107n md5(.bin(b3),.mod107(check107));
assign s3 = (check103_1==res103)||(check107==res107);// This bit is high only if alteast one of the residue matches

//mrc1 takes all the residues except res101 and res103
mrc4 m4(.res107(res107),.res109(res109),.res113(res113),.res127(res127),.res128(res128),.bin_out(b4));
//Now the residues that are ignored initially are calculated again and check with previous values
modulo101n md6(.bin(b4),.mod101(check101));
modulo103n md7(.bin(b4),.mod103(check103_2));
assign s4 = (check101==res101)||(check103_2==res103);// This bit is high only if alteast one of the residue matches


//These s1,s2,s3 and s4 bit are check with this priority and whichever is High then correspong result of that mrc block is passed as output
//If none of them is HIGH, then mrc result corresponding to s1 is passed and error signal is set to HIGH state, indicating the presence of errors in output 
always@(*)
begin
    if (s1)
        begin
        bin_out = b1;
        error = 1'b0;
        end
     else if(s2)
        begin
        bin_out = b2;
        error = 1'b0;
        end
     else if(s3)
        begin
        bin_out = b3;
        error = 1'b0;
        end
     else if(s4)
        begin
        bin_out = b4;
        error = 1'b0;
        end
     else
        begin
        bin_out = b1;
        error = 1'b1;
        end
end

endmodule

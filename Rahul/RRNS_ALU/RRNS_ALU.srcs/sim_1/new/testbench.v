`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 15:00:25
// Design Name: 
// Module Name: testbench
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


module testbench();

wire [31:0] out;
wire error;
reg Add_sub;
reg [48:0] err;
reg [31:0] in,in2;

RRNS_ALU abc(.in1(in),.in2(in2),.sub_add(Add_sub),.in_err(err),.out(out),.error(error));


initial
begin
    in = 32'd0; in2 = 32'd0; err =49'd0;
    Add_sub=0;//For addition
    #2 in = 32'd155; in2 = 32'd130;
    #2 in = 32'd1505; in2 = 32'd1230;
    #2 in = 32'd50489; in2 = 32'd4130;
    #2 in = 32'd405040; in2 = 32'd71630;
    #2 in = 32'd155; in2 = 32'd130; 
    err[48] =1'b1;//single residue error
    #2 in = 32'd1505; in2 = 32'd1230; 
    err[48] =1'b0; err[37] =1'b1;//single residue error
    #2 in = 32'd50489; in2 = 32'd4130; 
    err[37] =1'b0; err[30] =1'b1; //single residue error
    #2 in = 32'd405040; in2 = 32'd71630; 
    err[30] =1'b0; err[25] =1'b1;//single residue error
    Add_sub=1;//For subtraction
    #2 in = 32'd155; in2 = 32'd130; 
    err[25] =1'b0; err[16] =1'b1;//single residue error
    Add_sub=0;//For addition
    #2 in = 32'd1505; in2 = 32'd1230; 
    err[16] =1'b0; err[10] =1'b1;//single residue error
    #2 in = 32'd50489; in2 = 32'd4130; 
    err[10] =1'b0; err[5] =1'b1;//single residue error
    #2 in = 32'd405040; in2 = 32'd71630; 
    err[25] =1'b1;//multiple residue error
    #2 in = 32'd20155; in2 = -1346; err[48] =1'b1; 
    err[25] =1'b0; err[5] =1'b0;//single residue error
    #2 in = 32'd20155; in2 = -1346;
    err[48] =1'b0; err[37] =1'b1;//single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[37] =1'b0; err[30] =1'b1;//single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[30] =1'b0; err[25] =1'b1;//single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[25] =1'b0; err[16] =1'b1;//single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[16] =1'b0; err[10] =1'b1; //single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[10] =1'b0; err[5] =1'b1;//single residue error
    #2 in = 32'd20155; in2 = -1346; 
    err[25] =1'b1;//multiple residue error
    #2 in = 32'd155; in2 = 32'd130; 
    err[25] =1'b0;err[5] =1'b0; err[41:35] =7'b1111111;// multiple bit error in single residue
    #2 $finish;
end
endmodule

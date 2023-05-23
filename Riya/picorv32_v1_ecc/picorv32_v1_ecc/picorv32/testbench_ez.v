// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.

`timescale 1 ns / 1 ps

module testbench;
	reg clk = 1;
	reg resetn = 0;
	wire trap;
reg [48:0] error;


	always #5 clk = ~clk;
	
	initial begin

		error =49'b0;
		 #1230 error[5] = 1'b1; error[48] =1'b1;
	   // #1050 error[5] = 1'b1;
		 #200 error =49'b0;
		 #530 error[5] =1'b1;
		 #60 error =49'b0;
	end

	initial begin
		if ($test$plusargs("vcd")) begin
			$dumpfile("testbench.vcd");
			$dumpvars(0, testbench);
		end
		repeat (100) @(posedge clk);
		resetn <= 1;
		repeat (1000) @(posedge clk);
		$finish;
	end

	wire mem_valid;
	wire mem_instr;
	reg mem_ready;
	wire [31:0] mem_addr;
	wire [31:0] mem_wdata;
	wire [3:0] mem_wstrb;
	reg  [31:0] mem_rdata;
	wire err_occured;

	always @(posedge clk) begin
		if (mem_valid && mem_ready) begin
			if (mem_instr)
				$display("ifetch 0x%08x: 0x%08x", mem_addr, mem_rdata);
			else if (mem_wstrb)
				$display("write  0x%08x: 0x%08x (wstrb=%b)", mem_addr, mem_wdata, mem_wstrb);
			else
				$display("read   0x%08x: 0x%08x", mem_addr, mem_rdata);
		end
	end

	picorv32 #(
	) uut (
		.clk         (clk        ),
		.resetn      (resetn     ),
		.in_err          (error),
		.trap        (trap       ),
		.err(err_occured),
		.mem_valid   (mem_valid  ),
		.mem_instr   (mem_instr  ),
		.mem_ready   (mem_ready  ),
		.mem_addr    (mem_addr   ),
		.mem_wdata   (mem_wdata  ),
		.mem_wstrb   (mem_wstrb  ),
		.mem_rdata   (mem_rdata  )
		
	);

	reg [31:0] memory [0:255];

	initial begin
		memory[0] = 32'h 3fc00093; //       li      x1,1020
		memory[1] = 32'h 0000a023; //       sw      x0,0(x1)
		memory[2] = 32'h 0000a103; // loop: lw      x2,0(x1)
		memory[3] = 32'h 00110113; //       addi    x2,x2,1
		memory[4] = 32'h 0020a023; //       sw      x2,0(x1)
		//memory[5] = // rcc   jalr
	/*	memory[5] = 32'b 00000001001111111100010110110011;  // 013fc5b3
memory[6] = 32'b 00000001011110010011101110110011;  //01793bb3
memory[7] = /*32'b 00000000111000000110001110110011; //*/  //32'h e063b3;
/*memory[8] = /*32'b 00000001001010101101101000110011; //*/ //32'h 12ada33;
/*memory[9] = /*32'b 00000000111001011010100010110011; // 00e5a8b3*/// 32'h e5a8b3;
/*memory[10] = /*32'b 00000000110110010100111100110011; //00d94f33*/ //32'h d94f33;
/*memory[11] = 32'b 00000000110000000000110010110011; //00c00cb3
memory[12] = 32'b 00000001101111011001000110110011;  //01bd91b3
memory[13] = 32'b 00000001000101010011110000110011; //01153c33
memory[14] = 32'b 00000000111111110110011000110011; //00ff6633
memory[15] = 32'b 00000001000110001101011110110011; //0118d7b3
memory[16] = 32'b 00000000011001000010000000110011; //00642033
memory[17] = 32'b 00000000000010101100011000110011; //000ac633
memory[18] = 32'b 00000000011110101000000100110011; //007a8133
memory[19] = 32'b 00000000110100101001110010110011; //00d29cb3
memory[20] = 32'b 00000000111111010011111000110011; //00fd3e33
memory[21] = 32'b 00000001001110011110101000110011; //0139ea33
memory[22] = 32'b 00000001011111110101100100110011; //017f5933 //////////////yha jump ho rha h
memory[23] = 32'b 00000001111001000010100000110011; //01e42833
memory[24] = 32'b 00000001001111111100010110110011; //013fc5b3*/
memory[5] = 32'h ad1cb3;
memory[6] = 32'h 1793bb3;
memory[7] = 32'h e063b3;
memory[8] = 32'h 12ada33;
memory[9] = 32'h e5a8b3;
memory[10] = 32'h d94f33;
memory[11] = 32'h c00cb3;
memory[12] = 32'h 1bd91b3;
memory[13] = 32'h 1153c33;
memory[14] = 32'h ff6633;
memory[15] = 32'h 118d7b3;
memory[16] = 32'h 642033;
memory[17] = 32'h ac633;
memory[18] = 32'h 7a8133;
memory[19] = 32'h d29cb3;
memory[20] = 32'h fd3e33;
memory[21] = 32'h 139ea33;
memory[22] = 32'h 17f5933;
memory[23] = 32'h 1e42833;
memory[24] = 32'h 13fc5b3;
memory[25] = 32'h 360933;
memory[26] = 32'h 1739933;
memory[27] = 32'h 120bb33;
memory[28] = 32'h 9ce2b3;
memory[29] = 32'h 1e3d9b3;
memory[30] = 32'h 144a9b3;
memory[31] = 32'h 168cfb3;
memory[32] = 32'h af0733;
memory[33] = 32'h 49533;
memory[34] = 32'h 13fbc33;
memory[35] = 32'h 2068b3;
memory[36] = 32'h 1dad9b3;
memory[37] = 32'h c72333;
memory[38] = 32'h 264bb3;
memory[39] = 32'h 2c09b3;
memory[40] = 32'h de1933;
memory[41] = 32'h 169bcb3;
memory[42] = 32'h 10169b3;
memory[43] = /*32'h 11e55b3;*/ 32'h af0733;
memory[45] = 32'h 86a033;
memory[46] = 32'h 16744b3;
memory[47] = 32'h 8d0eb3;
memory[48] = 32'h 11f9933;
memory[49] = 32'h 12b3933;
memory[50] = 32'h 9569b3;
memory[51] = 32'h 1465db3;
memory[52] = 32'h ee21b3;
memory[53] = 32'h 3fc3b3;
memory[54] = 32'h 1ec8ab3;
memory[55] = 32'h 13d1f33;
memory[56] = 32'h 122b933;
memory[57] = 32'h 8fef33;
memory[58] = 32'h 1f7d633;
memory[59] = 32'h 792133;
memory[60] = 32'h 54cb3;
memory[61] = 32'h d181b3;
memory[62] = 32'h eb9433;
memory[63] = 32'h 923b33;
memory[64] = 32'h 10b6ab3;
memory[65] = 32'h 17cd7b3;
memory[66] = 32'h 392bb3;
memory[67] = 32'h 186c3b3;
memory[68] = 32'h 15f04b3;
memory[69] = 32'h 13991b3;
memory[70] = 32'h 194b4b3;
memory[71] = 32'h 13fe333;
memory[72] = 32'h 95133;
memory[73] = 32'h 1c02533;
memory[74] = 32'h a4cab3;
memory[75] = 32'h 1fa0d33;
memory[76] = 32'h 1281c33;
memory[77] = 32'h 111ba33;
memory[78] = 32'h bae933;
memory[79] = 32'h 19250b3;
memory[80] = 32'h 9e2833;
memory[81] = 32'h 7f49b3;
memory[82] = 32'h 15c02b3;
memory[83] = 32'h 1e111b3;
memory[84] = 32'h 1ca3433;
memory[85] = 32'h 169eeb3;
memory[86] = 32'h 58de33;
memory[87] = 32'h 54a8b3;
memory[88] = 32'h a4133;
memory[89] = 32'h 1d102b3;
memory[90] = 32'h 8e9f33;
memory[91] = 32'h d13433;
memory[92] = 32'h 161e633;
memory[93] = 32'h 12453b3;
memory[94] = 32'h 1c0a0b3;
memory[95] = 32'h 1e34533;
memory[96] = 32'h 1f385b3;
memory[97] = 32'h 691d33;
memory[98] = 32'h 188b333;
memory[99] = 32'h 19beab3;
memory[100] = 32'h 32dab3;
memory[101] = 32'h ff5ff06f; //       j       <loop>
	end

	always @(posedge clk) begin
		mem_ready <= 0;
		if (mem_valid && !mem_ready) begin
			if (mem_addr < 1024) begin
				mem_ready <= 1;
				mem_rdata <= memory[mem_addr >> 2];
				if (mem_wstrb[0]) memory[mem_addr >> 2][ 7: 0] <= mem_wdata[ 7: 0];
				if (mem_wstrb[1]) memory[mem_addr >> 2][15: 8] <= mem_wdata[15: 8];
				if (mem_wstrb[2]) memory[mem_addr >> 2][23:16] <= mem_wdata[23:16];
				if (mem_wstrb[3]) memory[mem_addr >> 2][31:24] <= mem_wdata[31:24];
			end
			/* add memory-mapped IO here */
		end
	end
endmodule

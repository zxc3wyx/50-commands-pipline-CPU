`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:39 12/02/2019 
// Design Name: 
// Module Name:    D_E_pipeReg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module D_E_pipeReg(
    input [31:0] PCplus4D,
    input [4:0] RsD,
    input [4:0] RtD,
    input [4:0] RdD,
	 input [4:0] shamtD,
    input [31:0] grfRD1D,
    input [31:0] grfRD2D,
    input RegWriteD,
    input MemtoRegD,
    input MemWriteD,
    input [4:0] ALUOpD,
    input ALUSrcD,
    input RegDstD,
	 input jalD,
	 input jalrD,
	 input bgezalrD,
	 input swD,
	 input shD,
	 input sbD,
	 input lwD,
	 input lbD,
	 input lbuD,
	 input lhD,
	 input lhuD,
	 input multD,
	 input multuD,
	 input divD,
	 input divuD,
	 input mfhiD,
	 input mfloD,
	 input mthiD,
	 input mtloD,
	 input maddD,
	 input MDtypeD,
	 input reset,
	 input clk,
	 input [31:0] Imm32D,
	 output reg [31:0]PCplus4E,
    output reg RegWriteE,
    output reg MemtoRegE,
	 output reg MemWriteE,
    output reg [4:0] ALUOpE,
    output reg ALUSrcE,
    output reg RegDstE,
    output reg [4:0] RsE,
    output reg [4:0] RtE,
    output reg [4:0] RdE,
	 output reg [4:0] shamtE,
    output reg [31:0] Imm32E,
    output reg [31:0] grfRD1E,
    output reg [31:0] grfRD2E,
	 output reg jalE,
	 output reg jalrE,
	 output reg bgezalrE,
	 output reg swE,
	 output reg shE,
	 output reg sbE,
	 output reg lwE,
	 output reg lhE,
	 output reg lhuE,
	 output reg lbE,
	 output reg lbuE,
	 output reg multE,
	 output reg multuE,
	 output reg divE,
	 output reg divuE,
	 output reg mfhiE,
	 output reg mfloE,
	 output reg mthiE,
	 output reg mtloE,
	 output reg maddE,
	 output reg MDtypeE
    );
	
	initial	begin 
		PCplus4E <= 0;
		RegWriteE <= 0;
		MemtoRegE <= 0;
		MemWriteE <= 0;
		ALUOpE <= 0;
		ALUSrcE <= 0;
		RegDstE <= 0;
		RsE <= 0;
		RtE <= 0;
		RdE <= 0;
		shamtE <= 0;
		Imm32E <= 0;
		grfRD1E <= 0;
		grfRD2E <= 0;
		jalE <= 0;
		jalrE <= 0;
		swE <= 0;
		shE <= 0;
		sbE <= 0;
		lwE <= 0;
		lhE <= 0;
		lhuE <= 0;
		lbE <= 0;
		lbuE <= 0;
		multE <= 0;
	   multuE <= 0;
	   divE <= 0;
	   divuE <= 0;
	   mfhiE <= 0;
	   mfloE <= 0;
	   mthiE <= 0;
	   mtloE <= 0;
		maddE <= 0;
	   MDtypeE <= 0;
		bgezalrE <= 0;
	end
	
	always @(posedge clk)	begin
		if(reset) begin
			PCplus4E <= 0;
			RegWriteE <= 0;
			MemtoRegE <= 0;
			MemWriteE <= 0;
			ALUOpE <= 0;
			ALUSrcE <= 0;
			RegDstE <= 0;
			RsE <= 0;
			RtE <= 0;
			RdE <= 0;
			shamtE <= 0;
			Imm32E <= 0;
			grfRD1E <= 0;
			grfRD2E <= 0;
			jalE <= 0;
			jalrE <= 0;
			swE <= 0;
			shE <= 0;
			sbE <= 0;
			lwE <= 0;
			lhE <= 0;
			lhuE <= 0;
			lbE <= 0;
			lbuE <= 0;
			multE <= 0;
			multuE <= 0;
			divE <= 0;
			divuE <= 0;
			mfhiE <= 0;
			mfloE <= 0;
			mthiE <= 0;
			mtloE <= 0;
			maddE <= 0;
			MDtypeE <= 0;
			bgezalrE <= 0;
		end
		else begin
			PCplus4E <= PCplus4D;
			RegWriteE <= RegWriteD;
			MemtoRegE <= MemtoRegD;
			MemWriteE <= MemWriteD;
			ALUOpE <= ALUOpD;
			ALUSrcE <= ALUSrcD;
			RegDstE <= RegDstD;
			RsE <= RsD;
			RtE <= RtD;
			RdE <= RdD;
			shamtE <= shamtD;
			Imm32E <= Imm32D;
			grfRD1E <= grfRD1D;
			grfRD2E <= grfRD2D;
			jalE <= jalD;
			jalrE <= jalrD;
			swE <= swD;
			shE <= shD;
			sbE <= sbD;
			lwE <= lwD;
			lhE <= lhD;
			lhuE <= lhuD;
			lbE <= lbD;
			lbuE <= lbuD;
			multE <= multD;
			multuE <= multuD;
			divE <= divD;
			divuE <= divuD;
			mfhiE <= mfhiD;
			mfloE <= mfloD;
			mthiE <= mthiD;
			mtloE <= mtloD;
			maddE <= maddD;
			MDtypeE <= MDtypeD;
			bgezalrE <= bgezalrD;
		end
	end
endmodule

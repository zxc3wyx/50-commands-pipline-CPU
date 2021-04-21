`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:02:25 12/02/2019 
// Design Name: 
// Module Name:    E_M_pipeReg 
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
module E_M_pipeReg(
    input RegWriteE,
    input MemtoRegE,
    input MemWriteE,
    input [4:0] WriteRegE,
    input [31:0] MemWriteDataE,
    input [31:0] ALUresultE,
	 input [31:0] PCplus4E,
	 input jalE,
	 input jalrE,
	 input bgezalrE,
	 input swE,
	 input shE,
	 input sbE,
	 input lwE,
	 input lhE,
	 input lhuE,
	 input lbE,
	 input lbuE,
	 input clk,
	 input reset,
    output reg RegWriteM,
    output reg MemtoRegM,
    output reg MemWriteM,
    output reg [4:0] WriteRegM,
    output reg [31:0] ALUresultM,
    output reg [31:0] MemWriteDataM,
	 output reg [31:0] PCplus4M,
	 output reg jalM,
	 output reg jalrM,
	 output reg bgezalrM,
	 output reg swM,
	 output reg shM,
	 output reg sbM,
	 output reg lwM,
	 output reg lhM,
	 output reg lhuM,
	 output reg lbM,
	 output reg lbuM
    );
	 
	 initial		begin
			RegWriteM <= 0;
			MemtoRegM <= 0;
			MemWriteM <= 0;
			WriteRegM <= 0;
			ALUresultM <= 0;
			MemWriteDataM <= 0;
			PCplus4M <= 0;
			jalM <= 0;
			jalrM <= 0;
			swM <= 0;
			shM <= 0;
			sbM <= 0;
			lwM <= 0;
			lhM <= 0;
			lhuM <= 0;
			lbM <= 0;
			lbuM <= 0;
			bgezalrM <= 0;
	 end
	 
	 always @(posedge clk) begin
			if(reset)	begin
				RegWriteM <= 0;
				MemtoRegM <= 0;
				MemWriteM <= 0;
				WriteRegM <= 0;
				ALUresultM <= 0;
				MemWriteDataM <= 0;
				PCplus4M <= 0;
				jalM <= 0;
				jalrM <= 0;
				swM <= 0;
				shM <= 0;
				sbM <= 0;
				lwM <= 0;
				lhM <= 0;
				lhuM <= 0;
				lbM <= 0;
				lbuM <= 0;
				bgezalrM <= 0;
			end
			else	begin
				RegWriteM <= RegWriteE;
				MemtoRegM <= MemtoRegE;
				MemWriteM <= MemWriteE;
				WriteRegM <= WriteRegE;
				ALUresultM <= ALUresultE;
				MemWriteDataM <= MemWriteDataE;
				PCplus4M <= PCplus4E;
				jalM <= jalE;
				jalrM <= jalrE;
				swM <= swE;
				shM <= shE;
				sbM <= sbE;
				lwM <= lwE;
				lhM <= lhE;
				lhuM <= lhuE;
				lbM <= lbE;
				lbuM <= lbuE;
				bgezalrM <= bgezalrE;
			end
	 end
	 
endmodule

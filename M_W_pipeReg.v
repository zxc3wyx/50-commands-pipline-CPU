`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:18:41 12/02/2019 
// Design Name: 
// Module Name:    M_W_pipeReg 
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
module M_W_pipeReg(
    input RegWriteM,
    input MemtoRegM,
    input [31:0] ALUresultM,
    input [4:0] WriteRegM,
    input [31:0] dmRDM,
	 input [31:0] PCplus4M,
	 input clk,
	 input reset,
	 input jalM,
	 input jalrM,
	 input bgezalrM,
    output reg RegWriteW,
    output reg MemtoRegW,
    output reg [31:0] dmRDW,
    output reg [31:0] ALUresultW,
    output reg [4:0] WriteRegW,
	 output reg [31:0] PCplus4W,
	 output reg jalW,
	 output reg jalrW,
	 output reg bgezalrW
    );
		
		initial 	begin
			RegWriteW <= 0;
			MemtoRegW <= 0;
			dmRDW <= 0;
			ALUresultW <= 0;
			WriteRegW <= 0;
			PCplus4W <= 0;
			jalW <= 0;
			jalrW <= 0;
			bgezalrW <= 0;
		end
		
		always @(posedge clk)	begin
			if(reset) begin
				RegWriteW <= 0;
				MemtoRegW <= 0;
				dmRDW <= 0;
				ALUresultW <= 0;
				WriteRegW <= 0;
				PCplus4W <= 0;
				jalW <= 0;
				jalrW <= 0;
				bgezalrW <= 0;
			end
			else	begin
				RegWriteW <= RegWriteM;
				MemtoRegW <= MemtoRegM;
				dmRDW <= dmRDM;
				ALUresultW <= ALUresultM;
				WriteRegW <= WriteRegM;
				PCplus4W <= PCplus4M;
				jalW <= jalM;
				jalrW <= jalrM;
				bgezalrW <= bgezalrM;
			end
		end

endmodule

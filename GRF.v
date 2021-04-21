`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:41 12/04/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] Read1,
    input [4:0] Read2,
    input [4:0] Write,
    input [31:0] Data,
	 input [31:0]	PCplus4,
    input clk,
    input reset,
    input RegWrite,
    output [31:0] RD1,
    output [31:0] RD2
    );
		reg [31:0] mipsreg[31:0];
		integer i;
		initial begin
			for(i = 0; i < 32; i = i + 1)
			mipsreg[i] = 0;
		end
		assign RD1 = mipsreg[Read1];
		assign RD2 = mipsreg[Read2];
		always @(negedge clk)	begin
			if(reset == 1) begin
				for(i = 0; i < 32; i = i + 1)
				mipsreg[i] = 0;
			end
			else	begin
				if(RegWrite == 1) begin
					if(Write) begin
						mipsreg[Write] <= Data;
						$display("%d@%h: $%d <= %h", $time, PCplus4 - 4 , Write, Data);
					end
				end
			end
		end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:32:24 12/02/2019 
// Design Name: 
// Module Name:    F_D_pipeReg 
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
module F_D_pipeReg(
    input [31:0] InstrF,
    input [31:0] PCplus4F,
    output reg [31:0] PCplus4D,
    output reg [31:0] InstrD,
    input clk,
    input reset,
	 input EN
    );
		initial 	begin
			PCplus4D <= 0;
			InstrD <= 0;
		end
		always @(posedge clk)	begin
			if(reset == 1) begin
				PCplus4D <= 0;
				InstrD <= 0;
			end
			else 	begin
				if(EN) begin
					PCplus4D <= PCplus4F;
					InstrD <= InstrF;
				end
			end
		end
endmodule

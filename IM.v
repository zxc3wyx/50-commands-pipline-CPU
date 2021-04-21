`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:03:52 12/02/2019 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [31:0] PC,
    output [31:0] Instr
    );

		reg [31:0] imReg [4095:0];
		wire [31:0] PCminus3000;
		integer i;
		initial begin
			for(i = 0; i < 4096; i = i + 1)
			imReg[i] = 0;
			$readmemh("code.txt", imReg);
		end
		assign PCminus3000 = PC - 32'h3000;
		assign Instr = imReg[PCminus3000[13:2]];
endmodule

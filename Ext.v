`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:28 12/04/2019 
// Design Name: 
// Module Name:    Ext 
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
module Ext(
    input [15:0] Ext_in,
    input ExtOp,
    output [31:0] Ext_out
    );
		
		assign Ext_out = (ExtOp == 2'b00) ? {16'b0, Ext_in} :
							  (ExtOp == 2'b01) ? {{16{Ext_in[15]}}, Ext_in} :
							  0;

endmodule


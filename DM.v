`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:20:27 12/04/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [31:0] dmaddr,
    input [31:0] data_in,
    input clk,
	 input MemWrite,
    input reset,
	 input sw,
	 input sh,
	 input sb,
	 input lw,
	 input lh,
	 input lhu,
	 input lb,
	 input lbu,
    input [31:0] PCplus4,
    output [31:0] data_out
    );
		
		reg [31:0] dm [4095:0];
		wire [31:0] WriteData;             //写入DM的数据
		wire [31:0] data_read;
		wire half_sel;
		wire [1:0]byte_sel;
		wire [15:0]half_read;
		wire [7:0]byte_read;
		integer i;
		
		initial  begin
			for(i = 0; i < 4096; i = i + 1)
			dm[i] <= 0;
		end
		
		assign data_read = dm[dmaddr[13:2]];
		assign half_sel = dmaddr[1];
		assign byte_sel = dmaddr[1:0];
		assign WriteData = sw ? data_in :
								 sh ? ((half_sel) ? {data_in[15:0], data_read[15:0]} : {data_read[31:16], data_in[15:0]}) :
								 sb ? ((byte_sel == 3) ? {data_in[7:0], data_read[23:0]} : 
										 (byte_sel == 2) ? {data_read[31:24], data_in[7:0], data_read[15:0]} :
										 (byte_sel == 1) ? {data_read[31:16], data_in[7:0], data_read[7:0]} : 
										 {data_read[31:8], data_in[7:0]}) :
								0;
		assign half_read = half_sel ? data_read[31:16] : data_read[15:0];
		assign byte_read = (byte_sel == 3) ? data_read[31:24] :
								 (byte_sel == 2) ? data_read[23:16] :
								 (byte_sel == 1) ? data_read[15:8] :
								 data_read[7:0];
		assign data_out = lw ? data_read :
								lbu ? ({24'b0, byte_read}) :
								lb ? ({{24{byte_read[7]}}, byte_read}) :
								lhu ? ({16'b0, half_read}) :
								lh ? ({{16{half_read[15]}}, half_read}) : 0;
			
		always @(posedge clk)	begin
			if(reset == 1) begin
				for(i = 0; i < 4096; i = i + 1)
				dm[i] = 0;
			end
			else	begin
				if(MemWrite)	begin
					dm[dmaddr[13:2]] <= WriteData;
					$display("%d@%h: *%h <= %h", $time, PCplus4 - 4, {dmaddr[31:2], 2'b0}, WriteData);
					end
			end
		end
		
endmodule

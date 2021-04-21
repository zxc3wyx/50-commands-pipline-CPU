`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:29 12/16/2019 
// Design Name: 
// Module Name:    Mul_Div 
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
module Mul_Div(
    input [31:0] Data1,
    input [31:0] Data2,
	 input mult,
	 input multu,
	 input div,
	 input divu,
    input clk,
    input reset,
	 input mthi,
	 input mtlo,
	 input madd,
    output reg Busy,
	 output reg [31:0] hi,
	 output reg [31:0] lo
    );
	 
	 reg [4:0] counter;
	 reg [63:0] result, remain;
	 reg M, D;							//表示正在进行乘或除

	 initial 	begin
			counter <= 0;
			hi <= 0;
			lo <= 0;
			result <= 0;
			remain <= 0;
			Busy <= 0;
			M <= 0;
			D <= 0;
	 end
	 always @(posedge clk)	begin
			if(reset)	begin
				counter <= 0;
				hi <= 0;
				lo <= 0;
				result <= 0;
				remain <= 0;
				Busy <= 0;
				M <= 0;
				D <= 0;
			end
			else begin
				if(mult)		begin
					//mult
					//result <= $signed($signed(Data1) * $signed(Data2));
					//result <= 
					//result <= $signed(Data1) * $signed(Data2);
					result <= {{32{Data1[31]}}, Data1} * {{32{Data2[31]}}, Data2};
					counter <= 5;
					Busy <= 1;
					M <= 1;
				end
				else if(multu)	begin
					result <= {32'b0, Data1} * {32'b0, Data2};
					counter <= 5;
					Busy <= 1;
					M <= 1;
				end
				else if(madd) begin
					result <= {{32{Data1[31]}}, Data1} * {{32{Data2[31]}}, Data2} + {hi, lo};
					counter <= 5;
					Busy <= 1;
					M <= 1;
				end
				else if(div)	begin
					result <= $signed($signed(Data1) / $signed(Data2));
					remain <= $signed($signed(Data1) % $signed(Data2));
					Busy <= 1;
					D <= 1;
				end
				else if(divu)	begin
					result <= Data1 / Data2;
					remain <= Data1 % Data2;
					counter <= 10;
					Busy <= 1;
					D <= 1;
				end
				else if(mthi)
					hi <= Data1;
				else if(mtlo)
					lo <= Data1;
				else if(counter != 0)							//还在计算
					counter <= counter - 1;
				else if(counter == 0 && Busy)		begin		//	刚刚计算完成
					Busy <= 0;
					if(M)	begin
						hi <= result[63:32];
						lo <= result[31:0];
						M <= 0;
					end
					else if(D)	begin
						hi <= remain[31:0];
						lo <= result[31:0];
						D <= 0;
					end
				end
			end
	 end
endmodule

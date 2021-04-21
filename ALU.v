`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:19:30 12/04/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
	 input [4:0] shamt,
    input [4:0] ALUOp,
	 input [31:0] hi,
	 input [31:0] lo,
    output [31:0] ALUresult
    );
		
		wire [31:0]temp;
		
		assign temp = (A[31]) ? 0 :
						  (A[30]) ? 1 :
						  (A[29]) ? 2 : 
						  (A[28]) ? 3 :
						  (A[27]) ? 4 :
						  (A[26]) ? 5 : 
						  (A[25]) ? 6 :
						  (A[24]) ? 7 :
						  (A[23]) ? 8 : 
						  (A[22]) ? 9 :
						  (A[21]) ? 10 :
						  (A[20]) ? 11 : 
						  (A[19]) ? 12 :
						  (A[18]) ? 13 :
						  (A[17]) ? 14 : 
						  (A[16]) ? 15 :
						  (A[15]) ? 16 :
						  (A[14]) ? 17 :
						  (A[13]) ? 18 : 
						  (A[12]) ? 19 :
						  (A[11]) ? 20 :
						  (A[10]) ? 21 : 
						  (A[9]) ? 22 :
						  (A[8]) ? 23 :
						  (A[7]) ? 24 : 
						  (A[6]) ? 25 :
						  (A[5]) ? 26 :
						  (A[4]) ? 27 : 
						  (A[3]) ? 28 :
						  (A[2]) ? 29 :
						  (A[1]) ? 30 :
						  (A[0]) ? 31 : 32;
						  
		assign ALUresult = (ALUOp == 5'b00000) ? (A + B) :
								 (ALUOp == 5'b00001) ? (A - B) :
								 (ALUOp == 5'b00010) ? (A | B) :			//or
								 (ALUOp == 5'b00011) ? ((A == B) ? 1 : 0) :
								 (ALUOp == 5'b00100) ? (B << 16) : 						//lui
								 (ALUOp == 5'b00101) ? (A & B) :       //and
								 (ALUOp == 5'b00110) ? (A ^ B) :     //xor
								 (ALUOp == 5'b00111) ? ~(A | B) :    //nor
								 (ALUOp == 5'b01000) ? B << shamt :  //sll
								 (ALUOp == 5'b01001) ? B >> shamt :  //srl
								 (ALUOp == 5'b01010) ? $signed($signed(B) >>> shamt) :      //sra
								 (ALUOp == 5'b01011) ? B << A[4:0] :		 //sllv
								 (ALUOp == 5'b01100) ? B >> A[4:0] :		 //srlv
								 (ALUOp == 5'b01101) ? $signed($signed(B) >>> A[4:0]) :				//srav 
								 (ALUOp == 5'b01110) ? ((A < B) ? 1 : 0) :						//sltu | sltiu
								 (ALUOp == 5'b01111) ? ($signed(A) < $signed(B) ? 1 : 0) :  //slt | slti
								 (ALUOp == 5'b10000) ? hi :			//mfhi
								 (ALUOp == 5'b10001) ? lo :			//mflo
								 (ALUOp == 5'b10010) ? temp :
								 0;
 
endmodule

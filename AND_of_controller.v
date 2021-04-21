`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:53 12/04/2019 
// Design Name: 
// Module Name:    AND_of_controller 
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
module AND_of_controller(
    input [5:0] Func,
    input [5:0] Opcode,
	 input [4:0] RtD,
    output addu,
    output subu,
    output ori,
    output lui,
    output lw,
    output sw,
    output beq,
	 output j,
    output jal,
    output jr,
	 output jalr,
	 output sh,
	 output sb,
	 output lh,
	 output lhu,
	 output lb,
	 output lbu,
	 output add,
	 output sub,
	 output And,
	 output Or,
	 output Xor,
	 output Nor,
	 output addiu,
	 output addi,
	 output andi,
	 output xori,
	 output sll,
	 output srl,
	 output sra,
	 output sllv,
	 output srlv,
	 output srav,
	 output slt,
	 output slti,
	 output sltiu,
	 output sltu,
	 output bne,
	 output blez,
	 output bgtz,
	 output bltz,
	 output bgez,
	 output mult,
	 output multu,
	 output div,
	 output divu,
	 output mfhi,
	 output mflo,
	 output mthi,
	 output mtlo,
	 output madd,
	 output clz,
	 output bgezalr
    );
	
		assign addu = (Func == 6'b100001 && Opcode == 6'b0);
		assign subu = (Func == 6'b100011 && Opcode == 6'b0);
		assign ori = (Opcode == 6'b001101);
		assign lui = (Opcode == 6'b001111);
		assign lw = (Opcode == 6'b100011);
		assign sw = (Opcode == 6'b101011);
		assign beq = (Opcode == 6'b000100);
		assign j = (Opcode == 6'b000010);
		assign jal = (Opcode == 6'b000011);
		assign jr = (Func == 6'b001000 && Opcode == 6'b0);
		assign jalr = (Func == 6'b001001 && Opcode == 6'b0);
		assign sh = (Opcode == 6'b101001);
		assign sb = (Opcode == 6'b101000);
		assign lh = (Opcode == 6'b100001);
		assign lhu = (Opcode == 6'b100101);
		assign lb = (Opcode == 6'b100000);
		assign lbu = (Opcode == 6'b100100);
		assign add = (Func == 6'b100000 && Opcode == 6'b0);
		assign sub = (Func == 6'b100010 && Opcode == 6'b0);
		assign And = (Func == 6'b100100 && Opcode == 6'b0);
		assign Or = (Func == 6'b100101 && Opcode == 6'b0);
		assign Xor = (Func == 6'b100110 && Opcode == 6'b0);
		assign Nor = (Func == 6'b100111 && Opcode == 6'b0);
		assign addiu = (Opcode == 6'b001001);
		assign addi = (Opcode == 6'b001000);
		assign andi = (Opcode == 6'b001100);
		assign xori = (Opcode == 6'b001110);
		assign sll = (Opcode == 0 && Func == 0);
		assign srl = (Opcode == 0 && Func == 6'b000010);
		assign sra = (Opcode == 0 && Func == 6'b000011);
		assign sllv = (Opcode == 0 && Func == 6'b000100);
		assign srlv = (Opcode == 0 && Func == 6'b000110);
		assign srav = (Opcode == 0 && Func == 6'b000111);
		assign slt = (Opcode == 0 && Func == 6'b101010);
		assign slti = (Opcode == 6'b001010);
		assign sltiu = (Opcode == 6'b001011);
		assign sltu = (Opcode == 0 && Func == 6'b101011);
		assign bne = (Opcode == 6'b000101);
		assign blez = (Opcode == 6'b000110);
		assign bgtz = (Opcode == 6'b000111);
		assign bltz = (Opcode == 6'b000001 && RtD == 0);
		assign bgez = (Opcode == 6'b000001 && RtD == 1);
		assign mult = (Opcode == 6'b0 && Func == 6'b011000);
		assign multu = (Opcode == 6'b0 && Func == 6'b011001);
		assign div = (Opcode == 6'b0 && Func == 6'b011010);
		assign divu = (Opcode == 6'b0 && Func == 6'b011011);
		assign mfhi = (Opcode == 6'b0 && Func == 6'b010000);
		assign mflo = (Opcode == 6'b0 && Func == 6'b010010);
		assign mthi = (Opcode == 6'b0 && Func == 6'b010001);
		assign mtlo = (Opcode == 6'b0 && Func == 6'b010011);
		assign madd = (Opcode == 6'b011100 && Func == 6'b0);
		assign clz = (Opcode == 6'b011100 && Func == 6'b100000);   //
		assign bgezalr = (Opcode == 6'b111111 && Func == 6'b0);
		
endmodule


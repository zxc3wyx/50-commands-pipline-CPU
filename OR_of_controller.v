`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:55 12/04/2019 
// Design Name: 
// Module Name:    OR_of_controller 
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
module OR_of_controller(
    input addu,
    input subu,
    input ori,
    input lui,
    input lw,
    input sw,
    input beq,
	 input j,
    input jal,
    input jr,
	 input jalr,
	 input sh,
	 input sb,
	 input lh,
	 input lhu,
	 input lb,
	 input lbu,
	 input add,
	 input sub,
	 input And,
	 input Or,
	 input Xor,
	 input Nor,
	 input addiu,
	 input addi,
	 input andi,
	 input xori,
	 input sll,
	 input srl,
	 input sra,
	 input sllv,
	 input srlv,
	 input srav,
	 input slt,
	 input slti,
	 input sltiu,
	 input sltu,
	 input bne,
	 input blez,
	 input bgtz,
	 input bltz,
	 input bgez,
	 input mult,
	 input multu,
	 input div,
	 input divu,
	 input mfhi,
	 input mflo,
	 input mthi,
	 input mtlo,
	 input madd,
	 input clz,
	 input bgezalr,
    output RegDst,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemWrite,
    output jump,
    output branch,
    output ExtOp,
	 output MDtype,									//≥À≥˝¿‡÷∏¡Ó
    output [4:0] ALUOp
    );
	 
		assign RegDst = addu | subu | jalr | add | sub | And | Or | Xor | Nor | sll | srl | sra | sllv | srlv | srav | slt | sltu | mfhi | mflo | clz | bgezalr; 
		assign ALUSrc = ori | sw | lw | lui | sh | sb | lh | lhu | lb | lbu | addiu | addi | andi | xori | slti | sltiu;
		assign MemtoReg = lw | lb | lbu | lh | lhu;
		assign RegWrite = addu | subu | ori | lui | lw | jal | jalr | lh | lhu | lb | lbu | add | sub | And | Or | Xor | Nor | addiu | addi | andi | xori
		| sll | srl | sra | sllv | srlv | srav | slt | sltu | slti | sltiu | mfhi | mflo | clz | bgezalr;
		assign MemWrite = sw | sh | sb;
		assign jump = j | jal | jr ;
		assign branch = beq | bne | blez | bgtz | bltz | bgez;
		assign ExtOp = sw | lw | sh | sb | lh | lhu | lb | lbu | addi | addiu | slti | sltiu;
		assign ALUOp = {/*bit4*/{mfhi | mflo | clz}, /*bit3*/{sll | srl | sra | sllv | srlv | srav | slt | slti | sltiu | sltu},
		/*bit2*/{lui | And | andi | Xor | xori | Nor | srlv | srav |slt | slti | sltiu | sltu}, /*bit1*/{ori | beq | Xor | xori | Nor | Or | sra | sllv | slt | slti | sltiu | sltu | clz}, 
		/*bit0*/{subu | beq | And | andi | Nor | sub | srl | sllv | srav | slt | slti | mflo}};
		assign MDtype = mult | multu | div | divu | mfhi | mflo | mthi | mtlo | madd;
		
endmodule

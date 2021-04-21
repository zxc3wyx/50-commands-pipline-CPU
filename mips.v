`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:51:16 12/02/2019 
// Design Name: 
// Module Name:    mips 
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
module mips( 
    input clk,
    input reset
    );

		reg [31:0]PC;
		wire [31:0]InstrF, npc, PCplus4F, jrdist, jaldist, branchdist, jalrdist, bgezalrdist;
		wire StallF, beq_judge, bne_judge, blez_judge, bgtz_judge, bltz_judge, bgez_judge, bgezalr_judge;
		wire StallD, jumpD, branchD, jr, jalr, bgezalr;
		initial PC = 32'h3000;
		IM Myim(
		.PC(PC),
		.Instr(InstrF));
		always @(posedge clk) begin
			if(reset)
			PC <= 32'h3000;
			else	begin
				if(!StallF)
				PC <= npc;
			end	
		end
		assign PCplus4F = PC + 4;
		assign npc = (bgezalr && bgezalr_judge) ? bgezalrdist :
						 jalr ? jalrdist :
						 jumpD ? (jr ? jrdist : jaldist) :
						 (branchD && 
						 ((beq&&beq_judge)||(bne&&bne_judge)||(blez&&blez_judge)||(bgtz&&bgtz_judge)||(bltz&&bltz_judge)||(bgez&&bgez_judge))) ? branchdist :
						 PCplus4F;
						 
		wire [31:0] InstrD, PCplus4D;
		
		
		F_D_pipeReg Myf_d(
		.InstrF(InstrF),
		.clk(clk),
		.reset(reset),
		.PCplus4F(PCplus4F),
		.PCplus4D(PCplus4D),
		.InstrD(InstrD),
		.EN(!StallD));
		
		wire addu, subu, ori, lui, lw, sw, beq, j, jal, sh, sb, lb, lbu, lh, lhu;          //Connect AND & OR
		wire add, sub, And, Or, Xor, Nor, addiu, addi, andi, xori, sll, srl, sra, sllv, srlv, srav, slt, slti, sltiu,
		sltu, bne, blez, bgtz, bltz, bgez, mult, multu, div, divu, mfhi, mflo, mthi, mtlo, madd, clz;
		wire lbE, lbuE, lhE, lhuE, lwE;
		wire lbM, lbuM, lhM, lhuM, lwM;
		wire [4:0] RtD;
		
		AND_of_controller Myctra(
		.Opcode(InstrD[31:26]),
		.Func(InstrD[5:0]),
		.RtD(RtD),
		.addu(addu),
		.subu(subu),
		.ori(ori),
		.lui(lui),
		.lw(lw),
		.sw(sw),
		.beq(beq),
		.j(j),
		.jal(jal),
		.jr(jr),
		.jalr(jalr),
		.sh(sh),
		.sb(sb),
		.lb(lb),
		.lbu(lbu),
		.lh(lh),
		.lhu(lhu),
		.add(add),
		.sub(sub),
		.And(And),
		.Or(Or),
		.Xor(Xor),
		.Nor(Nor),
		.addiu(addiu),
		.addi(addi),
		.andi(andi),
		.xori(xori),
		.sll(sll),
		.srl(srl),
		.sra(sra),
		.sllv(sllv),
		.srlv(srlv),
		.srav(srav),
		.slt(slt),
		.slti(slti),
		.sltiu(sltiu),
		.sltu(sltu),
		.bne(bne),
		.blez(blez),
		.bgtz(bgtz),
		.bltz(bltz),
		.bgez(bgez),
		.mult(mult),
		.multu(multu),
		.div(div),
		.divu(divu),
		.mfhi(mfhi),
		.mflo(mflo),
		.mthi(mthi),
		.mtlo(mtlo),
		.madd(madd),
		.clz(clz),
		.bgezalr(bgezalr));
		
		wire RegWriteD, MemtoRegD, MemWriteD, ALUSrcD, RegDstD, ExtOp, MDtypeD;
		wire jalE, jalM, jalW;
		wire jalrE, jalrM, jalrW;
		wire bgezalrE, bgezalrM, bgezalrW;
		wire MDtypeE, multE, multuE, divE, divuE, mfhiE, mfloE, mthiE, mtloE, maddE;
		wire swE, swM, shE, shM, sbE, sbM;
		wire start;						//	表示乘除模块刚开始工作
		wire [4:0] ALUOpD;
		
		assign start = multE | multuE | divE | divuE | maddE;
		
		OR_of_controller Myctrb(
		.addu(addu),
		.subu(subu),
		.ori(ori),
		.lui(lui),
		.lw(lw),
		.sw(sw),
		.beq(beq),
		.j(j),
		.jal(jal),
		.jr(jr),
		.jalr(jalr),
		.sh(sh),
		.sb(sb),
		.lh(lh),
		.lhu(lhu),
		.lb(lb),
		.lbu(lbu),
		.add(add),
		.sub(sub),
		.And(And),
		.Or(Or),
		.Xor(Xor),
		.Nor(Nor),
		.addiu(addiu),
		.addi(addi),
		.andi(andi),
		.xori(xori),
		.sll(sll),
		.srl(srl),
		.sra(sra),
		.sllv(sllv),
		.srlv(srlv),
		.srav(srav),
		.slt(slt),
		.slti(slti),
		.sltiu(sltiu),
		.sltu(sltu),
		.bne(bne),
		.blez(blez),
		.bgtz(bgtz),
		.bltz(bltz),
		.bgez(bgez),
		.mult(mult),
		.multu(multu),
		.div(div),
		.divu(divu),
		.mfhi(mfhi),
		.mflo(mflo),
		.mthi(mthi),
		.mtlo(mtlo),
		.madd(madd),
		.clz(clz),
		.bgezalr(bgezalr),
		.RegWrite(RegWriteD),
		.MemtoReg(MemtoRegD),
		.MemWrite(MemWriteD),
		.ALUOp(ALUOpD),
		.ALUSrc(ALUSrcD),
		.RegDst(RegDstD),
		.branch(branchD),
		.ExtOp(ExtOp),
		.jump(jumpD),
		.MDtype(MDtype));
		
		wire [31:0]grfRD1D, grfRD2D, ResultW, Imm32D, Imm32E, PCplus4W;
		wire [4:0]WriteRegW, RsD, RdD, shamtD;
		wire RegWriteW;
		assign RsD = InstrD[25:21];
		assign RtD = InstrD[20:16];
		assign RdD = InstrD[15:11];
		assign shamtD = InstrD[10:6];
		GRF Mygrf(
		.Read1(RsD),
		.Read2(RtD),
		.Write(WriteRegW),
      .Data(ResultW),
	   .PCplus4(PCplus4W),
      .clk(clk),
      .reset(reset),
      .RegWrite(RegWriteW),
      .RD1(grfRD1D),
      .RD2(grfRD2D));
		
		assign branchdist = PCplus4D + {{14{InstrD[15]}}, InstrD[15:0], 2'b0};
		assign jrdist = (ForwardAD == 1) ? ResultW :
							(ForwardAD == 2) ? ALUresultM :
							(ForwardAD == 0) ? grfRD1D : 0;
		
		assign jalrdist = (ForwardAD == 2) ? ALUresultM :
								(ForwardAD == 1) ? ResultW :
								(ForwardAD == 0) ? grfRD1D : 0;
								
		assign bgezalrdist = (ForwardBD == 2) ? ALUresultM :
									(ForwardBD == 1) ? ResultW :
									(ForwardBD == 0) ? grfRD2D : 0;
								 
		assign jaldist = {PCplus4D[31:28], InstrD[25:0], 2'b0};
		wire [15:0] Ext_in;
		wire [31:0] Ext_out;
		assign Ext_in = InstrD[15:0];
		
		Ext Myext(
		.Ext_in(InstrD[15:0]),
		.ExtOp(ExtOp),
		.Ext_out(Ext_out));
		
		assign Imm32D = Ext_out;
		wire [31:0]PCplus4E, grfRD1E, grfRD2E;
		wire [4:0] RsE, RtE, RdE, shamtE;
		wire RegWriteE, MemtoRegE, ALUSrcE, RegDstE, FlushE, MemWriteE, Busy;
		wire [4:0]ALUOpE;
		D_E_pipeReg Myd_e(
		.PCplus4D(PCplus4D),
		.RsD(RsD),
		.RtD(RtD),
		.RdD(RdD),
		.shamtD(shamtD),
		.grfRD1D(grfRD1D),
		.grfRD2D(grfRD2D),
		.RegWriteD(RegWriteD),
		.MemtoRegD(MemtoRegD),
		.MemWriteD(MemWriteD),
		.ALUOpD(ALUOpD),
		.ALUSrcD(ALUSrcD),
		.RegDstD(RegDstD),
		.reset(reset || FlushE),
		.clk(clk),
		.jalD(jal),
		.jalrD(jalr),
		.bgezalrD(bgezalr),
		.Imm32D(Imm32D),
		.swD(sw),
		.shD(sh),
		.sbD(sb),
		.lwD(lw),
		.lhD(lh),
		.lhuD(lhu),
		.lbD(lb),
		.lbuD(lbu),
		.multD(mult),
		.multuD(multu),
		.divD(div),
		.divuD(divu),
		.mfhiD(mfhi),
		.mfloD(mflo),
		.mthiD(mthi),
		.mtloD(mtlo),
		.maddD(madd),
		.MDtypeD(MDtype),
	   .PCplus4E(PCplus4E),
      .RegWriteE(RegWriteE),
      .MemtoRegE(MemtoRegE),
		.MemWriteE(MemWriteE),
      .ALUOpE(ALUOpE),
      .ALUSrcE(ALUSrcE),
      .RegDstE(RegDstE),
      .RsE(RsE),
      .RtE(RtE),
      .RdE(RdE),
		.shamtE(shamtE),
      .Imm32E(Imm32E),
      .grfRD1E(grfRD1E),
      .grfRD2E(grfRD2E),
		.jalE(jalE),
		.jalrE(jalrE),
		.bgezalrE(bgezalrE),
		.swE(swE),
		.shE(shE),
		.sbE(sbE),
		.lwE(lwE),
		.lhE(lhE),
		.lhuE(lhuE),
		.lbE(lbE),
		.lbuE(lbuE),
		.multE(multE),
		.multuE(multuE),
		.divE(divE),
		.divuE(divuE),
		.mfhiE(mfhiE),
		.mfloE(mfloE),
		.mthiE(mthiE),
		.mtloE(mtloE),
		.maddE(maddE),
		.MDtypeE(MDtypeE));
		
		wire [31:0]alusrcA, alusrcB1, alusrcB2, ALUresultE, ALUresultM;         //B1为选择之前，B2为选择之后
		wire [31:0]hi, lo;
		wire [1:0]ForwardAE, ForwardBE;
		ALU Myalu(
		.A(alusrcA),
		.B(alusrcB2),
		.ALUOp(ALUOpE),
		.shamt(shamtE),
		.hi(hi),
		.lo(lo),
		.ALUresult(ALUresultE));
		
		Mul_Div Mymd(.Data1(alusrcA),
						 .Data2(alusrcB1),
						 .mult(multE),
						 .multu(multuE),
						 .div(divE),
						 .divu(divuE),
						 .mthi(mthiE),
						 .mtlo(mtloE),
						 .madd(maddE),
						 .clk(clk),
						 .reset(reset),
						 .Busy(Busy),
						 .hi(hi),
						 .lo(lo));
		
		assign alusrcA = (ForwardAE == 2) ? ALUresultM : 
								(ForwardAE == 1) ? ResultW :
								(ForwardAE == 0) ? grfRD1E : 0;
		assign alusrcB1 = (ForwardBE == 2) ? ALUresultM : 
								(ForwardBE == 1) ? ResultW :
								(ForwardBE == 0) ? grfRD2E : 0;
		assign alusrcB2 = (ALUSrcE) ? Imm32E : alusrcB1;
		
		wire [4:0] WriteRegE, WriteRegM;
		wire [31:0] PCplus4M, MemWriteDataM;
		wire RegWriteM, MemtoRegM, MemWriteM;
		
		assign WriteRegE = jalE ? 31 : 
								 RegDstE ? RdE : RtE;
		E_M_pipeReg Mye_m(
		.RegWriteE(RegWriteE),
      .MemtoRegE(MemtoRegE),
      .MemWriteE(MemWriteE),
      .WriteRegE(WriteRegE),
      .MemWriteDataE(alusrcB1),
      .ALUresultE(ALUresultE),
		.PCplus4E(PCplus4E),
	   .clk(clk),
	   .reset(reset),
		.jalE(jalE),
		.jalrE(jalrE),
		.bgezalrE(bgezalrE),
		.swE(swE),
		.shE(shE),
		.sbE(sbE),
		.lwE(lwE),
		.lhE(lhE),
		.lhuE(lhuE),
		.lbE(lbE),
		.lbuE(lbuE),
      .RegWriteM(RegWriteM),
      .MemtoRegM(MemtoRegM),
      .MemWriteM(MemWriteM),
      .WriteRegM(WriteRegM),
      .ALUresultM(ALUresultM),
		.PCplus4M(PCplus4M),
      .MemWriteDataM(MemWriteDataM),
		.jalM(jalM),
		.jalrM(jalrM),
		.bgezalrM(bgezalrM),
		.swM(swM),
		.shM(shM),
		.sbM(sbM),
		.lwM(lwM),
		.lhM(lhM),
		.lhuM(lhuM),
		.lbM(lbM),
		.lbuM(lbuM));
		
		wire [31:0]dmRDM;
		DM Mydm(
		.dmaddr(ALUresultM),
      .data_in(MemWriteDataM),
      .clk(clk),
	   .MemWrite(MemWriteM),
		.sw(swM),
		.sh(shM),
		.sb(sbM),
		.lw(lwM),
		.lh(lhM),
		.lhu(lhuM),
		.lb(lbM),
		.lbu(lbuM),
      .reset(reset),
      .PCplus4(PCplus4M),
      .data_out(dmRDM));
		
		wire MemtoRegW;
		wire [31:0] ALUresultW, dmRDW;
		M_W_pipeReg Mym_w(
		.RegWriteM(RegWriteM),
      .MemtoRegM(MemtoRegM),
      .ALUresultM(ALUresultM),
      .WriteRegM(WriteRegM),
      .dmRDM(dmRDM),
	   .PCplus4M(PCplus4M),
	   .clk(clk),
	   .reset(reset),
		.jalM(jalM),
		.jalrM(jalrM),
		.bgezalrM(bgezalrM),
      .RegWriteW(RegWriteW),
      .MemtoRegW(MemtoRegW),
      .dmRDW(dmRDW),
      .ALUresultW(ALUresultW),
      .WriteRegW(WriteRegW),
	   .PCplus4W(PCplus4W),
		.jalW(jalW),
		.jalrW(jalrW),
		.bgezalrW(bgezalrW));
		
		assign ResultW =  (jalW | jalrW | bgezalr) ? PCplus4W + 4 :
								(MemtoRegW) ? dmRDW : ALUresultW;
			
		
		wire [1:0]ForwardAD, ForwardBD;
		Hazard_Unit Myhazard(
		 .RsE(RsE),
       .RtE(RtE),
       .WriteRegE(WriteRegE),
       .WriteRegM(WriteRegM),
       .WriteRegW(WriteRegW),
       .RegWriteE(RegWriteE),
       .RegWriteM(RegWriteM),
       .RegWriteW(RegWriteW),
	    .MemtoRegE(MemtoRegE),
		 .MemtoRegM(MemtoRegM),
       .beqD(branchD),
	    .jalE(jalE),
		 .jalM(jalM),
		 .jalrE(jalrE),
		 .jalrM(jalrM),
		 .jrD(jr),
		 .jalrD(jalr),
		 .bgezalrD(bgezalr),
		 .bgezalrE(bgezalrE),
		 .bgezalrM(bgezalrM),
		 .Busy(Busy),
		 .start(start),
		 .MDtype(MDtype),
	    .MemWriteD(MemWriteD),
	    .RsD(RsD),
	    .RtD(RtD),
       .StallF(StallF),
       .StallD(StallD),
	    .FlushE(FlushE),
       .ForwardAD(ForwardAD),
       .ForwardBD(ForwardBD),
       .ForwardAE(ForwardAE),
       .ForwardBE(ForwardBE));
		 
		 wire [31:0]compareA, compareB;
		 
		assign compareA = (ForwardAD == 1) ? ResultW :
								 (ForwardAD == 2) ? ALUresultM :
								 (ForwardAD == 3) ? PCplus4M + 4 :
								 (ForwardAD == 0) ? grfRD1D : 0;
								 
		assign compareB = (ForwardBD == 1) ? ResultW :
								 (ForwardBD == 2) ? ALUresultM :
								 (ForwardBD == 3) ? PCplus4M + 4 :
								 (ForwardBD == 0) ? grfRD2D : 0;
		assign beq_judge = (compareA == compareB);
		assign bne_judge = ~beq_judge;
		assign blez_judge = (compareA == 0 || compareA[31]);
		assign bgtz_judge = (compareA != 0 && compareA[31] == 0);
		assign bltz_judge = compareA[31];
		assign bgez_judge = ~bltz_judge;
		assign bgezalr_judge = bgez_judge;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:53:47 12/02/2019 
// Design Name: 
// Module Name:    Hazard_Unit 
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
module Hazard_Unit(
    input [4:0] RsE,
    input [4:0] RtE,
    input [4:0] WriteRegE,
    input [4:0] WriteRegM,
    input [4:0] WriteRegW,
    input RegWriteE,
    input RegWriteM,
    input RegWriteW,
	 input MemtoRegE,
	 input MemtoRegM,
    input beqD,
	 input jalE,
	 input jalM,
	 input jalrE,
	 input jalrM,
	 input jrD,
	 input jalrD,
	 input bgezalrD,
	 input bgezalrE,
	 input bgezalrM,
	 input MemWriteD,
	 input [4:0] RsD,
	 input [4:0] RtD,
	 input Busy,
	 input start,
	 input MDtype,
    output StallF,
    output StallD,
	 output FlushE,
    output [1:0]ForwardAD,
    output [1:0]ForwardBD,
    output [1:0] ForwardAE,
    output [1:0] ForwardBE
    );
		
		wire lwstall, branchstall, jalstall, jalrstall, muldivstall, bgezalrstall;
		assign ForwardAE = (RsE && (RsE == WriteRegM && RegWriteM)) ? 2'b10 :        //M to E
								 (RsE && (RsE == WriteRegW && RegWriteW)) ? 2'b01 :        //W to E
								 0;
								 
		assign ForwardBE = (RtE && (RtE == WriteRegM && RegWriteM)) ? 2'b10 :        //M to E
								 (RtE && (RtE == WriteRegW && RegWriteW)) ? 2'b01 :        //W to E
								 0;
								 
		assign ForwardAD = (jalM && RsD == 31) ? 2'b11 :                             //Mjal to D
								 (RsD && (RsD == WriteRegM && RegWriteM)) ? 2'b10 :		  //M to D
								 (RsD && (RsD == WriteRegW && RegWriteW)) ? 2'b01 :		  //W to D
								 0;
								 
		assign ForwardBD = (jalM && RtD == 31) ? 2'b11 :                             //Mjal to D
								 (RtD && (RtD == WriteRegM && RegWriteM)) ? 2'b10 :		  //M to D
								 (RtD && (RtD == WriteRegW && RegWriteW)) ? 2'b01 :		  //W to D
								 0;
				 
		assign lwstall = MemtoRegE && (RsD == RtE || RtD == RtE) && RtE;
		assign branchstall = (beqD && ((RsD == WriteRegE) || (RtD == WriteRegE)) && WriteRegE && RegWriteE)
									||(beqD && ((RsD == WriteRegM) || (RtD == WriteRegM)) && MemtoRegM && WriteRegM);
									
		assign jalstall = jalE && (RsD == 31 || RtD == 31);

		assign jrstall = (jrD && (RegWriteE && WriteRegE == RsD) && RsD)
							  ||(jrD && (MemtoRegM && WriteRegM == RsD) && RsD);
		
		assign jalrstall = (jalrM && (RsD == WriteRegM || RtD == WriteRegM))
								||(jalrE && (RsD == WriteRegE || RtD == WriteRegE))
								||(jalrD && (RegWriteE && WriteRegE == RsD) && RsD)
							  ||(jalrD && (MemtoRegM && WriteRegM == RsD) && RsD)
							  ||(jalrD && jalM && RsD == 31);
							  
		assign bgezalrstall = (bgezalrM && (RsD == WriteRegM || RtD == WriteRegM))
								||(bgezalrE && (RsD == WriteRegE || RtD == WriteRegE))
								||(bgezalrD && (RegWriteE && WriteRegE == RtD) && RtD)
							  ||(bgezalrD && (MemtoRegM && WriteRegM == RtD) && RtD)
							  ||(bgezalrD && jalM && RtD == 31);
							  
		assign muldivstall = (Busy||start) && MDtype;
		assign StallF = lwstall || branchstall || jalstall || jrstall || jalrstall || muldivstall || bgezalrstall;
		assign StallD = lwstall || branchstall || jalstall || jrstall || jalrstall || muldivstall || bgezalrstall;
		assign FlushE = lwstall || branchstall || jalstall || jrstall || jalrstall || muldivstall || bgezalrstall;
endmodule

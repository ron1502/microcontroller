
module microcontroller(clk, reset, ioPort1Val, ioPort0Val);
	input wire clk, reset;
	input wire[15:0] ioPort1Val;
	output wire[15:0] ioPort0Val;
	
	wire[15:0] bus;
	
	parameter R0 = 6'd0, R1 = 6'd1, R2 = 6'd2, R3 = 6'd3, P0 = 6'd4, P1 = 6'd4;
	

	
	//PC signals
	wire count, PCoutEn;
	
	//MAR signals
	wire marLoad;
	wire [15:0] address;
	
	//MEM signals
	wire memEn, R_W, MFC;
	
	//MDR signals
	wire[15:0] mdrDataIn, mdrDataOut; 
	wire mdrReadEn, mdrWriteEn, mdrROutEn;
	
	//IR signals
	wire irBusEn;
	wire[15:0] instruction;
	
	//DECODER signals
	wire ALUstr, MOVstr, LDSRstr;
	wire IRiEn, IRjEn, BRjEn;
	wire [3:0] index;
	wire[3:0] opCode;
	
	//All register signals
	wire RrEn, RwEn;
	
	//Register signals
	wire [3:0] RegIndex; 
	wire RegREn, RegWEn;
	
	//Port 0 signals
	wire p0REn, p0WEn;
	
	// Port 1 signals
	wire p1REn;

	//Register resolver
	reg[3:0] lastIndex;
	
	assign RegIndex = (index >= R0 || index <= R3) ? index : R0;
	
	assign RegREn = (RegIndex == index) ? RrEn : 0;
	assign RegWEn = (RegIndex == index) ? RwEn : 0;
	
	always @(index) lastIndex <= index;
	
	assign p0REn = (lastIndex == P0) ? RrEn : 0;
	assign p0WEn = (lastIndex == P0) ? RwEn : 0;
		
	assign p1REn = (lastIndex == P1) ? RrEn : 0;
	
	//Instruction Fetch signals
	wire IF, IR, IFR_W, IFMemEn, IFmarLoad, IFmdrReadEn, IFmdrROutEn;
	wire ALU_IF, MOV_IF, LdSr_IF;
	//ALU signals
	wire ALUEnIn1, ALUEnIn2, ALUOutEn;
	wire ALUIRiEn, ALUIRjEn, ALUBRjEn, ALURrEn, ALURwEn;
	
	//MOV signals
	wire MOVIRiEn, MOVIRjEn, MOVBRjEn, MOVRrEn, MOVRwEn;
	
	//LdSr signals
	wire LdSrDIRiEn, LdSrDIRjEn, LdSrRrEn, LdSrRwEn, LdSrMARload;
	wire LdSrMDRreadEn, LdSrMDRrOutEn, LdSrMEMR_W, LdSrMEMEn;
	
	PC pc(reset, count, PCoutEn, bus);
	
	MAR mar(bus, marLoad, address, reset);
	
	MEM mem(address, mdrDataOut, mdrDataIn, MFC, R_W, memEn, reset);
	
	MDR mdr(bus, mdrDataIn, mdrDataOut, mdrReadEn, mdrWriteEn, mdrROutEn, reset);
	
	IR ir(bus, irBusEn, instruction, reset);
	
	IF insFetch(reset, clk, IF, IR, count, PCoutEn, IFmarLoad, irBusEn,
				IFR_W, IFMemEn, IFmdrReadEn, IFmdrROutEn, MFC);
				
	decoder D(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);
	
	MOVFSM movFSM(clk, reset, MOVstr, opCode, MOV_IF, MOVIRiEn, MOVIRjEn, MOVBRjEn, MOVRrEn, MOVRwEn);
	
	register R(RegIndex, bus, RegREn, RegWEn, reset);
	
	ALU aluUnit(bus, ALUEnIn1, ALUEnIn2, opCode, ALUOutEn, reset);
	
	ALU_FSM aluFSM(clk, reset, ALUstr, opCode, ALUIRiEn, ALUIRjEn, ALUBRjEn, ALURrEn, ALURwEn,
			ALUEnIn1, ALUEnIn2, ALUOutEn, ALU_IF);
			
	LdSr_FSM ldSrFSM(clk, reset, LDSRstr, LdSrDIRiEn, LdSrDIRjEn, opCode, LdSrRrEn, LdSrRwEn, LdSrMARload,
					 mdrWriteEn, LdSrMDRreadEn, LdSrMDRrOutEn, LdSrMEMR_W, LdSrMEMEn, MFC, LdSr_IF);
	
	IOPort0 port0(ioPort0Val, bus, p0REn, p0WEn, reset);
	IOPort1 port1(bus, p1REn, ioPort1Val);

	assign IF = ALU_IF || MOV_IF || LdSr_IF;
	
	assign IRiEn = (ALUIRiEn || MOVIRiEn || LdSrDIRiEn);
	assign IRjEn = (ALUIRjEn || MOVIRjEn || LdSrDIRjEn);
	assign BRjEn = (ALUBRjEn || MOVBRjEn);
	assign RrEn = (ALURrEn || MOVRrEn || LdSrRrEn);
	assign RwEn = (ALURwEn || MOVRwEn || LdSrRwEn);
	assign memEn = (IFMemEn || LdSrMEMEn);
	assign R_W = (IFR_W || LdSrMEMR_W);
	assign marLoad = (IFmarLoad || LdSrMARload);
	assign mdrReadEn = (IFmdrReadEn || LdSrMDRreadEn);
	assign mdrROutEn = (IFmdrROutEn || LdSrMDRrOutEn);
	
endmodule
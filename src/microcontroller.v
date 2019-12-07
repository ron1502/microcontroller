
module microcontroller(clk, reset, ioPort1Val, ioPort0Val);
	input wire clk, reset;
	input wire[15:0] ioPort1Val;
	output reg[15:0] ioPort0Val;
	
	wire[15:0] bus;
	
	
	//Instruction Fetch signals
	wire IF, IR;
	
	//PC signals
	wire count, PCoutEn;
	
	//MAR signals
	wire marLoad;
	
	//MEM signals
	wire memEn, R_W, MFC;
	
	//MDR signals
	wire mdrDataIn, mdrDataOut, mdrReadEn, mdrWriteEn, mdrROutEn;
	
	//IR signals
	wire irBusEn;
	wire[15:0] instruction;
	
	PC pc(reset, count, PCoutEn, bus);
	
	MAR mar(bus, marLoad, address, reset);
	
	MEM mem(address, mdrDataOut, mdrDataIn, MFC, R_W, memEn, reset);
	
	MDR mdr(bus, mdrDataIn, mdrDataOut, mdrReadEn, mdrWriteEn, mdrROutEn, reset);
	
	IR ir(bus, irBusEn, instruction, reset);
	
	IF insFetch(reset, clk, IF, IR, count, PCoutEn, marLoad, irBusEn,
				R_W, memEn, mdrReadEn, mdrROutEn, MFC);
endmodule
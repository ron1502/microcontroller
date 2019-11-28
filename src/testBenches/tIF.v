
module tIF;
	reg clk;
	reg reset;
	
	reg count, pcOutEn;
	PC pc(reset, count, pcOutEn, bus);
	
	reg marLoad;
	wire [15:0] address;
	MAR mar(bus, marLoad, address, reset);
	
	wire[15:0] mdrDReadIn; 
	wire[15:0] mdrDWriteOut;
	reg mdrReadEn, mdrWriteEn, mdrROutEn;
	MDR mdr(bus, mdrDReadIn, mdrDWriteOut, mdrReadEn, mdrWriteEn, mdrROutEn, reset);
	
	wire MFC;
	reg R_W, memEn;
	MEM mem(address, mdrDWriteOut, mdrDReadIn, MFC, R_W, memEn, reset);
	
	reg irBusEn;
	wire[15:0] instruction;
	IR ir(bus, irBusEn, instruction, reset);
	
	wire IF, IR;
	IF instFetch(reset, clk, IF, IR, pcCount, pcOutEn, marLoad,
		  R_W, memEn, mdrReadEn, mdrROutEn);
	
	initial
	begin
		clk = 0;
		reset = 1;
		#10 //wait for an entire period;
		reset = 0;
		#100 //wait for data to be retrived;
		$finish;
	end
	
	always #5 clk = ~clk;
	
endmodule
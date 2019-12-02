
module tLdSr_FSM;

	reg clk, reset;
	wire[15:0] bus;
	
	// Instruction Fetch signals
	reg IR;
	reg[15:0] instruction;
	
	// Decoder signals
	wire[3:0] opCode;
	wire ALUstr, MOVstr, LDSRstr;
	wire IRiEn, IRjEn, BRjEn;
	wire IF;
	
	//register signals
	wire[3:0] index;
	wire rEn, wEn;
	
	// MAR signals
	wire load;
	wire[15:0] address;
	
	// MDR signals
	wire [15:0] dReadIn, dToWriteOut;
	wire readEn, writeEn, rOutEn;
	
	// MEM signals
	wire MFC, R_W, EN;
	
	// Driving index
	reg setIndex;
	reg[3:0] indexVal;
	
	decoder D(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);

	register R(index, bus, rEn, wEn, reset);
	
	MAR mar(bus, load, address, reset);

	MDR mdr(bus, dReadIn, dToWriteOut, readEn, writeEn, rOutEn, reset);
	
	MEM memory(address, dToWriteOut, dReadIn, MFC, R_W, EN, reset);

	LdSr_FSM FSM(clk, reset, LDSRstr, IRiEn, IRjEn, opCode, rEn, wEn, load, writeEn, readEn, rOutEn, R_W, EN, MFC, IF);
	

	
	parameter LOAD = 4'd11, STORE = 4'd12;
	// TO test this unit when resetting the values of the registers. Their content was set to R[0] = 2. R[1] = 3
	// in order to test the LOAD and STORE process
	initial
	begin
		clk = 0;
		reset = 1;
		IR = 0;
		#5
		reset = 0;
		#5
		IR = 1;
		instruction = {STORE, 6'd0, 6'd1};
		wait (IF == 1);
		#10
		IR = 0;
		#5
		instruction = {LOAD, 6'd1, 6'd2};
		IR = 1;
		wait (IF == 1);
		#10
		$finish;
	end
	
	assign BRjEn = 0; // Stops decoder from driving the bus
	
	always #5 clk <= ~clk;
	
	
endmodule
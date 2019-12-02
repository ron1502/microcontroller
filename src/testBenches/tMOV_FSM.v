
module tMOV_FSM;

	reg clk, reset;
	wire[15:0] bus;
	
	// Instruction Fetch signal
	reg[15:0] instruction;
	reg IR;
	
	// Decoder Signals
	wire ALUstr, MOVstr, LDSRstr, IF;
	wire[3:0] opCode, index;
	wire IRiEn, IRjEn, BRjEn;
	
	decoder D(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);

	// Register signals
	wire rEn, wEn;
	register R(index, bus, rEn, wEn, reset);
	
	MOVFSM movFSM(clk, reset, MOVstr, opCode, IF, IRiEn, IRjEn, BRjEn, rEn, wEn);
	
	parameter MOVI = 4'd9, MOV = 4'd10;
	
	initial
	begin
		clk = 0;
		IR = 0;
		reset = 1;
		#10
		reset = 0;
		#5
		// MOV R_2, #4
		instruction = {MOVI, 6'd2, 6'd4};
		IR = 1;
		wait(IF == 1);
		#10;
		IR = 0;
		#5
		// MOV R_0, R_2
		instruction = {MOV, 6'd0, 6'd2};
		IR = 1;
		wait(IF == 1);
		#10
		$finish;
	end
	
	always #5 clk = ~clk;
endmodule
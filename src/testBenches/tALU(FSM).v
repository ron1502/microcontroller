`timescale 1us/10ns
module tALU_FSM;
	reg[15:0] instruction;
	reg clk, reset, IR;
	
	//start signals
	wire ALUstr, MOVstr, LDSRstr;
	wire[3:0] opCode;
	
	//decoder control signals
	wire IRiEn, IRjEn, BRjEn;
	
	// Register signals
	wire[3:0] index;
	wire IF;
	wire[15:0] bus;
	decoder D(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);
	
	wire enIn1, enIn2, outEn;
	ALU ALU_Unit(bus, enIn1, enIn2, opCode, outEn);

	wire rEn, wEn;
	register R(index, bus, rEn, wEn, reset);

	ALUOps ALU_FSM(clk, reset, ALUstr, opCode, IRiEn, IRjEn, BRjEn, rEn, wEn,
			  enIn1, enIn2, outEn, IF);

	initial
	begin
		clk = 0;
		#5
		reset = 1;
		#5
		reset = 0;
		// ADDI R_0, #4
		instruction = {4'd7, 6'd0, 6'd4}; 
		#5 
		IR = 1;
		wait (IF == 1);
		#30
		IR = 0;
		// ADD R_1, R_0
		instruction = {4'd0, 6'd1, 6'd0}; 
		#5
		IR = 1;
		wait (IF == 1);
		#30
		// NOT R_1
		IR = 0;
		instruction = {4'd2, 6'd1, 6'd0}; 
		#5
		IR = 1;
		#10
		wait (IF == 1)
		#30
		$finish;
	end
	
	always #5 clk <= ~clk;
endmodule
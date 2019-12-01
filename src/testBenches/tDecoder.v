
module tDecoder;
	reg[15:0] instruction;
	reg clk, reset, IR;
	
	//start signals
	wire ALUstr, MOVstr, LDSRstr;
	wire[3:0] opCode;
	
	//decoder control signals
	wire IRiEn, IRjEn;
	reg BRjEn, IF;
	
	// Register signals
	wire[3:0] index;
	
	wire[15:0] bus;

	decoder D(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);
	

	initial
	begin
		clk = 0;
		BRjEn = 0;
		// ADDI R_0, #7
		#5
		reset = 1;
		#5
		reset = 0;
		instruction = {4'd7, 6'd0, 6'd10}; 
		#5
		BRjEn = 1;
		#10
		$finish;
	end

endmodule
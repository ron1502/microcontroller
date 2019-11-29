
module ALU(inBus, enIn1, enIn2, opCode, result, outEn);
	
	output reg[15:0] result;

	input wire[15:0] inBus;
	input wire[2:0] opCode;
	input wire enIn1, enIn2, outEn;

	reg[15:0] in1, in2, ALUOut;
	
	parameter ADD = 3'd0, SUB = 3'd1, NOT = 3'd2, AND = 3'd3,
			  OR = 3'd4 , XOR = 3'd5, XNOR = 3'd6;  
	
	always @(inBus or enIn1 or enIn2)
	begin
		if (enIn1 == 1) in1 <= inBus;
		else if (enIn2 == 1) in2 <= inBus;
	end
	
	always @(opCode or in1 or in2)
	begin
		case(opCode)
			ADD: ALUOut <= in1 + in2;
			SUB: ALUOut <= in1 - in2;
			NOT: ALUOut <= ~in1;
			AND: ALUOut <= in1 & in2;
			OR: ALUOut <= in1 | in2;
			XOR: ALUOut <= in1 ^ in2;
			XNOR: ALUOut <= in1 ~^ in2;
			default: ALUOut <= 16'd0;
		endcase
	end
	
	always @(outEn or ALUOut)
	begin
		if (outEn == 1) result <= ALUOut;
		else result <= 16'bz;
	end
	
endmodule
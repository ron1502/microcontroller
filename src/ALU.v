
module ALU(bus, enIn1, enIn2, opCode, outEn, reset);
	
	inout wire[15:0] bus;
	input wire[3:0] opCode;
	input wire enIn1, enIn2, outEn, reset;

	reg[15:0] in1, in2, ALUOut;
	
	parameter ADD = 4'd0, SUB = 4'd1, NOT = 4'd2, AND = 4'd3,
			  OR = 4'd4 , XOR = 4'd5, XNOR = 4'd6, ADDI = 4'd7,
			  SUBI = 4'd8;  
	
	always @(posedge enIn1 or posedge enIn2 or posedge reset)
	begin
		if(reset == 1)
		begin
			in1 <= 16'd0;
			in2 <= 16'd0;
		end	
		else if (enIn1 == 1) in1 <= bus;
		else in2 <= bus;
	end
	
	
	always @(opCode or in1 or in2 or reset)
	begin
		if(reset == 1) ALUOut <= 16'd0;
		else if(opCode == ADD || opCode == ADDI) ALUOut <= in1 + in2;
		else if(opCode == SUB || opCode == SUBI) ALUOut <= in1 - in2;
		else
		begin
			case(opCode)
				NOT: ALUOut <= ~in1;
				AND: ALUOut <= in1 & in2;
				OR: ALUOut <= in1 | in2;
				XOR: ALUOut <= in1 ^ in2;
				XNOR: ALUOut <= in1 ~^ in2;
				default: ALUOut <= 16'd0;
			endcase
		end
	end
	
	assign bus = outEn ? ALUOut : 16'bz; 
	
endmodule
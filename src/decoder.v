
module decoder(IR, instruction, ALUstr, MOVstr, LDSRstr, opCode, index, reset, IRiEn, IRjEn, IF, BRjEn, bus);

	input wire IR, reset, IRiEn, IRjEn, IF;
	input wire BRjEn;
	input wire[15:0] instruction;
	
	output wire[15:0] bus;
	output reg[3:0] index;
	output reg[3:0] opCode; 
	output reg ALUstr, MOVstr, LDSRstr;
	

	parameter ADD = 4'd0, SUB = 4'd1, NOT = 4'd2, AND = 4'd3,
			  OR = 4'd4 , XOR = 4'd5, XNOR = 4'd6, ADDI = 4'd7,
			  SUBI = 4'd8, MOVI = 4'd9, MOV = 4'd10, LOAD = 4'd11,
			  STORE = 4'd12;
	
	assign bus = (BRjEn == 1) ? {10'd0, instruction[5:0]} : 16'bz;

	
	always @(posedge IR or posedge reset or posedge IF)
	begin
		if(reset == 1)
		begin
			ALUstr <= 0;
			MOVstr <= 0;
			LDSRstr <= 0;
			opCode <= 4'd0;
		end
		else if(IF == 1)
		begin
			ALUstr <= 0;
			MOVstr <= 0;
			LDSRstr <= 0;
			opCode <= 4'd0;
		end
		else
		begin
			opCode <= instruction[15:12];
			if(instruction[15:12] == ADD || instruction[15:12] == SUB || instruction[15:12] == XOR ||
				instruction[15:12] == XNOR || instruction[15:12] == AND || instruction[15:12] == OR ||
				instruction[15:12] == NOT || instruction[15:12] == SUBI || instruction[15:12] == ADDI)
				ALUstr <= 1;
			else if(instruction[15:12] == MOVI || instruction[15:12] == MOV)
				MOVstr <= 1;
			else if(instruction[15:12] == LOAD || instruction[15:12] == STORE)
				LDSRstr <= 1;
			else
			begin
				ALUstr <= 0;
				MOVstr <= 0;
				LDSRstr <= 0;
			end
		end
	end
	
	always @(posedge IRiEn or posedge IRjEn or posedge reset)
	begin
		if(IRiEn == 1) index <= instruction[11:6];
		else if(IRjEn == 1) index <= instruction[5:0];
		else index <= 16'd0;
	end
endmodule
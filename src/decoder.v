
module decoder(clk, IR, instruction, ALUstr, MOVstr, LDSRstr, reset);
	input wire clk, IR, reset;
	input wire[15:0] instruction;
	
	output reg ALUstr, MOVstr, LDSRstr;
	
	parameter ADD = 4'd0, ADDI = 4'd1, SUB = 4'd2, SUBI = 4'd3, NOT = 4'd4, AND = 4'd5,
			  OR = 4'd6, XOR = 4'd7, XNOR = 4'd8, MOVI = 4'd9, MOV = 4'd10, LOAD = 4'd11,
			  STORE = 4'd12;
	//Integrated decoder
	always @(posedge IR)
	begin
		case(instruction[15:12])
			ADD: ADDI: SUB:
			SUBI: NOT: AND:
			OR: XOR: XNOR:
				ALUstr <= 1;
			MOV: MOVI:
				MOVstr <= 1;
			LOAD: STORE:
				LDSRstr <= 1;
			default:
			begin
				ALUstr <= 0;
				MOVstr <= 0;
				LDSRstr <= 0;
			end
		end		
		endcase
	end
endmodule
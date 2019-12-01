
module ALUOps(clk, reset, ALUstr, opCode, DIRiEn, DIRjEn, DBRjEn, RrEn, RwEn,
			  ALUEnIn1, ALUEnIn2, ALUOutEn, IF);
	
	input wire clk, reset, ALUstr;
	input wire[3:0] opCode;
	
	reg[3:0] currState, nextState;
	
	//DecoderSignals
	output reg DIRiEn, DIRjEn, DBRjEn;

	//RegisterSignals
	output reg RrEn, RwEn;
	
	//ALU signals
	output reg ALUEnIn1, ALUEnIn2, ALUOutEn;
	
	//IF (FSM) signal
	output reg IF;
	
	parameter ADD = 4'd0, SUB = 4'd1, NOT = 4'd2, AND = 4'd3,
		  OR = 4'd4 , XOR = 4'd5, XNOR = 4'd6, ADDI = 4'd7,
		  SUBI = 4'd8;
	
	parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S411 = 4'd5, S412 = 4'd6,
			  S413 = 4'd7, S414 = 4'd8, S421 = 4'd9, S422 = 4'd10, S423 = 4'd11, S5 = 4'd12,
			  S6 = 4'd13, S7 = 4'd14, S8 = 4'd15;

 	always @(posedge clk or posedge reset)
	begin
		if(reset == 1)
		begin
			nextState <= S0;
			RrEn <= 0;
			ALUOutEn <= 0;
			DBRjEn <= 0;
			//signal resetting takes place
		end
		else currState <= nextState;
	end
	
	always @(currState or ALUstr)
	begin
		case(currState)
			S0: begin
				if(ALUstr == 1) nextState <= S1;
			end
			S1: begin
				DIRiEn <= 1;
				nextState <= S2;
			end
			S2: begin
				RrEn <= 1;
				nextState <= S3;
			end
			S3: begin
				ALUEnIn1 <= 1;
				nextState <=  S4;
			end
			S4: begin
				RrEn <= 0;
				ALUEnIn1 <= 0;
				DIRiEn <= 0;
				if(opCode == ADD || opCode == SUB || opCode == XOR ||
				   opCode == XNOR || opCode == AND || opCode == OR)
						nextState <= S411;
				else if(opCode == ADDI || opCode == SUBI)
						nextState <= S421;
				else if(opCode == NOT)
						nextState <= S5;
				else nextState <= S0;
			end
			S411: begin
				DIRjEn <= 1;
				nextState <= S412;
			end
			S412: begin
				RrEn <= 1;
				nextState <= S413;
			end
			S413: begin
				ALUEnIn2 <= 1;
				nextState <= S414;
			end
			S414: begin
				ALUEnIn2 <= 0;
				RrEn <= 0;
				DIRjEn <= 0;
				nextState <= S5;
			end
			// ADDI and SUBI
			S421: begin
				DBRjEn <= 1;
				nextState <= S422;
			end
			S422: begin
				ALUEnIn2 <= 1;
				nextState <= S423;
			end
			S423: begin
				ALUEnIn2 <= 0;
				DBRjEn <= 0;
				nextState <= S5;
			end
			S5: begin
				DIRiEn <= 1;
				ALUOutEn <= 1;
				nextState <= S6;
			end
			S6: begin
				RwEn <= 1;
				nextState <= S7;
			end
			S7: begin
				ALUOutEn <= 0;
				RwEn <= 0;
				DIRiEn <= 0;
				nextState <= S8;
			end
			S8: begin
				nextState <= S0;
			end
		endcase
	end
	
	always @(nextState)
	begin
		if(nextState == S0) IF <= 1'bz;
		else if(nextState == S8) IF <= 1;
		else IF <= 0;
	end
endmodule
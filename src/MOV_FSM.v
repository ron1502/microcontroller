module MOVFSM(clk, reset, MOVstr, opCode, IF, DIRiEn, DIRjEn, DBRjEn, RrEn, RwEn);

	input wire clk, reset, MOVstr;
	input wire[3:0] opCode;
	output reg IF;
	reg[3:0] currState, nextState;
	
	// Decoder signals
	output reg DIRiEn, DIRjEn, DBRjEn;
	
	// Register signals
	output reg RrEn, RwEn;
	
	parameter S0 = 4'd0, S011 = 4'd1, S012 = 4'd2, S013 = 4'd3, S021 = 4'd4,
			  S1 = 4'd5, S2 = 4'd6, S3 = 4'd7, S4 = 4'd8;
			  
	parameter MOVI = 4'd9, MOV = 4'd10;
	
	always @(posedge clk or posedge reset)
	begin
		if(reset == 1) currState <= S0;
		else currState <= nextState;
	end
	
	always @(currState or MOVstr)
	begin
		case(currState)
			S0: begin
				if(MOVstr == 1)
				begin
					case(opCode)
						MOVI:
							nextState <= S021;
						MOV:
							nextState <= S011;
						default:
							nextState <= 0;
					endcase
				end
				else
				begin
					RrEn <= 0;
					RwEn <= 0;
					DIRiEn <= 0;
					DIRjEn <= 0;
					DBRjEn <= 0;
					nextState <= 0;
				end
			end
			S011: begin
				DIRjEn <= 1;
				nextState <= S012;
			end
			S012: begin
				RrEn <= 1;
				nextState <= S013;
			end
			S013: begin
				DIRjEn <= 0;
				nextState <= S1;
			end
			S021: begin
				DBRjEn <= 1;
				nextState <= S1;
			end
			S1: begin
				DIRiEn <= 1;
				nextState <= S2;
			end
			S2: begin
				RwEn <= 1;
				nextState <= S3;
			end
			S3: begin
				RwEn <= 0;
				DIRiEn <= 0;
				DBRjEn <= 0;
				RrEn <= 0;
				RwEn <= 0;
				nextState <= S4;
			end
			S4:
				nextState <= S0;
			default:
				nextState <= S0;
		endcase
	end
	
	always @(nextState)
	begin
		if(nextState == S4) IF <= 1;
		else IF <= 0;
	end
endmodule
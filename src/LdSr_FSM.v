

module LdSr_FSM(clk, reset, LDSRstr, DIRiEn, DIRjEn, opCode, RrEn, RwEn, MARload, MDRwriteEn, MDRreadEn, MDRrOutEn, MEMR_W, MEMEn, MFC, IF);
	input wire clk, reset, LDSRstr;
	
	// Decoder signals
	output reg DIRiEn, DIRjEn;
	input wire[3:0] opCode;
	
	// Register signal
	output reg RrEn, RwEn;
	
	// MAR signals
	output reg MARload;
	
	// MDR signals
	output reg MDRwriteEn, MDRreadEn, MDRrOutEn;
	
	// MEM singnals 
	output reg MEMR_W, MEMEn;
	input wire MFC;
	
	// Instruction fetch Signals;
	output reg IF;
	
	reg[4:0] currState, nextState;
	
	parameter S0 = 5'd0, S1 = 5'd1, S2 = 5'd2, S211 = 5'd3, S221 = 5'd4,
			  S3 = 5'd5, S311 = 5'd6, S312 = 5'd7, S313 = 5'd8, S314 = 5'd9,
			  S315 = 5'd10, S316 = 5'd11, S321 = 5'd12, S322 = 5'd13, S323 = 5'd14,
			  S324 = 5'd15, S325 = 5'd16, S326 = 5'd17, S4 = 5'd18;
			  
	parameter LOAD = 4'd11, STORE = 4'd12;
	
	always @(posedge clk or posedge reset)
	begin
		if(reset == 1)
		begin
			MDRrOutEn <= 0;
			RrEn <= 0;
			nextState <= S0;
		end
		else
			currState <= nextState;
	end
	
	always @(currState or LDSRstr)
	begin
		case(currState)
			S0:
				if(LDSRstr == 1) nextState <= S1;
			S1: begin
				DIRiEn <= 1;
				nextState <= S2;
			end
			S2: begin
				RrEn <= 1;
				case(opCode)
					STORE:
						nextState <= S211;
					LOAD:
						nextState <= S221;
				endcase
			end	
			S211: begin
				MDRwriteEn <= 1;
				nextState <= S3;
			end
			S221: begin
				MARload <= 1;
				nextState <= S3;
			end
			S3: begin
				DIRiEn <= 0;
				RrEn <= 0;
				MDRwriteEn <= 0;
				MARload <= 0;
				case(opCode)
					STORE:
						nextState <= S311;
					LOAD:
						nextState <= S321;
				endcase
			end
			S311: begin
				DIRjEn <= 1;
				nextState <= S312;
			end
			S312: begin
				RrEn <= 1;
				nextState <= S313;
			end
			S313: begin
				MARload <= 1;
				nextState <= S314;
			end
			S314: begin
				DIRjEn <= 0;
				RrEn <= 0;
				MARload <= 0;
				MEMR_W <= 0;
				nextState <= S315;
			end
			S315: begin
				MEMEn <= 1;
				if(MFC == 1) nextState <= S316;
				else nextState <= S314;
			end
			S316: begin
				MEMEn <= 0;
				nextState <= S4;
			end
			S321: begin
				MEMR_W <= 1;
				nextState <= S322;
			end
			S322: begin
				MEMEn <= 1;
				if(MFC == 1) nextState <= S323;
				else nextState <= S321;
			end
			S323: begin
				MDRreadEn <= 1;
				MEMEn <= 0;
				nextState <= S324;
			end
			S324: begin
				MDRreadEn <= 0;
				MDRrOutEn <= 1;
				DIRjEn <= 1;
				nextState <= S325;
			end
			S325: begin
				RwEn <= 1;
				nextState <= S326;
			end
			S326: begin
				RwEn <= 0;
				DIRjEn <= 0;
				MDRrOutEn <= 0;
				nextState <= S4;
			end
			S4: begin
				nextState <= S0;
			end
		endcase
	end
	
	always @(nextState)
	begin
		if(nextState == S0) IF <= 1'bz;
		else if(nextState == S4) IF <= 1;
		else IF <= 0;
	end
	
endmodule
	
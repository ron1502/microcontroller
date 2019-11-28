
module IF(reset, clk, IF, IR, pcCount, pcOutEn, marLoad,
		  R_W, memEn, mdrReadEn, mdrROutEn);

	input wire reset, clk;
	// PC signals
	input wire pcCount, pcOutEn;
	// MAR signals
	input wire marLoad;
	// MDR signals
	input wire mdrReadEn, mdrROutEn;
	// IR signals
	input wire irBusEn;
	
	output reg IR, IF;
	
	reg[3:0] currState, nextState;

	parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5,
			  S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9;
			  
	always @(posedge clk or posedge reset)
	begin
		if(reset == 1)
		begin
			nextState <= S0;
			IF = 1;
			IR = 0;
			mdrROutEn = 0; //reseting tristate buffer signal;
			//send reset signal to FSMs
		end
		else
		begin
			currState <= nextState;
		end
	end
	
	//state transition
	always @(currState)
	begin
		case(currState)
			S0 :
			begin
				if(IF == 0) nextState <= S0;
				IF <= 0;
				pcCount <= 1;
				nextState <= S1;
			end
			S1 : 
			begin
				pcCount <= 0;
				pcOutEn <= 1;
				nextState <= S2;
			end
			S2 :
			begin
				marLoad <= 1;
				nextState <= S3;
			end
			S3 :
			begin
				marLoad <= 0;
				R_W <= 1;
				memEn <= 1;
				pcOutEn <= 0;
				nextState <= S4;
			end
			S4 :
			begin
				if(MFC == 1) nextState <= S5;
				else nextState <= S3;
			end
			S5 :
			begin
				mdrReadEn <= 1;
				memEn <= 0;
				nextState <= S6;
			end
			S6 :
			begin
				mdrROutEn <= 1;
				mdrReadEn <= 0;
				nextState <= S7;
			end
			S7 :
			begin
				irBusEn <= 1;
				nextState <= S8;
			end
			S8 :
			begin
				irBusEn <= 0;
				mdrROutEn <= 0;
				nextState <= S9;
			end
			S9 : nextState <= S0; //Extra state provides extra time for the bus to be cleaned
			default: nextState <= S0;
		endcase
	end
	
	//state output
	always @(nextState)
	begin
		if(nextState == S9) IR <= 1;
		else IR <= 0;
	end
	

endmodule

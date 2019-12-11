
module IF(reset, clk, IF, IR, pcCount, pcOutEn, marLoad, irBusEn,
		  R_W, memEn, mdrReadEn, mdrROutEn, MFC);

	input wire reset, clk;
	// PC signals
	output reg pcCount, pcOutEn;
	// MAR signals
	output reg marLoad;
	// MDR signals
	output reg mdrReadEn, mdrROutEn;
	// IR signals
	output reg irBusEn;
	// MEM signal
	output reg R_W, memEn;
	input wire MFC;
	
	input wire IF;
	output reg IR;
	
	reg[3:0] currState, nextState;

	parameter SR = 4'd0, SS = 4'd1, S0 = 4'd2, S1 = 4'd3, S2 = 4'd4, S3 = 4'd5, S4 = 4'd6, S5 = 4'd7,
			  S6 = 4'd8, S7 = 4'd9, S8 = 4'd10, S9 = 4'd11;
			  
	always @(posedge clk or posedge reset)
	begin
		if(reset == 1) currState <= SR;
		else currState <= nextState;
	end
	
	//state transition
	always @(currState or IF)
	begin
		case(currState)
			SR:
			begin
				nextState <= S0;
				//PC signals
				pcOutEn <= 0;
				pcCount <= 0;
				//MAR signals
				marLoad <= 0;
				//MEM signals
				R_W <= 0;
				memEn <= 0;
				//MDR signals
				mdrReadEn <= 0;
				mdrROutEn <= 0;
				// IR signals
				irBusEn <= 0;
				//send reset signal to FSMs
			end
			SS :
			begin
				if(IF == 1) nextState <= S0;
				else nextState <= SS;
			end
			S0 :
			begin
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
				R_W <= 0;
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
			S9 : nextState <= SS; //Extra state provides extra time for the bus to be cleaned
			default: nextState <= SS;
		endcase
	end
	
	//state output
	always @(nextState)
	begin
		if(nextState == S9) IR <= 1;
		else IR <= 0;
	end
	

endmodule

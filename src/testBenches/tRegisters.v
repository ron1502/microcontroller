
module tRegisters;
	reg[1:0] index;
	reg[15:0] dataIn;
	wire[15:0] dataOut;
	reg rEn, wEn, reset;
	
	register progRegisters(index, dataIn, dataOut, rEn, wEn, reset);

	initial
	begin
		reset = 1;
		#5
		reset = 0;
		index = 2'd1;
		dataIn = 16'd20;
		#5
		wEn = 1;
		#5
		wEn = 0;
		rEn = 1;
		#5
		rEn = 0;
	end
endmodule
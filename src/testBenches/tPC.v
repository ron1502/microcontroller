`timescale 1us/10ns

module tPC;
	reg reset, count, outEn;
	wire [15:0] curAddress;
	
	PC programCounter(reset, count, outEn, curAddress);
	
	initial
	begin
		reset = 1'b1;
		#5
		reset = 1'b0;
		count = 1'b1;
		#5
		count = 1'b0;
		outEn = 1'b1;
		#5
		outEn = 1'b0;
		count = 1'b1;
		#5
		outEn = 1'b1; 
		#5
		count = 1'b0;
		end
endmodule
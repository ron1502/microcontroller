`timescale 1us/10ns

module tALU;
	reg[15:0] num;
	reg enin1, enin2;
	reg[2:0] opCode;
	wire[15:0] result;
	reg outEn;
	
	ALU alu(num, enin1, enin2, opCode, result, outEn);
	
	// Assuming every rising edge 5n
	initial
	begin
		// Loading numbers
		#2
		outEn = 0;
		num = 16'd256;
		enin1 = 1;
		#2
		enin1 = 0;
		num = 16'd255;
		enin2 = 1;
		#2
		enin2 = 0;
		
		for(opCode = 0; opCode < 7; opCode = opCode + 1)
		begin
			#2
			outEn = 1;
			#2
			outEn = 0;
			num = num +1;
			enin1 = 1;
			#2
			enin1 = 0;
		end
	end
	
endmodule
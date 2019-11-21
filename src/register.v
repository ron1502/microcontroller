
module register(index, dataIn, dataOut, rEn, wEn, reset);
	input wire reset, wEn, rEn;
	input wire[15:0] dataIn;
	input wire[1:0] index;
	
	output reg[15:0] dataOut;
	
	reg[15:0] register [3:0];
	
	always @(posedge reset)
	begin
		register[0] = 16'd0;
		register[1] = 16'd0;
		register[2] = 16'd0;
		register[3] = 16'd0;
	end
	
	// Register Writing
	always @(posedge wEn)
	begin
		if(wEn)
		begin
			register[index] <= dataIn;
		end
	end
	
	
	always @(posedge rEn)
	begin
		if (rEn == 1) dataOut <= register[index];
		else dataOut <= 16'bz;
	end
	
endmodule
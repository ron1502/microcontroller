
module tMDR;
	
	wire [15:0] bus;
	reg rOutEn, readEn, writeEn, reset;
	
	wire[15:0] dToWriteOut;
	reg[15:0] dReadIn;
	MDR mdr(bus, dReadIn, dToWriteOut, readEn, writeEn, rOutEn, reset);

	initial
	begin
		rOutEn = 0;
		#5
		dReadIn = 16'd5;
		readEn = 1;
		#5
		readEn = 0;
		rOutEn = 1;
		#5
		rOutEn = 0;
	end
endmodule
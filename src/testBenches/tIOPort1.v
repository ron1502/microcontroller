
module tIOPort1;
	wire [15:0] bus;
	reg [15:0] dataIn;
	reg reset, readEn, writeBusEn;
	
	IOPort1 ioport1(bus, writeBusEn, readEn, dataIn, reset);

	initial
	begin
		reset = 1;
		#5
		reset = 0;
		readEn = 1;
		dataIn = 16'd10;
		#5
		readEn = 0;
		writeBusEn = 1;
		#5
		writeBusEn = 0;
	end
	
endmodule
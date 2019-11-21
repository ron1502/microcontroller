
module tIOPort0;
	wire [15:0] dataOut;
	wire [15:0] bus;
	reg reset, readBusEn, writeBusEn;
	
	reg [15:0] busVal;
	
	IOPort0 ioport0(dataOut, readBusEn, bus, writeBusEn, reset);
	
	assign bus = busVal;
	
	initial
	begin
		reset = 1;
		#5
		reset = 0;
		busVal = 16'd7;
		readBusEn = 1;
		#5
		readBusEn = 0;
	end
endmodule

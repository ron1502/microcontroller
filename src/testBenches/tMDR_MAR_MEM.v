
module tMDR_MAR_MEM;
	reg rOutEn, readEn, writeEn, reset, R_W, EN, load;
	wire[15:0] dReadOut, dToWriteOut, address;
	wire MFC;
	wire [15:0] dReadIn, bus;
	reg [15:0] busVal;
	
	busDrver busDriver(busVal, bus);
	MAR mAddressR(bus, load, address, reset);
	MEM memory(outAddress, dToWriteOut, dReadIn, MFC, R_W, EN, reset);
	MDR mDataR(bus, dReadIn, dToWriteOut, readEn, writeEn, rOutEn, reset);
	
	
	initial
	begin
		// Reseting System
		reset = 1;
		#5
		reset = 0;
		// Writing to MEM at address 12
			// Loading address to MAR
			load = 1;
			busVal = 16'd7;
			#5
			load = 0;
			// Loading data to MDR
			busVal = 16'd15;
			writeEn = 1;
			#5
			writeEn = 0;
			// Writing 15 in memory
			R_W = 0;
			EN = 1;
			// Waiting till writting takes place
			wait (MFC == 1);
			EN = 0;
		// Reading Data to MEM from address 12
			// Loading address to MAR no longer needed
			// MEM reading
			#15
			R_W = 1;
			EN = 1;
			// Setting up MDR
			wait (MFC == 1);
			readEn = 1;
			EN = 0;
			#5
			readEn = 0;
			rOutEn = 1;
			#5
			rOutEn = 0;
	end
	
endmodule
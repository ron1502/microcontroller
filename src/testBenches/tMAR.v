
module tMAR;
	reg load; 
	reg[15:0]address;
	wire[15:0] outAddress;
	MAR mAddressR(load, address, outAddress);
	
	initial
	begin
		load = 1;
		address = 16'd48;
		#5
		load = 0;
		#5
		// load value == 0 so outAddress should not change
		address = 16'd78;
	end
endmodule

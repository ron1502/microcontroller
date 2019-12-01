
module tRegisters;
	reg[3:0] index;
	wire[15:0] bus;
	reg rEn, wEn, reset, loadBus;
	reg[15:0] busVal;
	
	busDriver driver(busVal, bus, loadBus, reset);
	
	register progRegisters(index, bus, rEn, wEn, reset);
	
	
	initial
	begin
		rEn = 0;
		reset = 1;
		#5
		reset = 0;
		#5
		busVal = 16'd20;
		loadBus = 1;
		#5
		loadBus = 0;
		index = 2'd1;
		#5
		wEn = 1;
		#5
		wEn = 0;
		rEn = 1;
		#5
		rEn = 0;
		$finish;
	end
endmodule
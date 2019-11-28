
module busDriver(busVal, bus, loadBus);
	input wire[15:0] busVal;
	output reg[15:0] bus;
	input wire loadBus;
		
	always @(loadBus) 
	begin
		if(loadBus == 1) bus <= busVal;
		else bus <= 16'bz;
	end
endmodule
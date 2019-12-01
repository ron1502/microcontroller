
module busDriver(busVal, bus, loadBus, reset);
	input wire[15:0] busVal;
	output reg[15:0] bus;
	input wire loadBus, reset;
	
	
	always @(posedge loadBus or posedge reset) 
	begin
		if(reset == 1) bus <= 16'bz;
		else bus <= busVal;
	end
endmodule
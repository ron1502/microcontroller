
module busDriver(busVal, bus);
	input wire[15:0] busVal;
	output reg[15:0] bus;
		
	always bus <= busVal;
endmodule
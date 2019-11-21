
module MAR(bus, load, address, reset);
	input wire[15:0] bus;
	input wire load, reset;
	
	output reg[15:0] address;
		
	always @(posedge load or posedge reset)
	begin
		if (reset == 1)
			address <= 16'd0;
		else
			address <= bus;
	end
endmodule
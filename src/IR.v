
module IR(bus, busEn, instruction, reset);
	input wire[15:0] bus;
	input wire reset, busEn;
	output reg [15:0] instruction;
	
	always @(posedge busEn or posedge reset)
	begin	
		if(reset == 1)
			instruction <= 16'd0;
		else
			instruction <= bus;
	end
	
endmodule
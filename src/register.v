
module register(index, bus, rEn, wEn, reset);
	input wire reset, wEn, rEn;
	input wire[3:0] index;
	
	inout [15:0] bus;
	
	reg[15:0] register [3:0];
	always @(posedge reset)
	begin
		register[0] <= 16'd0;
		register[1] <= 16'd0;
		register[2] <= 16'd0;
		register[3] <= 16'd0;
	end
	
	// Register Writing
	always @(posedge wEn)
	begin
		register[index] <= bus;
	end
	
	assign bus = rEn == 1 ? register[index] : 16'bz;
endmodule
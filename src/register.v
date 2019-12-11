
module register(index, bus, rEn, wEn, reset);
	input wire reset, wEn, rEn;
	input wire[3:0] index;
	
	inout [15:0] bus;
	
	reg[3:0] fixedIndex;
	
	reg[15:0] register [3:0];
	
	// Register Writing
	always @(posedge wEn or posedge reset)
	begin
		if(reset == 1)
		begin
			register[0] <= 16'd0;
			register[1] <= 16'd0;
			register[2] <= 16'd0;
			register[3] <= 16'd0;
		end
		else register[index] <= bus;
	end
	
	always @(posedge rEn or posedge reset)
	begin
		if(reset == 1) fixedIndex <= 4'd0;
		else fixedIndex <= index;
	end
	
	assign bus = rEn == 1 ? register[fixedIndex] : 16'bz;
endmodule
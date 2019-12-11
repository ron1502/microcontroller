
module PC(reset, count, outEn, bus);
	input wire count, reset, outEn;
	output wire [15:0] bus;
	
	reg[15:0] address, nextAddress;

	always @(posedge count or posedge reset)
	begin
		if (reset == 1)
		begin
			address <= 16'd0;
			nextAddress <= 16'd0;
		end
		else
		begin
			nextAddress <= address;
			address <= address + 16'd1;
		end 
	end
	
	assign bus = (outEn == 1) ? nextAddress : 16'bz;
	
endmodule

module PC(reset, count, outEn, curAddress);
	input wire count, reset, outEn;
	output reg [15:0] curAddress;
	
	reg[15:0] address, nextAddress;

	always @(posedge count or posedge reset)
	begin
		if (reset == 1) address <= 16'd0;
		else
		begin
			nextAddress <= address;
			address <= address + 16'd1;
		end 
	end
	
	
	always @(outEn)
	begin
		if (outEn == 1) curAddress <= nextAddress;
		else curAddress <= 16'bz;
	end
endmodule
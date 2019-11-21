
module MDR(bus, dReadIn, dToWriteOut, readEn, writeEn, rOutEn, reset);
	input wire[15:0] dReadIn;
	input wire rOutEn, readEn, writeEn, reset;
	output reg[15:0] dToWriteOut;
	
	inout wire[15:0] bus;
	reg [15:0] savedData;
	
	// Reading 
	always @(posedge readEn or posedge reset)
	begin
		if(reset == 1) savedData <= 16'd0;
		else savedData <= dReadIn;
	end
	
	assign bus = rOutEn ? savedData : 16'bz; 
	
	// Writing
	always @(posedge writeEn or posedge reset)
	begin
		if (reset == 1) dToWriteOut <= 16'd0;
		else dToWriteOut <= bus;
	end
endmodule
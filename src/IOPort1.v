
module IOPort1(bus, rEn, dataIn);
	output wire [15:0] bus;
	input wire [15:0] dataIn;
	input wire rEn;
	
	reg [15:0] savedData;
	
	assign bus = (rEn == 1) ? savedData : 16'dz;
	
	always @(dataIn) savedData <= dataIn;
	
endmodule
	
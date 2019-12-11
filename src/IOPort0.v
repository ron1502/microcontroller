
module IOPort0(dataOut, bus, rEn, wEn, reset);
	output wire [15:0] dataOut;
	inout wire [15:0] bus;
	input wire reset, wEn, rEn;
	
	reg [15:0] savedData;

	assign bus = rEn ? savedData : 16'dz;
	
	always @(posedge wEn or posedge reset)
	begin
		if(reset == 1) savedData <= 16'd0;
		else savedData <= bus;
	end
	
	assign dataOut = savedData;
	
endmodule
	

module IOPort1(bus, writeBusEn, readEn, dataIn, reset);
	output reg [15:0] bus;
	input wire [15:0] dataIn;
	input wire reset, readEn, writeBusEn;
	
	reg [15:0] savedData;
	
	always @(posedge reset)
	begin
		savedData <= 16'd0;
	end
	
	always @(writeBusEn)
	begin
		if(writeBusEn == 1) bus <= savedData;
		else bus <= 16'dz;
	end
	
	always @(posedge readEn)
	begin
		savedData <= dataIn;
	end
endmodule
	
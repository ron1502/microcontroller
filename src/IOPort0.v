
module IOPort0(dataOut, readBusEn, bus, writeBusEn, reset);
	output reg [15:0] dataOut;
	inout wire [15:0] bus;
	input wire reset, readBusEn, writeBusEn;
	
	reg [15:0] savedData;
	
	always @(posedge reset)
	begin
		savedData <= 16'd0;
	end

	assign bus = writeBusEn ? savedData : 16'dz;
	
	always @(posedge readBusEn)
	begin
		savedData <= bus;
	end
	
	always dataOut <= savedData;
	
endmodule
	
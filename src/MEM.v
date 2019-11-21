
module MEM(address, dataIn, dataOut, MFC, R_W, EN, reset);
	input wire[15:0] dataIn, address;
	input wire R_W, EN, reset;
	output reg[15:0] dataOut;
	output reg MFC;
	reg[15:0] mem[19:0];
	integer x;
	
	
	always @(posedge reset)
	begin
		for(x = 0; x < 20; x = x + 1)begin
			mem[x] = 16'b0;
		end
		MFC = 0;
		dataOut = 16'bz;
	end

	always @(posedge EN)
		begin
		if(EN) begin
			if(R_W)
			begin
				dataOut = mem[address];
				#5 MFC = 1;
				#10 MFC = 0;
			end
			else
			begin
				mem[address] = dataIn;
				#5 MFC = 1;
				#10 MFC = 0;
			end
		end
		else
			dataOut = 16'bz;
	end
			
 endmodule

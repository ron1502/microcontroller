
module MEM(address, dataIn, dataOut, MFC, R_W, EN, reset);
	input wire[15:0] dataIn, address;
	input wire R_W, EN, reset;
	output reg[15:0] dataOut;
	output reg MFC;
	reg[15:0] mem[65535:0];
	integer x;
	
	parameter ADD = 4'd0, SUB = 4'd1, NOT = 4'd2, AND = 4'd3,
			  OR = 4'd4 , XOR = 4'd5, XNOR = 4'd6, ADDI = 4'd7,
			  SUBI = 4'd8, MOVI = 4'd9, MOV = 4'd10, LOAD = 4'd11,
			  STORE = 4'd12;
	
	parameter R0 = 6'd0, R1 = 6'd1, R2 = 6'd2, R3 = 6'd3, P0 = 6'd4;
	
	always @(posedge reset)
	begin
		for(x = 0; x < 65536; x = x + 1)begin
			mem[x] = 16'b0;
		end
		
		mem[0] = {MOVI, R3, 6'd16};	//MOVI  R3, #16
		mem[1] = {SUBI, R3, 6'd2}; 	//SUBI  R3, #2
		mem[2] = {MOV, R1, R3}; 	//MOV  R1, R3
		mem[3] = {ADDI, R1, 6'd5};	//ADDI  R1, #5
		mem[4] = {XOR, R1, R3};		//XOR  R1, R3
		mem[5] = {NOT, R1, 6'd0};	//INV  R1
		mem[6] = {STORE, R3, R1};	//STORE  R3, (R1)
		mem[7] = {LOAD, R1, P0};	//LOAD  (R1), P0 
		
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
				#20 MFC = 0;
			end
			else
			begin
				mem[address] = dataIn;
				#5 MFC = 1;
				#20 MFC = 0;
			end
		end
		else
			dataOut = 16'bz;
	end
			
 endmodule

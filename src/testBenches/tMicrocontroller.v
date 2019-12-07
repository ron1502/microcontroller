module tMicrocontroller;
	reg clk, reset;
	reg[15:0] ioPort1Val;
	wire[15:0] ioPort0Val;
	
	microcontroller m(clk, reset, ioPort1Val, ioPort0Val);
	
	initial
	begin
		ioPort1Val <= 16'hF0F0;
		clk <= 0;
		reset <= 1;
		#5
		reset <= 0;
		#200
		$finish;
	end

	always #5 clk <= ~clk;
endmodule
`timescale 1ns / 1ps

module clock_divider_tb;
	
	reg in;
	wire out_GLONASS;
	wire out_GPS;
	clock_divider DUT(.in_clock (in),
		.out_clock_GLONASS (out_GLONASS),
		.out_clock_GPS (out_GPS));
		
	initial begin
		in = 0;
		forever #10 in = ~in;
	end

endmodule

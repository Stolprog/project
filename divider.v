`timescale 1ns / 1ps
/*For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
 You will modify the DIVISOR parameter value to 28'd50.000.000
 Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
*/
module clock_divider(
input in_clock, 
output reg out_clock_GLONASS, 
output reg out_clock_GPS);

	initial begin
		out_clock_GLONASS = 0;
		out_clock_GPS = 0;
	end

	reg [27:0] counter_GLONASS= 28'd0;
	reg [27:0] counter_GPS= 28'd0;
	
	parameter DIVISOR_GLONASS = 28'd25;
	parameter DIVISOR_GPS = 28'd50;
	
	always @(posedge in_clock) 
	begin
		counter_GLONASS <= counter_GLONASS + 28'd1;
		counter_GPS <= counter_GPS + 28'd1;
		if(counter_GLONASS == (DIVISOR_GLONASS - 1)) 
			begin
			counter_GLONASS <= 28'd0;
			end
		if(counter_GPS == (DIVISOR_GPS - 1)) 
			begin
			counter_GPS <= 28'd0;
			end
		
		out_clock_GLONASS <= (counter_GLONASS<DIVISOR_GLONASS/2)?1'b1:1'b0;
		out_clock_GPS <= (counter_GPS<DIVISOR_GPS/2)?1'b1:1'b0;
		
	end
endmodule
// Reference: https://www.fpga4fun.com/QuadratureDecoder.html

module top
(
	input wire clk,
	input wire enc_ch_a,
	input wire enc_ch_b,
	input wire enc_sw,
	
	output reg led_blue_n = 1'b1,
	output reg led_amber_n = 1'b1,
	output wire led_rgb_red_n,
	output wire led_rgb_blue_n,
	output wire led_rgb_green_n
);

/*  LEDs are wired active low */

reg [2:0] counter = 3'b000;

assign led_rgb_red_n   = ~counter[2];
assign led_rgb_green_n = ~counter[1];
assign led_rgb_blue_n  = ~counter[0];

reg ch_a_delayed, ch_b_delayed;

always @(posedge clk) ch_a_delayed <= enc_ch_a;
always @(posedge clk) ch_b_delayed <= enc_ch_b;

wire count_en = enc_ch_a ^ ch_a_delayed ^ enc_ch_b ^ ch_b_delayed;
wire count_dir = enc_ch_a ^ ch_b_delayed;

always @(posedge clk)
begin
	if (~enc_sw)	// Reset
	begin
		led_blue_n <= 1'b1;
		led_amber_n <= 1'b1;
		counter <= 3'b000;
	end
	else if (count_en)
	begin
		if (count_dir)		
		begin
			led_blue_n <= 1'b1;
			led_amber_n <= 1'b0;
			counter <= counter + 3'b001;
		end	
		else
		begin
			led_blue_n <= 1'b0;
			led_amber_n <= 1'b1;
			counter <= counter - 3'b001;
		end
	end
end

endmodule

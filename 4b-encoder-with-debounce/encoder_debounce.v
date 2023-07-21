module encoder_debounce
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

wire [2:0] inputs = { enc_ch_a, enc_ch_b, enc_sw };
wire [2:0] outputs;
wire [2:0] outputs_rise;

assign led_rgb_red_n   = ~counter[2];
assign led_rgb_green_n = ~counter[1];
assign led_rgb_blue_n  = ~counter[0];

debounce #(.width(3), .bounce_limit(100000)) debounce_encoder_inst (.clk(clk), .switch_in(inputs), .switch_out(outputs), .switch_rise(outputs_rise), .switch_fall());

always @ (posedge clk)
	begin
		if (outputs_rise[0] == 1'b0)
			begin
				if (outputs_rise[2] == 1'b1)
					if (outputs[1] == 1'b0)
						/* Clock wise rotation */
						begin
							led_blue_n <= 1'b1;
							led_amber_n <= 1'b0;
							counter <= counter + 3'b001;
						end
					else
						/* Anti Clockwise Rotation */
						begin
							led_blue_n <= 1'b0;
							led_amber_n <= 1'b1;
							counter <= counter - 3'b001;
						end
			end
		else
			begin
				counter <= 3'b000;
				led_blue_n <= 1'b1;
				led_amber_n <= 1'b1;
			end
	end
endmodule

module encoder
(
	input wire clk,
	input wire cha,
	input wire chb,
	input wire sw,
	input wire btn1,
	input wire btn2,
	output reg led1,
	output reg led2,
	output wire ledr,
	output wire ledg,
	output wire ledb
);

/*  LEDs are wired active low */

reg [2:0] counter = 3'b000;
reg [1:0] dir = 2'b00;

wire [2:0] inputs = { cha, chb, sw };
wire [2:0] outputs;
wire [2:0] outputs_rise;

wire [2:0] rgb_pwm;
wire [2:0] LED_RGB = {ledr, ledg, ledb};

assign rgb_pwm[0] = counter[2];
assign rgb_pwm[1] = counter[1];
assign rgb_pwm[2] = counter[0];

assign led1 = btn1 & dir[0];
assign led2 = btn2 & dir[1];

debounce #(.width(3), .bounce_limit(100000)) debounce_encoder_inst (.clk(clk), .switch_in(inputs), .switch_out(outputs), .switch_rise(outputs_rise), .switch_fall());

always @ (posedge clk)
	begin
		if (outputs_rise[0] == 1'b0)
			begin
				if (outputs_rise[2] == 1'b1)
					if (outputs[1] == 1'b0)
						/* Clock wise rotation */
						begin							
							dir <= 2'b01;							
							counter <= counter + 3'b001;
						end
					else
						/* Anti Clockwise Rotation */
						begin
							dir <= 2'b10;
							counter <= counter - 3'b001;
						end
			end
		else
			begin
				counter <= 3'b000;
				dir <= 2'b11;
			end
	end

	SB_RGBA_DRV #(
		.CURRENT_MODE("0b0"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000001")
	) rgb_drv_I (
		.RGBLEDEN(1'b1),
		.RGB0PWM(rgb_pwm[0]),
		.RGB1PWM(rgb_pwm[1]),
		.RGB2PWM(rgb_pwm[2]),
		.CURREN(1'b1),
		.RGB0(LED_RGB[0]),
		.RGB1(LED_RGB[1]),
		.RGB2(LED_RGB[2])
	);

endmodule

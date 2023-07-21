module rgb_counter (
	input wire clk,
	output wire led_rgb_red_n,
	output wire led_rgb_green_n,
	output wire led_rgb_blue_n
);

  reg [26:0] counter = 0;

  always @(posedge clk) 
    counter <= counter + 1;

  assign led_rgb_red_n = counter[25];
  assign led_rgb_green_n = counter[24];
  assign led_rgb_blue_n = counter[23];

endmodule

module rgb_button (
  input btn1_n,
  input btn2_n,
  input enc_sw,
  output led_blue_n,
  output led_amber_n,
  output led_rgb_red_n,
  output led_rgb_blue_n,
  output led_rgb_green_n,
);

assign led_blue_n  = 1'b0;
assign led_amber_n = 1'b0;
  
assign led_rgb_blue_n  = btn1_n;
assign led_rgb_red_n   = btn2_n;
assign led_rgb_green_n = enc_sw;

endmodule

module button_test (
        input btn1_n,
        input btn2_n,
	output led_blue_n,
        output led_amber_n
);

assign led_blue_n  = btn1_n;
assign led_amber_n = btn2_n;  

endmodule

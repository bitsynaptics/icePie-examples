module audio(
    input clk,
    input btn1_n,
    input btn2_n,
    input enc_sw,
    output led_blue_n,led_amber_n, led_rgb_green_n,
    output reg audio_l,audio_r);

    parameter TONE_A4 = 12000000/440/2;
    parameter TONE_B4 = 12000000/494/2;
    parameter TONE_C5 = 12000000/523/2;
    parameter TONE_D5 = 12000000/587/2;
    parameter TONE_E5 = 12000000/659/2;
    parameter TONE_F5 = 12000000/698/2;
    parameter TONE_G5 = 12000000/783/2;

    reg [14:0] counter;

    always @(posedge clk) 
        if(counter==0) counter <= ((~btn1_n & ~btn2_n) ? TONE_A4-1 : 
                                ((~btn2_n & ~enc_sw) ? TONE_B4-1 : 
                                ((~enc_sw & ~btn1_n) ? TONE_C5-1 : 
                                (~btn1_n ? TONE_D5-1 : 
                                (~btn2_n ? TONE_E5-1 : 
                                (~enc_sw ? TONE_F5-1 : 0)))))); 
                                else counter <= counter-1;
    always @(posedge clk) 
        if(counter==0) 
            audio_l <= ~audio_l;

    assign audio_r = audio_l;
    assign led_blue_n = btn1_n; 
    assign led_amber_n = btn2_n;
    assign led_rgb_green_n = enc_sw;

endmodule

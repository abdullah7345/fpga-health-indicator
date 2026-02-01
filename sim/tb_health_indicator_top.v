module tb_health_indicator_top();
    reg clk;
    reg reset;
    reg Vout; 

    
    wire relay_output;
    wire red_led;
    wire green_led;

   
    health_indicator_top uut (
        .clk(clk),
        .reset(reset),
        .Vout(Vout),
        .relay_output(relay_output),
        .red_led(red_led),
        .green_led(green_led)
    );
    
    defparam uut.u_glitchfilter.threshold = 10; 
    defparam uut.u_output_driver_blinker.BLINK_LIMIT = 2;
    always #5 clk = ~clk;

    // 6. Test Stimulus
    initial begin
        // Setup Monitoring to print status to the console
        $monitor("Time=%0t | Reset=%b | Vout(Sensor)=%b | Relay=%b | RedLED=%b | GreenLED=%b", 
                 $time, reset, Vout, relay_output, red_led, green_led);


        
        clk = 0;
        reset = 0; // Hold Reset (Active Low)
        Vout = 0;  // No heat initially
        #20;

        reset = 1; // Release Reset (System Active)
        
        #20;

       
        // Threshold is set to 10. We pulse Vout for 50ns (5 cycles).
        // The system should IGNORE this because 5 < 10.
        
        Vout = 1;
        #50; 
        Vout = 0;
        
        // Wait a bit to ensure nothing happened
        #50; 
        // CHECK: Relay should be 0. RedLED should be 0. GreenLED should be 1.

        
        // We hold Vout high for >10 cycles.
        
        Vout = 1;
        
        // Wait long enough for Filter (10 cycles) + Sync (2 cycles)
        #200; 
        // CHECK: By now, Relay should be 1. RedLED should be blinking (toggling).
        
       
        // The sensor cools down (Vout = 0), but the alarm MUST stay on.
        
        Vout = 0;
        #200; 
        // CHECK: Relay must stay 1. RedLED must keep blinking.
        
        
        // Press the reset button to clear the alarm.
        
        reset = 0; 
        #20;
        reset = 1; 
        #50;
        // CHECK: System should be back to Green (Safe).

        
        $stop;
    end


endmodule

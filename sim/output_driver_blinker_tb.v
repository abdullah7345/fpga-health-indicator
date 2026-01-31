module output_driver_blinker_tb();
     reg clk;
     reg enable;
     wire led_out;
     output_driver_blinker #(
        .BLINK_LIMIT(2)  
     ) uut (
        .clk(clk),
        .enable(enable), 
        .led_out(led_out)
    );
    always #5 clk = ~clk;
    initial begin
    clk = 0;
    enable=0;
    $monitor($time, " enable=%b | led_out=%b|count=%d " 
                 , enable, led_out, uut.count);
    #20 enable=1;
    #200;
    enable=0;
    #40;
    $stop;
    end
endmodule
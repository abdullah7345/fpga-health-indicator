module fsm_tb();
     reg clk;
     reg true_fault;
     reg reset;
     wire light;
     wire relay_driver;
     fsm  uut (
        .clk(clk),
        .reset(reset), 
        .light(light),
        .true_fault(true_fault),
        .relay_driver(relay_driver)
    );
    always #5 clk = ~clk;
    initial begin
    clk = 0;
    reset = 0;
    true_fault=0;
    $monitor($time, " Reset=%b | true_fault=%b | light=%b | relay_driver=%b" 
                 , reset, true_fault, light, relay_driver);
     #20 reset=1;
     #20 true_fault=1;
     #20 true_fault=0;
     #20 reset=0;
     #10 reset=1;
     #20;
     $stop; 
     end     

     
   


endmodule
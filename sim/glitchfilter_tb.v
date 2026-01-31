module glitchfilter_tb();
    reg clk;
    reg reset;
    reg noisy_in;
    wire true_fault;
    glitchfilter  uut (
        .clk(clk),
        .reset(reset), 
        .noisy_in(noisy_in),
        .true_fault(true_fault)
    );

    
    always #5 clk = ~clk;

    
    initial begin
        
        clk = 0;
        reset = 0;     
        noisy_in = 0;

        
        $monitor($time, " Reset=%b | In=%b | Count=%d | Fault=%b" 
                 , reset, noisy_in, uut.count, true_fault);

        

        
        #20;
        reset = 1;      
        

       
        #20;
       
        noisy_in = 1;
        #5; 
        noisy_in = 0;   
        
        #30; 
        noisy_in = 1;
        
        #150; 
        

       
        
        noisy_in = 0;
        #30;
        
        
        $stop;
    end
endmodule
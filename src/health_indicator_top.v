module health_indicator_top(
    input wire clk,
    input wire reset,
    input wire Vout,
    output wire relay_output,
    output wire red_led,
    output wire green_led

    );
    wire NOISY_IN;
    wire TRUE_FAULT;
    wire ENABLE;
    
    synchronizer u_synchronizer(
       .clk(clk),
       .reset(reset),
       .D1(Vout),
       .Q2(NOISY_IN)
       );
       
    glitchfilter#(
        .threshold(1000)
        ) u_glitchfilter(
       .clk(clk),
       .reset(reset),
       .noisy_in(NOISY_IN),
       .true_fault(TRUE_FAULT)
       );
     fsm u_fsm(
       .clk(clk),
       .reset(reset),
       .true_fault(TRUE_FAULT),
       .light(ENABLE),
       .relay_driver(relay_output)
       );
      output_driver_blinker u_output_driver_blinker(
      .clk(clk),
      .enable(ENABLE),
      .led_out(red_led)
      );
      assign green_led=~ENABLE;
     
endmodule
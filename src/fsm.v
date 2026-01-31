module fsm(
    input wire clk,
    input wire true_fault,
    input wire reset,
    output reg light,
    output reg relay_driver

    );
    reg state;
localparam S0=0;
localparam S1=1;
always@(posedge clk or negedge reset)begin
  if(reset==0)begin
    state<=S0;
    light<=1'b0;
    relay_driver <= 0; 
  end 
  else begin
    case(state)
      S0: begin
            light<= 1'b0;
            relay_driver <= 0; 
            if (true_fault == 1'b1) begin
                    state <= S1;
             end
           end

       S1: begin
            light<= 1'b1;
            relay_driver <= 1; 
           end
     endcase
   end
end
endmodule
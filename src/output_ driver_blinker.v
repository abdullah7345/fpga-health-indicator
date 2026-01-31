module output_driver_blinker(
    input wire clk,
    input wire enable,    
    output reg led_out
    );
    reg[25:0]count;
   parameter BLINK_LIMIT=25000000;
always@(posedge clk)begin
  if(enable==1'b1)begin  
        if(count==BLINK_LIMIT)begin
          led_out<=~led_out;
          count<=0;
        end
        else begin
          count<=count+1;
        end
  end
  else begin
        led_out<=1'b0;
        count<=1'b0;
  end
end 
    
endmodule
module glitchfilter(
    input wire clk,
    input wire reset,
    input wire noisy_in,
    output reg true_fault
    );
 parameter threshold=5'b10;
 reg[9:0] count;
always@(posedge clk or negedge reset)begin
 if(reset==0)begin
    count<=10'd0;
    true_fault<=1'b0;
 end 
 else begin   
    if(noisy_in==1'b1)begin
        
        if(count==threshold)begin
          true_fault<=1'b1;
          count<=count;
        end
        else begin
          count<=count+1;
          true_fault<=1'b0;
        end
    end
    else begin
        count<=10'd0;
        true_fault<=1'b0;
    end
 end
end  
   
endmodule

module synchronizer(
  input wire clk,
  input wire reset,
  input wire D1,
  output reg Q1,
  output reg Q2

    );
  wire D2;
  
  assign D2=Q1;
always @(posedge clk or negedge reset)
begin
      if (reset==0)begin
        Q1 <=0;
      end else
        Q1<=D1;
end
always @(posedge clk or negedge reset)
begin
      if (reset==0)begin
        Q2 <=0;
      end else
       Q2<=D2;
end
endmodule

module synchronizer_tb();
  reg clk;
  reg reset;
  reg D1;
  wire Q1;
  wire Q2;
synchronizer uut(.clk(clk), .reset(reset), .D1(D1), .Q1(Q1) , .Q2(Q2));
 always #5 clk=~clk;
 initial begin
 $monitor($time,"clk=%b, reset=%b, D1=%b,Q1=%b, Q2=%b", clk, reset, D1,Q1, Q2);
 clk=0;
 reset=1;
 #15 D1 = 0; 
 reset=0;
 #20 D1 = 1; 
 reset=1;
 #20 D1 = 1; 
 #15 D1 = 0; 
 #10; 
 $stop;
 end
 
endmodule
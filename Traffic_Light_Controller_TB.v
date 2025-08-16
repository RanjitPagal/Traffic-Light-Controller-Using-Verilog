`timescale 1ns / 1ps

module Traffic_Light_Controller_TB();
   reg clk, rst;
   wire [1:0] light_M1;
   wire [1:0] light_M2;
   wire [1:0] light_M3;
   wire [1:0] light_M4;
   wire [1:0] light_R;
   wire [1:0] light_S;
   wire [3:0] count;
   wire [3:0] ps;
   
   ProjectTLC dut(
      .clk(clk), .rst(rst),
      .light_M1(light_M1), .light_M2(light_M2), .light_M3(light_M3),
      .light_M4(light_M4), .light_R(light_R), .light_S(light_S),
      .count(count), .ps(ps)
   );

   initial begin
      clk = 1'b0;
      forever #5 clk = ~clk;// 10ns period
   end

   initial begin
      rst = 1;       
      #20;           
      rst = 0;  
      #1000 $finish;     
   end

endmodule

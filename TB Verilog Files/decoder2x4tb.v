`timescale 1ns / 1ps

module decoder2x4tb;

reg  in0,in1;
wire out0,out1,out2,out3;
reg en;

decoder2x4 dec (
    .in0(in0),
    .in1(in1),
    .out0(out0),
    .out1(out1),
    .out2(out2),
    .out3(out3),
    .en(en)
  );
  
  initial begin 
  in0 = 1'b0;
  in1 = 1'b0;
  en = 1'b0;
  end
  
  always #5 in0= ~in0;
  always #10 in1 =~in1;
  always #25 en = ~en;


endmodule

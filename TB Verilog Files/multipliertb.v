`timescale 1ns / 1ps

module multipliertb;

reg [7:0] a,b;
wire [15:0] c;

multiplier mul (
    .a(a),
    .b(b),
    .c(c)
  );
  
  initial begin 
  a = 4'b0001;
  b= 4'b0001;
  end
  
  always #5 a= a+1;
  always #10 b=b+1;
endmodule

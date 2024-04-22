`timescale 1ns / 1ps

module carryskipaddertb;

reg [15:0] a,b;
wire [15:0] sum;
wire carry;

carryskipadder csa (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
  );
  
  initial begin 
  a = 4'b0001;
  b= 4'b0001;
  end
  
  always #5 a= a+1;
  always #80 b=b+1;

endmodule

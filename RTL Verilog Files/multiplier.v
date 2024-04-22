`timescale 1ns / 1ps

module multiplier(a,b,c);
    
    parameter l = 8;
    input [l-1:0] a,b;
    output [2*l-1:0] c;
    
    assign c =a*b;
    
endmodule

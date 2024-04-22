`timescale 1ns / 1ps

module carryskipadder(
    input [15:0] a,
    input [15:0] b,
    output [15:0] sum,
    output carry
    );
    wire [15:0] g,p;
    wire [15:0] s;
    wire [16:0] c;
    genvar i;
    assign c[0]=0;
    
    for (i=0;i<16;i=i+1) begin
        assign p[i] = a[i]^b[i];
        assign s[i] = p[i]^c[i];
        assign c[i+1] = (a[i] & b[i]) + (p[i] & c[i]);
        end
        
 assign sum=s;
 assign carry=c[16];
endmodule

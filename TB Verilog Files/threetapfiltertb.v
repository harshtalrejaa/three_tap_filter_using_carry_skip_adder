`timescale 1ns / 1ps

module threetapfiltertb;

reg [7:0] x, c0, c1, c2;
reg clk, rst, ca0, ca1, cen;
wire [15:0] y;
wire carry;

threetapfilter dut (
    .x(x), .c0(c0), .c1(c1), .c2(c2),
    .clk(clk), .rst(rst), .ca0(ca0), .ca1(ca1), .cen(cen),
    .y(y), .carry(carry)
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;  
end

initial begin
    rst = 1'b1;
    #10 rst = 1'b0;
end

initial begin
    x = 12'd42;
    c0 = 12'd3;
    c1 = 12'd5;
    c2 = 12'd7;
    ca0 = 1'b1;
    ca1 = 1'b0;
    cen = 1'b1;
end

always #50 x=x+1;

initial begin
    #20;  
    if (y != 25'd256) $error("Test case 1 failed");

end

endmodule
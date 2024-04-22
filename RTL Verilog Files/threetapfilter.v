`timescale 1ns / 1ps

module threetapfilter(
    input [7:0] x,c0,c1,c2,
	input clk,rst, ca0, ca1, cen, 
	output [15:0] y,
	output carry
    );
    
    reg [7:0] Xt0,Xt1,Xt2,cr0,cr1,cr2;
    reg [15:0] y_reg;
            
    wire [15:0] y_wire, mx0, mx1, mx2, adr0;
            
    wire cen0, cen1, cen2, chold0;
            
            multiplier dut1 (Xt0,cr0,mx0);
            multiplier dut2 (Xt1,cr1,mx1);
            multiplier dut3 (Xt2,cr2,mx2);
            
            carryskipadder dut4 (mx0, mx1, adr0 ,carry);
            carryskipadder dut5 (adr0, mx2, y_wire,y[15]);
            
            decoder2x4 dut0 (ca0, ca1, cen0, cen1, cen2, chold0, cen);
            
            always @(posedge clk or posedge rst)
            if (rst) begin
            Xt0 <= 12'd0;
            Xt1 <= 12'd0;
            Xt2 <= 12'd0;
            end else if (cen) begin
            Xt0 <= x;
            Xt1 <= Xt0;
            Xt2 <= Xt1;
            end
            
            //
            always @(posedge clk or posedge rst)
            if (rst) begin
            cr0 <= 12'd0;
            cr1 <= 12'd0;
            cr2 <= 12'd0;
            end else if(cen0) begin
            cr0 <= c0;
            end else if (cen1) begin
            cr1 <= c1;
            end else if (cen2) begin
            cr2 <= c2;
            end
            //
            
            always @(posedge clk or posedge rst)
            begin
            if (rst) begin
            y_reg <= 12'd0;
            end else if(cen) begin
            y_reg <= y_wire;
            end
            end
            
            assign y= y_reg;
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 19:33:12
// Design Name: 
// Module Name: tb_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_mul();

reg reset;
reg clk;
reg [3:0] a;
reg sel;
reg [3:0] b;
wire [7:0] y;
wire z;

mul uut(reset,clk, a, sel, b, y, z);


initial begin
b = 4'b1111;
a = 4'b1110;
end

initial begin
    reset = 1;
    sel = 1;
    #41; 
    sel = 0;
    reset = 0;
end 

initial begin
clk = 0;
forever #20 clk = ~clk;
end 

endmodule

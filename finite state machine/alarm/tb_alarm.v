`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 16:03:17
// Design Name: 
// Module Name: tb_alarm
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


module tb_alarm();

reg clk;
reg [2:0] x;
reg sel;
wire y;

alarm uut(clk, x, sel, y);

initial begin
x = 0;
sel = 0;
end

initial begin
sel = 1;
#65;
x = 1;
#20;
x = 7;
#20;
x = 0;
#20;
x = 0;
#5
sel = 0;

#20;
x = 3;
#20;
x = 5;
#20;
x = 1;
#20;
x = 7;
#20;
x = 0;
#20;
x = 0;
end

initial begin
  clk = 0;
  forever begin
  clk = ~clk;
  #10;
  end
end

endmodule
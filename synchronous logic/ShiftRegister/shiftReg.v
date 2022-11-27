`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2022 11:10:49
// Design Name: 
// Module Name: shiftReg
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


module dff(
input D,
input Clk,
output reg Q
);

initial Q = 0;

always @(posedge Clk)
begin
Q <= D;
end
endmodule

module shiftReg4(
input In,
input Clk,
output [3:0] Out
);

dff d1(In, Clk, Out[0]);
dff d2(Out[0], Clk, Out[1]);
dff d3(Out[1], Clk, Out[2]);
dff d4(Out[2], Clk, Out[3]);

endmodule

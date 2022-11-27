`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2022 12:02:17
// Design Name: 
// Module Name: tb_shiftReg
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


module tb_shiftReg();

// reg D;
// reg Clk;
// wire Q;

// dff uut(D, Clk, Q);

// initial begin
//     Clk = 0;
//     forever #5 Clk = ~Clk;
// end

// initial begin
//     D = 0;
//     forever #10 D = ~D;
// end


reg In;
reg Clk;
wire [3:0] Out;

shiftReg4 uut(In, Clk, Out);

initial begin
    Clk = 0;
    forever #2 Clk = ~Clk;
end

initial begin
    In = 1;
    forever #9 In = ~In;
end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 13:58:15
// Design Name: 
// Module Name: tb_SerialAdd
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


module tb_SerialAdd();

reg [3:0] ParallerDin1;
reg [3:0] ParallerDin2;
reg Sel;
reg Clk;
wire sum;
wire [3:0] ParallerDout;

SerialAdd uut(ParallerDin1, ParallerDin2, Sel, Clk, sum, ParallerDout);


initial begin
    ParallerDin1 = 4'b1100;
    ParallerDin2 = 4'b0001;
end

initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
end

initial begin
    Sel = 1;
    #11 Sel = 0;
end

endmodule

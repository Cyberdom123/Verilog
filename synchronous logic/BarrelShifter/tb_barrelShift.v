`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 23:13:58
// Design Name: 
// Module Name: tb_barrelShift
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


module tb_barrelShift();
    reg clk;
    reg [7:0] x;
    reg [3:0] shift_n;
    wire[7:0] y;
    
    barrelShift uut(clk, x, shift_n, y);
    
    initial begin
        clk = 0;
        forever #23 clk = ~clk;
    end
    
    initial begin
     x = 8'b00011010;
     shift_n = 0; #100
     shift_n = 1; #100
     shift_n = 2; #100
     shift_n = 3; #100
     shift_n = 4; #100
     shift_n = 5; #100
     shift_n = 6; #100
     shift_n = 7;
     
    end
endmodule

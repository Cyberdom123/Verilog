`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 12:58:49
// Design Name: 
// Module Name: tb_BarrelMultiplication
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

module tb_BarrelMultiplication();
    reg clk;
    reg [7:0] x;
    reg [3:0] shift_n;
    wire[7:0] y;
    wire overflow;
    
    BarrelMultiplication uut(clk, x, shift_n, y, overflow);

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        x = -8'd15;
    end
    
    initial begin
        shift_n = 0;
        #50
        shift_n = 1;
        #50
        shift_n = 2;
        #50
        shift_n = 3;
        #50    
        shift_n = 4;
        #50
        shift_n = 5;
        #50
        shift_n = 6;
        #50
        shift_n = 7;
    end

endmodule
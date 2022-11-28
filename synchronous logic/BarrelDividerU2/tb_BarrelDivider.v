`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 00:06:47
// Design Name: 
// Module Name: tb_BarrelDivider
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


module tb_BarrelDivider();
    reg clk;
    reg [7:0] x;
    reg [3:0] shift_n;
    wire[7:0] y;
    
    BarrelDivider uut(clk, x, shift_n, y);
    
    initial begin
        clk = 0;
        forever #23 clk = ~clk;
    end
    
    initial begin
        x = -8'd23;
        
        shift_n = 0; #50
        shift_n = 1; #50
        shift_n = 2; #50
        shift_n = 3; #50    
        shift_n = 4; #50
        shift_n = 5; #50
        shift_n = 6; #50
        shift_n = 7; #50 
        
        x = 8'd23;
        shift_n = 0; #50
        shift_n = 1; #50
        shift_n = 2; #50
        shift_n = 3; #50    
        shift_n = 4; #50
        shift_n = 5; #50
        shift_n = 6; #50
        shift_n = 7;   
    end
endmodule


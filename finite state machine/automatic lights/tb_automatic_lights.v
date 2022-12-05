`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 10:27:22
// Design Name: 
// Module Name: tb_automatic_lights
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


module tb_automatic_lights();
    wire light;
    reg entering;
    reg clk;
    
    automatic_lights uut(light, entering, clk);
    
    initial begin
        clk = 0;
        entering = 1;
        #60 clk = 1;
        #60 clk = 0;
        #60 clk = 1;
        #60 clk = 0;
        entering = 0;
        #60 clk = 1;
        #60 clk = 0;
        #60 clk = 1;
        #60 clk = 0;
        #60 clk = 1;
        #60 clk = 0;
        entering = 1;
        #60 clk = 1;
        #60 clk = 0;
        entering = 0;
        #60 clk = 1;
        #60 clk = 0;
    end
endmodule

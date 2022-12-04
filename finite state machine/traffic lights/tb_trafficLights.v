`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2022 20:35:03
// Design Name: 
// Module Name: tb_trafficLights
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


module tb_trafficLights();

    reg clk;
    wire red;
    wire ora;
    wire gre;
    
    reg [3:0] czas = 4'b0000;
    
    trafficLights uut(red, ora, gre, clk);
      
    initial begin
        clk = 0;
        #40;
        forever #20 clk = ~clk;
    end
endmodule

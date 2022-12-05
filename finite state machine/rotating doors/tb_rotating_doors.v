`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 18:29:00
// Design Name: 
// Module Name: tb_rotating_doors
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


module tb_rotating_doors();
    wire a, b, c, d, e, f;
    reg clk, nearby, inside, stuck;
    
    rotating_doors uut(a, b, c, d, e, f, clk, nearby, inside, stuck);
    
    initial begin
        clk = 0;
        nearby = 0;
        inside = 0;
        stuck = 0;
    end
    
    initial begin
        forever begin
            clk = ~clk; 
            #2;
        end
    end
    
    initial begin
        stuck = 1;
        inside = 1;
        nearby = 1;
        #200;
        stuck = 0;
        #300;
        nearby = 0;
        #300
        inside = 0;
    end
endmodule

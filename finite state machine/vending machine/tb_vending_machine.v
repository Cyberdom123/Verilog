`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 11:02:45
// Design Name: 
// Module Name: tb_vending_machine
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


module tb_vending_machine();
    reg clk;
    
    reg coin_1;
    reg coin_2;
    reg coin_5;
    reg coin_10;
    reg coin_20;
    reg coin_50;
    
    wire drink;
    wire coin_1_o;
    wire coin_2_o;
    wire coin_5_o;
    wire coin_10_o;
    wire coin_20_o;
    wire coin_50_o;

    vending_machine uut(drink, coin_1_o, coin_2_o, coin_5_o, coin_10_o, coin_20_o, coin_50_o, clk, coin_1, coin_2, coin_5, coin_10, coin_20, coin_50);
    
    initial begin
        clk = 0;
        coin_1 = 0;
        coin_2 = 0;
        coin_5 = 0;
        coin_10= 0;
        coin_20= 0;
        coin_50= 0;
    end
    
    initial begin
        forever begin
            clk = ~clk; 
            #20;
        end
    end
    
//  5zl coin
//    initial begin
//        coin_50 = 1;
//        #20;
//        coin_50 = 0;
//    end  
//  2*2zl
    initial begin
        coin_20 = 1;
        #60;
        coin_20 = 0;
    end    

endmodule

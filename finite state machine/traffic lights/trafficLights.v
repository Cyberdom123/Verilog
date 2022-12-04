`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2022 20:34:35
// Design Name: 
// Module Name: trafficLights
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


module trafficLights(
    output red,
    output orange,
    output green,
    input clk,
    input rst
);
    reg [3:0] cycles;
    reg red_reg;
    reg orange_reg;
    reg green_reg;

initial begin
    red_reg = 0;
    orange_reg = 0;
    green_reg = 0;
    cycles = 0;
end

assign red = red_reg;
assign orange = orange_reg;
assign green = green_reg;  

always @(posedge clk) begin
cycles = cycles + 1;    

    if (cycles == 13)
        cycles = 0;
        
    if (cycles <= 2)
        red_reg = 1;
    else
        red_reg <= 0;
    
    if ((cycles == 2) | (cycles >= 11 & cycles <= 12))
        orange_reg <= 1;
    else
        orange_reg <= 0;
    
    if (cycles >= 3 & cycles <= 10)
        green_reg <= 1;
    else
        green_reg <= 0;
end

endmodule

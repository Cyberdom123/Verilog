`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 10:26:52
// Design Name: 
// Module Name: automatic_lights
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


module automatic_lights(
    output light,
    input entering,
    input clk
    );
    
reg [7:0] people;
reg light_reg;

assign light = light_reg;
    
initial begin
    people = 0;
    light_reg = 0;
end

always@(posedge clk) begin
    if(entering == 1)
        people = people + 1;
    if(entering == 0 & people > 0)
        people = people - 1;
end

always@(people) begin
    if(people > 0)
        light_reg = 1;
    else
        light_reg = 0; 
end 
    
endmodule

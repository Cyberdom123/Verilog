`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 11:21:39
// Design Name: 
// Module Name: tb_NonZeroBits
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


module tb_NonZeroBits();
    reg [7:0] x;
    wire [3:0] y;
        
    NonZeroBits uut(x, y);
    
    initial begin
    
        for (x = 8'b00000000; x<=8'b11111111; x = x + 1) begin
            #3;
        end
        
        
    end

endmodule

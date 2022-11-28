`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 00:05:19
// Design Name: 
// Module Name: BarrelDivider
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

module Mul2 ( //2bit
    input  x1,
    input  x2,
    input  sel,
    output out 
    );  
    assign out = (~sel & x1) | (sel & x2);
endmodule

module Mul4( //4bit
    input [3:0] x,
    input [1:0] sel,
    output out1
    );
    wire t1, t2;
    Mul2 m1 (x[0], x[1], sel[0], t1);
    Mul2 m2 (x[2], x[3], sel[0], t2);
    Mul2 main (t1, t2, sel[1], out1);
endmodule

// 8 bit barrel divider U2
module BarrelDivider(
    input clk,
    input [7:0] in,
    input [2:0] shift_n,
    output [7:0] out
    );
    
    reg [2:0] s_n;
    always @(posedge clk)
        s_n <= shift_n;
        
    Mul8 b0 ({in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0]} , s_n, out[0]);
    Mul8 b1 ({in[7], in[7], in[6], in[5], in[4], in[3], in[2], in[1]} , s_n, out[1]);
    Mul8 b2 ({in[7], in[7], in[7], in[6], in[5], in[4], in[3], in[2]} , s_n, out[2]);
    Mul8 b3 ({in[7], in[7], in[7], in[7], in[6], in[5], in[4], in[3]} , s_n, out[3]);
    Mul8 b4 ({in[7], in[7], in[7], in[7], in[7], in[6], in[5], in[4]} , s_n, out[4]);
    Mul8 b5 ({in[7], in[7], in[7], in[7], in[7], in[7], in[6], in[5]} , s_n, out[5]);
    Mul8 b6 ({in[7], in[7], in[7], in[7], in[7], in[7], in[7], in[6]} , s_n, out[6]);
    Mul8 b7 ({in[7], in[7], in[7], in[7], in[7], in[7], in[7], in[7]} , s_n, out[7]);
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 12:56:12
// Design Name: 
// Module Name: BarrelMultiplication
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

module Mul8( //8bit
    input [7:0] x,
    input [2:0] sel,
    output out1
    );
    wire t1, t2;
    Mul4 m1 (x[3:0], sel[1:0], t1);
    Mul4 m2 (x[7:4], sel[1:0], t2);
    Mul2 main(t1, t2, sel[2], out1);
endmodule

module BarrelMultiplication(
    input [3:0] in,
    input [1:0] s_n,
    output [3:0] out
    );
    
         
    Mul4 b0 ({in[0], in[0], in[0], in[0]}, s_n, out[3]);
    Mul4 b1 ({0, in[1], in[1], in[1]}, s_n, out[2]);
    Mul4 b2 ({0,   0  , in[2], in[2]}, s_n, out[1]);
    Mul4 b3 ({0,   0  ,   0  , in[3] }, s_n, out[0]);
endmodule

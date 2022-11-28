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

module Overflow(
    input clk,
    input [7:0] x,
    input [3:0] s_n, 
    output overflow
);
    reg overflow_reg;
    assign overflow = overflow_reg;

    always@(posedge clk, negedge clk) begin
        if (x[7] == 0) begin
            if(s_n == 0) 
                overflow_reg <= 0;
            else if (s_n == 1 && (x[6] == 1))
                overflow_reg <= 1;
            else if (s_n == 2 && (x[6] == 1 || x[5] == 1))
                overflow_reg <= 1;
            else if (s_n == 3 && (x[6] == 1 || x[5] == 1 || x[4] == 1))
                overflow_reg <= 1;
            else if (s_n == 4 && (x[6] == 1 || x[5] == 1 || x[4] == 1 || x[3] == 1))
                overflow_reg <= 1;
            else if (s_n == 5 && (x[6] == 1 || x[5] == 1 || x[4] == 1 || x[3] == 1 || x[2] == 1))
                overflow_reg <= 1;
            else if (s_n == 6 && (x[6] == 1 || x[5] == 1 || x[4] == 1 || x[3] == 1 || x[2] == 1 || x[1] == 1))
                overflow_reg <= 1;
            else if (s_n == 7 && (x[6] == 1 || x[5] == 1 || x[4] == 1 || x[3] == 1 || x[2] == 1 || x[1] == 1 || x[0] == 1))
                overflow_reg <= 1;
            else
                overflow_reg <= 0;
        end
        else begin
            if(s_n == 0) 
                overflow_reg <= 0;
            else if (s_n == 1 && (x[6] == 0))
                overflow_reg <= 1;
            else if (s_n == 2 && (x[6] == 0 || x[5] == 0))
                overflow_reg <= 1;
            else if (s_n == 3 && (x[6] == 0 || x[5] == 0 || x[4] == 0))
                overflow_reg <= 1;
            else if (s_n == 4 && (x[6] == 0 || x[5] == 0 || x[4] == 0 || x[3] == 0))
                overflow_reg <= 1;
            else if (s_n == 5 && (x[6] == 0 || x[5] == 0 || x[4] == 0 || x[3] == 0 || x[2] == 0))
                overflow_reg <= 1;
            else if (s_n == 6 && (x[6] == 0 || x[5] == 0 || x[4] == 0 || x[3] == 0 || x[2] == 0 || x[1] == 0))
                overflow_reg <= 1;
            else if (s_n == 7 && (x[6] == 0 || x[5] == 0 || x[4] == 0 || x[3] == 0 || x[2] == 0 || x[1] == 0 || x[0] == 0))
                overflow_reg <= 1;
            else
                overflow_reg <= 0;
        end
    end
endmodule

module BarrelMultiplication(
    input  clk,
    input  [7:0] in,
    input  [3:0] s_n,
    output [7:0] out,
    output overflow
    );
    
    Mul8 b0 ({  0  ,   0  ,   0  ,   0  ,   0  ,   0  ,   0  , in[0]}, s_n, out[0]);
    Mul8 b1 ({  0  ,   0  ,   0  ,   0  ,   0  ,   0  , in[0], in[1]}, s_n, out[1]);
    Mul8 b2 ({  0  ,   0  ,   0  ,   0  ,   0  , in[0], in[1], in[2]}, s_n, out[2]);
    Mul8 b3 ({  0  ,   0  ,   0  ,   0  , in[0], in[1], in[2], in[3]}, s_n, out[3]);
    Mul8 b4 ({  0  ,   0  ,   0  , in[0], in[1], in[2], in[3], in[4]}, s_n, out[4]);
    Mul8 b5 ({  0  ,   0  , in[0], in[1], in[2], in[3], in[4], in[5]}, s_n, out[5]);
    Mul8 b6 ({  0  , in[0], in[1], in[2], in[3], in[4], in[5], in[6]}, s_n, out[6]);
    Mul8 b7 ({in[7], in[7], in[7], in[7], in[7], in[7], in[7], in[7]}, s_n, out[7]);
    
    Overflow of (clk, in, s_n, overflow);
endmodule

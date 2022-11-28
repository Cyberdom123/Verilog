`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 22:47:57
// Design Name: 
// Module Name: barrelShift
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

// multiplexer
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

// 8 bit barrel shifter
module barrelShift(
    input clk,
    input [7:0] in,
    input [2:0] shift_n,
    output [7:0] out
    );
    
    reg [2:0] s_n;
    always @(posedge clk)
        s_n <= shift_n - 1;
        
    Mul8 b0 ({in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7]} , s_n, out[0]);
    Mul8 b1 ({in[1], in[2], in[3], in[4], in[5], in[6], in[7], in[0]} , s_n, out[1]);
    Mul8 b2 ({in[2], in[3], in[4], in[5], in[6], in[7], in[0], in[1]} , s_n, out[2]);
    Mul8 b3 ({in[3], in[4], in[5], in[6], in[7], in[0], in[1], in[2]} , s_n, out[3]);
    Mul8 b4 ({in[4], in[5], in[6], in[7], in[0], in[1], in[2], in[3]} , s_n, out[4]);
    Mul8 b5 ({in[5], in[6], in[7], in[0], in[1], in[2], in[3], in[4]} , s_n, out[5]);
    Mul8 b6 ({in[6], in[7], in[0], in[1], in[2], in[3], in[4], in[5]} , s_n, out[6]);
    Mul8 b7 ({in[7], in[0], in[1], in[2], in[3], in[4], in[5], in[6]} , s_n, out[7]);
endmodule

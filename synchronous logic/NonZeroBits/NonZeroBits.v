`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 11:06:56
// Design Name: 
// Module Name: NonZeroBits
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

//full adder module
module Add (cin, a, b, sum, cout);
    input cin; // carry in (1 bit)
    input a, b; // inputs (1 bit)
    output sum; // sum (1 bit)
    output cout; // carry out (1 bit)
    // sum equasion: sum = a xor b xor c in
    assign sum = a ^ b ^ cin;
    // carry out equasion:
    // c out = (a and b) or (a and c in) or (b and c in)
    assign cout = (a & b ) | (a & cin ) | (b & cin);
endmodule

// non zero bits counter
module NonZeroBits(
    input [7:0] x,
    output [3:0] y
);
    wire [1:0] E, F, G, H, I, J;
    
    Add S0 (x[0], x[1], x[2], E[0], E[1]);
    Add S1 (x[3], x[4], x[5], F[0], F[1]);
    Add S2 (x[6], x[7],  0  , G[0], G[1]);
   
    Add S3 (  0 , E[0], F[0], H[0], H[1]);
    Add S4 (H[1], E[1], F[1], I[0], I[1]);
    
    Add S5 (  0 , H[0], G[0], y[0], J[0]);
    Add S6 (J[0], I[0], G[1], y[1], J[1]);
    Add S7 (J[1], I[1],   0 , y[2], y[3]);

endmodule

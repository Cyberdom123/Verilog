`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.11.2022 13:39:01
// Design Name: 
// Module Name: SerialAdd
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


//D flip flop
module dff(
input D,
input Clk,
output reg Q
);

initial Q = 0;

always @(posedge Clk)
begin
Q <= D;
end
endmodule

//1bit PISO register
module PISO1(
  input D,
  input Din,
  input Sel,
  input Clk,
  output Dout
);

wire y;

assign y = ((D & Sel) || (Din & ~Sel));

dff d1(y, Clk, Dout);

endmodule

//4 bit PISO register
module PISO4(
  input [3:0] D,
  input Sel,
  input Clk,
  output Dout
);

wire Din;
assign Din = 0;
wire [2:0] Dy;

PISO1 piso1(D[3], Din, Sel, Clk, Dy[0]);
PISO1 piso2(D[2], Dy[0], Sel, Clk, Dy[1]);
PISO1 piso3(D[1], Dy[1], Sel, Clk, Dy[2]);
PISO1 piso4(D[0], Dy[2], Sel, Clk, Dout);

endmodule

//4bit SIPO register
module SIPO4(
  input Din,
  input Clk,
  output [3:0] D
);

dff d1(Din, Clk, D[3]);
dff d2(D[3], Clk, D[2]);
dff d3(D[2], Clk, D[1]);
dff d4(D[1], Clk, D[0]);

endmodule

//1bit adder
module Add (a, b, cin, sum, cout);
    input a, b; 
    input cin;
    output sum;
    output cout; 

    assign sum = a ^ b ^ cin;

    assign cout = (a & b ) | (a & cin ) | (b & cin);
endmodule 


module SerialAdd(
    input [3:0] ParallerDin1,
    input [3:0] ParallerDin2,
    input Sel,
    input Clk,
    output sum,
    output [3:0] ParallerDout
    );

    wire [1:0] SerialDout;
    wire c;

    PISO4 piso1(ParallerDin1, Sel, Clk, SerialDout[0]);
    PISO4 piso2(ParallerDin2, Sel, Clk, SerialDout[1]);

    Add add1(SerialDout[0], SerialDout[1], c, sum, c);


    SIPO4 sipo1(sum, Clk, ParallerDout);

endmodule

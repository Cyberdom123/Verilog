`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2022 13:30:48
// Design Name: Serial Transmission
// Module Name: serialTran
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


//4bit transmission

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

//1bit sipo register
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

//4 bit SIPO register
module PISO4(
  input [3:0] D,
  input Sel,
  input Clk,
  output Dout
);

wire Din;
assign Din = 0;
wire [2:0] Dy;

SIPO1 sipo1(D[3], Din, Sel, Clk, Dy[0]);
SIPO1 sipo2(D[2], Dy[0], Sel, Clk, Dy[1]);
SIPO1 sipo3(D[1], Dy[1], Sel, Clk, Dy[2]);
SIPO1 sipo4(D[0], Dy[2], Sel, Clk, Dout);

endmodule

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

module ParityCheck(
  input [3:0] In,
  output Out
);
  assign Out = ^In;
endmodule

//transmission takes 4 (depending on the number of bits) clock cycles
module serialTran(
    input [3:0] ParallerDin,
    input Sel,
    input Clk,
    output SerialDout,
    output ParityCheckErr,
    output [3:0] ParallerDout
    );

    wire [1:0] ParityCheckValue;

    PISO4 piso(ParallerDin, Sel, Clk, SerialDout);
    SIPO4 sipo(SerialDout, Clk, ParallerDout);


    ParityCheck parityCheckPiso(ParallerDin, ParityCheckValue[0]);
    ParityCheck parityCheckSipo(ParallerDout, ParityCheckValue[1]);

    assign ParityCheckErr = ^ParityCheckValue;
endmodule

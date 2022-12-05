`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 18:30:18
// Design Name: 
// Module Name: mul
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

module mul(
input reset,
input clk,
input [3:0] x,
input sel,
input [3:0] b,
output [7:0] y,
output a
);

PISO4 piso(x, sel, clk, a);

reg [3:0] fb;
reg [4:0] fb1;
reg [7:0] fy;


reg [1:0] state;
reg [1:0] next_state;

parameter dig0=2'd0, dig1=2'd1, dig2=2'd2, dig3=2'd3; 

initial begin
    state = dig0;
    next_state = dig0;
    fy = 8'd0;
end

assign y = fy;


always @(posedge clk) begin
    if(!reset) begin
        fb = b;
        case(state)
            dig0: begin
                if(a) fy[3:0] = fb;
                next_state = dig1;
            end
            dig1: begin
                if(a) begin
                    fb1 = fy[5:1];
                    fb1 = fb1 + fb;
                    fy[5:1] = fb1;
                end
                next_state = dig2;
            end
            dig2: begin
                if(a) begin
                    fb1 = fy[6:2];
                    fb1 = fb1 + fb;
                    fy[6:2] = fb1;
                end
                next_state = dig3;
            end
            dig3: begin
                if(a) begin
                    fb1 = fy[7:3];
                    fb1 = fb1 + fb;
                    fy[7:3] = fb1;
                end
                next_state = dig0;
            end
        endcase
    end 
end


always@(negedge clk) begin
    state <= next_state;
end

endmodule
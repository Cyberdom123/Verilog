`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2022 15:37:53
// Design Name: 
// Module Name: alarm
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


module alarm(
input clk,
input [2:0] x,
input sel,
output reg y
);

reg [1:0] state;
reg [1:0] next_state;
reg [2:0] a0, a1, a2, a3;
parameter dig0=2'd0, dig1=2'd1, dig2=2'd2, dig3=2'd3; 

initial begin
    a0 = 0;
    a1 = 0;
    a2 = 0;
    a3 = 0;
    y = 0;
    state = dig0;
    next_state = dig0;
end

always @(posedge clk)begin
if(sel & y) begin
    case(state)
        dig0: begin
            a0 = x;
            next_state = dig1;
        end
        dig1: begin
            a1 = x;
            next_state = dig2;
        end
        dig2: begin
            a2 = x;
            next_state = dig3;
        end
        dig3: begin
            a3 = x;
            next_state = dig1;
        end
    endcase
end
else begin
    case(state)
        dig0: begin
            if(x == a0) begin
              y = 0; 
              next_state = dig1;
            end
            else y = 0; 
        end
        dig1: begin
            if(x == a1) next_state = dig2; 
            else next_state = dig0;
        end
        dig2: begin
            if(x == a2) next_state = dig3; 
            else next_state = dig0;
        end
        dig3: begin
            if(x == a3) begin
                next_state = dig0; 
                y = 1;
            end
            else next_state = dig0;
        end
    endcase
end

end
always@(negedge clk) begin
    state <= next_state;
end

endmodule

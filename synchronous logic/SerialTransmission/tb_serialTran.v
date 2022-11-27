`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.11.2022 14:24:50
// Design Name: 
// Module Name: tb_serialTran
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


module tb_serialTran();

// reg D;
// reg Din;
// reg Sel;
// reg Clk;
// wire Dout;

// PISO1 piso1(D; Din, Sel, Clk, Dout);

// initial begin
// assign Din = 0;
// assign Sel = 0;
// assign D = 1;
// end

// initial begin
// Clk = 0;
// forever #5 Clk = ~Clk;
// end


// reg [3:0] D;
// reg Sel;
// reg Clk;
// wire Dout;

// PISO4 piso4(D, Sel, Clk, Dout);

// initial begin
//     D = 4'b0010;
//     Sel = 1;
//     Clk = 0;
// end

// initial begin
//     forever #5 Clk = ~Clk;
// end

// initial begin
//     #11 Sel = 0;
// end


// reg In;
// reg Clk;
// wire [3:0] Out;

// SIPO4 uut(In, Clk, Out);

// initial begin
//     Clk = 0;
//     forever #2 Clk = ~Clk;
// end

// initial begin
//     In = 1;
//     forever #9 In = ~In;
// end


//-------------------------

reg [3:0] ParallerDin;
reg Sel;
reg Clk;
wire SerialDout;
wire ParityCheckErr;
wire [3:0] ParallerDout;

serialTran uut(ParallerDin, Sel, Clk, SerialDout, ParityCheckErr, ParallerDout);


initial begin
    ParallerDin = 4'b1111;
end

initial begin
    Clk = 0;
    forever #5 Clk = ~Clk;
end

initial begin
    Sel = 1;
    #11 Sel = 0;
end

endmodule

//multiplexer 4:1
module Mul( //2bit
    input  x1,
    input x2,
    input  sel,
    output out 
    );  
    assign out = (~sel & x1) | (sel & x2);
endmodule

module Mul2( //4bit
    input [3:0] x,
    input [1:0] sel,
    output out1
    );
    wire t1, t2;
    Mul m1 (x[0], x[1], sel[0], t1);
    Mul m2 (x[2], x[3], sel[0], t2);
    Mul main (t1, t2, sel[1], out1);
endmodule

module Mul3( //8bit
    input [7:0] x,
    input [2:0] sel,
    output out1
    );
    wire t1, t2;
    Mul2 m1 (x[3:0], sel[1:0], t1);
    Mul2 m2 (x[7:4], sel[1:0], t2);
    Mul main(t1, t2, sel[2], out1);
endmodule
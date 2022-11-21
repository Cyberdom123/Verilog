module Com(
    input [2:0] A,
    input [2:0] B,
    output y0,
    output y1,
    output y2
    );
    wire [2:0] yp;
    
    assign yp[0] = ~B[2] & A[2];
    assign yp[1] = ~(A[2] ^ B[2]) & (A[1] & ~B[1]);
    assign yp[2] = ~(A[2] ^ B[2]) & ~(A[1] ^ B[1])& (A[0] & ~B[0]);
    
    assign y0 = |yp;
    assign y1 = ~(A[0] ^ B[0]) & ~(A[1] ^ B[1]) &  ~(A[2] ^ B[2]);
    assign y2 = ~y0 & ~y1;
    
endmodule
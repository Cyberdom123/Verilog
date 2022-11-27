//testbeanch mul
module tb_Mul();
reg [3:0] x;
reg [1:0] sel;
wire out1;

Mul2 utt (x, sel, out1);

initial begin
 x[0] = 0;
 forever #2 x[0] = ~x[0];
end

initial begin
    x[1] = 0;
    forever #4 x[1] = ~x[1];
end

initial begin
    x[2] = 0;
    forever #8 x[2] = ~x[2];
end

initial begin
    x[3] = 0;
    forever #16 x[3] = ~x[3];
end

initial begin
    sel[0] = 0;
    forever #32 sel[0] = ~sel[0];
end

initial begin
    sel[1] = 0;
    forever #64 sel[1] = ~sel[1];
end
endmodule
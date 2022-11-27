module tb_comp();

reg [2:0] A;
reg [2:0] B;
wire y0;
wire y1;
wire y2;

Com uut(A, B, y0, y1, y2);

initial begin
A = 3'b101;
B = 3'b111;
end


endmodule
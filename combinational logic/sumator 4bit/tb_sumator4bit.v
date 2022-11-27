//sumator test beanch
module tb_add();
Add uut (a1, b1, cin1, sum1, cout1);
reg a1;
reg b1;
reg cin1;
wire sum1;
wire cout1;


initial begin
 a1 = 0;
 forever #2 a1 = ~a1;
end

initial begin
    b1 = 0;
    forever #4 b1 = ~b1;
end

initial begin
    cin1 = 0;
    forever #8 cin1 = ~cin1;
end


//4 bitowy sumator
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout; 
Add4 uut2 (a, b, cin, sum, cout);
initial begin
    cin = 0;
    a = 4'b0001;
    b = 4'b0100;
end

endmodule
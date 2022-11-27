module tb_AddSub();

reg en;
reg [3:0] a;
reg [3:0] b;
reg cin;
wire [3:0] sum;
wire cout; 
AddSub4 uut2 (a, b, cin, en, sum, cout);
initial begin
    en = 1;
    cin = 0;
    a = 4'b0100;
    b = 4'b0001;
end

endmodule
module AddSub (a, b, cin, en, sum, cout);
    input en;
    input a, b; // składniki sumy (1 bit)
    input cin; // przeniesienie wej´sciowe (1 bit)
    output sum; // suma (1 bit)
    output cout; // przeniesienie wyj´sciowe (1 bit)
    // wzór na sum˛e: sum = a xor b xor c in
    assign sum = a ^ b ^ cin;
    // wzór na przeniesienie:
    // c out = (a and b) or (a and c in) or (b and c in)
    assign cout = ((a^en)& b ) | (((a^b)^en) & cin );
endmodule

module AddSub4 (a, b, cin, en, sum, cout);
    input en;
    input [3:0] a; // składnik sumy (4 bity)
    input [3:0] b; // składnik sumy (4 bity)
    input cin; // przeniesienie wej´sciowe (1 bit)
    output [3:0] sum; // suma (4 bity)
    output cout; // przeniesienie wyj´sciowe (1 bit)
    wire c1, c2, c3; // sygnały pomocnicze dla przeniesie´n
    // cztery instancje sumatora jednobitowego
    AddSub S1 (a[0], b[0], cin, en, sum[0], c1);
    AddSub S2 (a[1], b[1], c1, en, sum[1], c2);
    AddSub S3 (a[2], b[2], c2, en, sum[2], c3);
    AddSub S4 (a[3], b[3], c3, en, sum[3], cout);
endmodule
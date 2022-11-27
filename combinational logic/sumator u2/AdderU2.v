//sumator modul
module Add (a, b, cin, sum, cout);
    input a, b; // składniki sumy (1 bit)
    input cin; // przeniesienie wej´sciowe (1 bit)
    output sum; // suma (1 bit)
    output cout; // przeniesienie wyj´sciowe (1 bit)
    // wzór na sum˛e: sum = a xor b xor c in
    assign sum = a ^ b ^ cin;
    // wzór na przeniesienie:
    // c out = (a and b) or (a and c in) or (b and c in)
    assign cout = (a & b ) | (a & cin ) | (b & cin);
endmodule


module U2Add4 (a, b, cin, sum, cout);
    input [3:0] a; // składnik sumy (4 bity)
    input [3:0] b; // składnik sumy (4 bity)
    input cin; // przeniesienie wej´sciowe (1 bit)
    output [3:0] sum; // suma (4 bity)
    output cout; // przeniesienie wyj´sciowe (1 bit)
    wire c1, c2, c3, c4; // sygnały pomocnicze dla przeniesie´n
    // cztery instancje sumatora jednobitowego
    Add S1 (a[0], b[0], cin, sum[0], c1);
    Add S2 (a[1], b[1], c1, sum[1], c2);
    Add S3 (a[2], b[2], c2, sum[2], c3);
    Add S4 (a[3], b[3], c3, sum[3], c4); //cout -> c4
    
    assign cout = c3 ^ c4; //jedyna edycja potrzeba do sworzenia addera U2
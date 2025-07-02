module fulladdr1(output sum,c_out,
                input a,b,c_in);
        //intermediate wire declarartions
        wire s1,c1,s2;

        xor (s1,a,b);
        and (c1,a,b);

        xor (sum,s1,c_in);
        and (s2,s1,c_in);
        
        
        or (c_out,s2,c1);
endmodule

module fullbit4(sum,c_out,a,b,c_in);
    //I/O port decalration
    output [3:0] sum;
    output c_out;
  	input [3:0] a,b;
    input c_in;

    wire c1,c2,c3;//internal wire decalration

    fulladdr1 fa0(sum[0],c1,a[0],b[0],c_in);
    fulladdr1 fa1(sum[1],c2,a[1],b[1],c1);
  	fulladdr1 fa2(sum[2],c3,a[2],b[2],c2);
    fulladdr1 fa3(sum[3],c_out,a[3],b[3],c3);

endmodule
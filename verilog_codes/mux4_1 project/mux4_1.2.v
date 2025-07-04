//version 2 for implementing a 4 : 1 MUX by using the 
//conditional operators
module mux4_1(output out,
              input  s0,s1,i0,i1,i2,i3);
              assign out = s1 ? (s0 ? i2 : i3):(s0 ? i1 : i0);           
endmodule
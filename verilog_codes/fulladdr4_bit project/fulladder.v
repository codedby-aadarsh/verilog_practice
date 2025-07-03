// full adder using concatentation operator 
//{} this operator will store the msb in c_out and lsb in sum
// this is a 4 bit full adder
//it can also be run very easily with the same testbench as above

module fulladder(sum,c_out,a,b,c_in);
output  [3:0] sum;
output c_out;
input  [3:0] a,b;
input c_in;

assign {c_out,sum}=a+b+c_in;
endmodule

//so this mux will be using data flow modelling , not the gate level modelling
module mux4_1(out,s0,s1,in0,in1,in2,in3);
output out; 
input s0,s1; // 2 bit selector
input in0,in1,in2,in3; // 4 inputs  
assign out = (~s1 & ~s0 & in0) |
             (~s1 &  s0 & in1) |
             ( s1 & ~s0 & in2) |
             ( s1 &  s0 & in3);

endmodule

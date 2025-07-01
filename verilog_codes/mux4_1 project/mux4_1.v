// Code your design here
module mux4_1(out,i0,i1,i2,i3,s0,s1);
  //defining the i/o ports of 4:1 mux
  output out;
  input i0,i1,i2,i3,s0,s1;
  
  //internal wire declarations
  wire s0n,s1n,y0,y1,y2,y3;
  
  not (s0n,s0);
  not (s1n,s1);
  
  and (y0,i0,s1n,s0n);
  and (y1,i1,s1n,s0);
  and (y2,i2,s1,s0n);
  and (y3,i3,s1,s0);
  
  or (out,y0,y1,y2,y3);
endmodule;
  
  
  

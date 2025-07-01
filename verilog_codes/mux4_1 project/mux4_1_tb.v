module stimulus;
  reg I0,I1,I2,I3;
  reg S0,S1;
  wire OUT;
  mux4_1 m1(OUT,I0,I1,I2,I3,S0,S1);
  
  initial begin;
    I0=1;I1=0;I2=1;I3=0;
    S0=1;S1=0;
    //#1 are the small  delays for the signal set to propogate
   #1 $display("i0=%b,i0=%b,i0=%b,i0=%b,out=%b",I0,I1,I2,I3,OUT);
   S0=0;S1=1;
   #1 $display("i0=%b,i0=%b,i0=%b,i0=%b,out=%b",I0,I1,I2,I3,OUT);
  end;
endmodule; 
    
  

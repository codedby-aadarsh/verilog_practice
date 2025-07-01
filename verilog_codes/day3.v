// problem1: A 4bit parallel shift register has i/o pins, write the module defination for
//the module shift_reg. include the list of the ports adn port decalrations. you dont need
//tos show the internals.

// code : a shift reg have reg_in as input and a clock signal too and have output reg_out.

module shift_reg(reg_in,reg_out,clock);
	input [3:0] reg_in; //by default its net
	output reg[3:0] reg_out;
	input wire clock;
	//<internals>


endmodule
//second more preferred version -2 
module shift_reg (
  input wire [3:0] reg_in,
  output reg [3:0] reg_out,
  input wire clock
);
  // <internals>
endmodule

//problem2- decalre a top level module stimulus. define REG_IN and CLK as reg register variable
// and REG_OUT  as wire. instantiate the mdoule shift_reg and call it sr1. connect the port by
//ordered list or by name.

module stimulus;
  reg [3:0] REG_IN;
  reg CLK;
  wire [3:0] REG_OUT;	

  // instance of the shift_reg as sr1
  shift_reg sr1(REG_IN,REG_OUT,CLK); //BY ORDER
  shift_reg sr1(.reg_in(REG_IN),.reg_out(REG_OUT),.clock(CLK)); //BY NAME 
  
  //<INTERNALS>

endmodule;

//problem : create 2 input verilog gates called my_or,my_and and
//my_not gates, using the two input nand gates. also check the functionality
//of these gates using a stimulus
module my_or(output reg out,input reg in1,in2);
  reg out1,out2;
  nand (out1,in1,in1);
  nand (out2,in2,in2);
  nand(out,out1,out2);
endmodule

module my_and(output reg out,input reg in1,in2);
  reg out1;
  nand (out1,in1,in2);
  nand(out,out1,out1);
endmodule

module my_not(output reg out,input reg in1);
  nand (out,im1,in1);
endmodule

module stimulus;
  reg i1,i2;
  wire[2:0] out0;
  my_or m1(out0[0],i1,i2);
  my_and m2(out0[1],i1,i2);
  my_not m3(out0[2],i1);
  initial begin;
    i1=0;i2=0;
    #1 $display("the value of or gate at i1 =%b,i2=%b is :%B",i1,i2,out0[0]);
    #1 $display("the value of and gate at i1 =%b,i2=%b is :%B",i1,i2,out0[1]);
    #1 $display("the value of not gate at i1 =%b is :%B",i1,out0[2]);
  end
endmodule 
    
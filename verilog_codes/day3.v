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
//second more preferred version 
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
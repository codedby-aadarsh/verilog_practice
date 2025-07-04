
/*🔹 Problem 1: Simple assign statement
Write a module that declares a 4-bit wire a, assigns it the binary value 1010,
and uses $display to print its value.*/

//code :
module simple_assign;
  wire [3:0] a = 4'b1010;
  initial begin
    $display("Value of a is %b", a);
    $finish;
  end
endmodule

//🔹 Problem 2: Register assignment
//Write a module with a 3-bit register b, assign it decimal 5, 
//and display its value in binary and decimal format.

//code:
module regassign;
  reg [2:0] reg3b=3'd5;
  initial begin;
    $display("decimal value is : %d and binary value is : %b",reg3b,reg3b);
    $finish;
  end; 
endmodule; 
 
//🔹 Problem 3: Using parameters
//Declare a parameter called WIDTH = 8, then define a reg data of size WIDTH-1:0,
//assign it 8'b11001100, and display its value.    

//code :
module testmod;
  parameter WIDTH =8;
  reg [WIDTH-1:0] a= 8'b11001100;
  initial begin;
    $display("the value of the reg is %B",a);
    $finish;
  end;
endmodule;

//🔹 Problem 4: Monitoring
//Write a module with a clock signal (reg) that toggles every 5 time units. 
//Use $monitor to print the clock value over time.
module top;
  reg clock;

  // Toggle the clock every 5 time units
  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end
  // note - initial blocks run parallel unlike in normal programming language execution
// flow and forever keyword is a way to make infinite loop that toggles the clock at every
//#5 time unit.
  // Monitor the clock signal
  initial begin
    $monitor("Time = %0t | Clock = %b", $time, clock);
  end
endmodule


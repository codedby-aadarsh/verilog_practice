# System tasks  and compiler directives

- **system tasks -** all system tasks appear in the form $<keyword>. operations such as displaying on the screen , monitioring the value of nets, stopping and finishing  are done by system tasks.

 1. $display : 

| format  | display |
| --- | --- |
| %d or %D | to display variable in decimal |
| %b or %B | to display variable in binary |
| %s | display string  |
| %h | display hexadecimal  |
| %c | display ascii char  |
| %m | display hieharcical name |
| %v | display strength  |
| %o | display variable in octal |
| %t | display in current time format |
| %e | display numbers in the scientific format  |
| %f | display real number in the decimal format (ex -2.13) |
| %G | display real number in scientific or decimal whichever is shorter |

**note -** the format specifier can be written either in capital or small letters just like the starting first two.

```verilog
// displaying information :
$display(val1,val2,....,valn);
//values or val can be string,variables or expressions and this systasks inserts a newline at the end of the string by default and without any arguments produces a new line.
$display("hello world");
// above function to display charcter is quite similar to the c language printc function as you have to give format specifier for it.
$display($time);
$display(" id of the port is %b",port_id);
$display("At time %d virtual address is %h",$time,virtual_addr);
$display("This is a \n multiline string with a %% sign");
-- This is a 
-- multiline string with a % sign 
```

1. **Monitoring information** : verilog provides  a mechanism to monitor a signal when its value changes. this facility is provided by the $monitor task.
- syntax : $monitor(p1,p2,p3,..,pn)
paramters can be varibles like signal name ,quoted string and shares the similar format as the $display and unlike the display it only need to invoke once. and it continously monitors the value of the variable or signal when it changes once.
- only one of the $monitor can be active at a time and last monitor statement will be active.
- $monitoron and $monitoroff is used to turn on or off the monitoring and by default at start of the simulation its on.

```verilog
$monitor($time,"value of signal=%b reset = %B ",clock,reset);
-- 0 value of signals clock=0 reset =1
```

## stopping and finishing in a simulation

- $stop task puts the simulation in a interactive mode and like when you want to stop the exceution or suspend in the middle. and helps in debugging.
- $finish task terminates the simulation.

## Compiler Directives

they are defined using syntax  `<keyword>

1. **`define** - its similar to  the #define in C. and can define constant and they can be  refer and used in the code by preceding with the `(backtick).

```verilog
`define WORD_SIZE 32;
//used as `WORD_SIZE in the code
`define WORD_REG reg [31:0]
// defined a 32 bit wide register WORD_REG 
```

1. `include : its also similar to the #include in C, and allows to include the entire contents of a verilog source file in another verilog file during compilation.

```verilog
`include header.v
```
---
## Thank you for reading !!

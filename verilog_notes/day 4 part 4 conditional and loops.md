# Conditional Statements  and loops

- we already know about the conditional statements as what they are like if else ,switch case statements, they follow a condition which when true executes their respective statements.
### if - else statements
```verilog 
if (<expression>) true_statement ;

if (<expression>) true_statement ; else false_statement;

if (<expression>) true_statement ;
else if (<expression>) true_statement ;
else if (<expression>) true_statement ;
else  default_statement;

//any non zero value is considered to be true , be it negative or postive
//if a block have multiple statements , then they must be grouped with the begin and end just like in C using {}.

```
### case Statements
- The keyword `case` ,`endcase` and `default` are used in the case statements.
```verilog 
case (expression)
    alternative1 : statement1;
    alternative2 : statement2;
    alternative3 : statement3;
    alternative4 : statement4;
    default : default_statement;
endcase

//eg 
reg [1:0] alu_control;
case (alu_control)
    2'd0 : y=x+z;
    2'd1 : y=x-z;
    2'd2 : y=x*z;
    default : $display("invalid ALU control signal");
endcase
```
- There are two variations of the case statement.They are denoted by keywords `casex` and `casez`.
- `casez` - this case statement consider all z values in the case expression or the alternative as dont care bit, and only the non x or z position values are considered, while the `casez` consider all z values as the dont care, the `casex` consider both x or z values as dont care.
```verilog
// as in this example only 1 bit postion are considered
reg [3:0] encoding;
integer next_state;
casex(encoding)
4'b1xxx : next_state=3;
4'bx1xx : next_state=2;
4'bxx1x : next_state=1;
4'bxxx1 : next_state=0;
default : next_state=0;
endcase
```

# Loops
- There are four types of the loops statements in verilog : `while` , `for` ,`repeat`,and `forever`.
- All this loop statements can only appear inside the `initial` and `always` block.
## while loop
- we arent going in detail on this loops as they are common ones found in the all programming languages, ill do the example and the syntax and block can be grouped by the `begin` and `end` keywords.
```verilog
integer count;
initial 
begin 
    count =0 ;
    while (count <128)
    begin 
    $display("count=%d",count);
    count =count +1
    end
end
```
## for loop
```verilog 
integer count;
initial //must as the loop can only be inside the initial and always block
    for (count=0;count<128;count=count+1)
        $display("count=%d",count);
```
## Repeat loop
- The repeat loop is like you specifiy a number which can be a constant,variable or a signal value.If the number is variable or signal value, they are only evaluated when the loop start but not during the loop execution.
- In simple words, we tell the loop how many time it have to repeat itself i.e fixed number of times.
```verilog 
integer count;

initial 
begin 
    count=0;
    repeat(128)
    begin 
        $display("count=%d",count);
        count=count+1;
    end
end 
```
## forever loop
- this loop is kind of runs infinitely, that is no conditon and can only terminates when the `$finish` is encountered.
```verilog 
reg clock;
initial 
begin 
    clock =1'b0;
    forever #10 clock = ~clock; // clock toggles every 10 units
end
```
# Blocking statements 
- In the modules we have used the `begin` and `end` keyword to group multiple statemenst into one, and so there are two types of blocks in verilog.

1. **sequential block**- This block uses the `begin` and `end` keyword ,this type of the block statements are executed in the order in which they are written.
```verilog
module design0;
	bit [31:0] data;

	// "initial" block starts at time 0
	initial begin

		// After 10 time units, data becomes 0xfe
		#10   data = 8'hfe;
		$display ("[Time=%0t] data=0x%0h", $time, data);

		// After 20 time units, data becomes 0x11
		#20   data = 8'h11;
		$display ("[Time=%0t] data=0x%0h", $time, data);
	end
endmodule
//in above block each statements waits for there turn and are executed sequentially so the above block takes 30 time unit for the execution.
```
2. **Parallel blocking** - This block uses the keyword `fork` and `join` , this type of block statements are all executed concurrently.

```verilog 
initial begin
	#10   data = 8'hfe;
	fork
	   #20 data = 8'h11;
	   #10 data = 8'h00;
	join
end
// so in this block the both statements runs parallely, if it was a sequential block, then those two parallel statements could have taken 30 time unit to execute but as it isnt so it takes the 20 times unit to execute the statements inside the fork and join
```

## Features of the block statemens 
```verilog 
initial begin: block0
	#10   data = 8'hfe; // as in this example the parallel and serial blocks can be nested.( property 1 - nested block)s
	fork: block1 // you can name block and with the naming you can acess the variables inside it by hieharchical naming.(property-2)
	   #20 data = 8'h11;
	   #10 data = 8'h00;
       disable block1 //named block can be disabled too!!(property-3)
	join
end

```
**Property or features**
> 1. nesting of parallel and sequential blocks
> 2. naming the blocks and using hieharchical refercing for acessing the local variable of the block
> 3. disabling the naming blocks.

---

# Thank you for reading !!

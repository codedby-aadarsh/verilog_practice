# Behavioural modelling in verilog 

- Behavioral modeling in Verilog is all about describing what a digital system does, rather than how it does it at the gate level. It uses constructs like always and initial blocks to describe how outputs change in response to inputs over time—kind of like writing logic in plain procedural code.
- before we implement the gatelevel design and all that, we design the system on the basis of how its behave and how its acts. than how that act is achieved with the gates and follow the c langauage type syntax.
---
## Structured procedures 
- There are two structured procedure in Verilog: `always` and `initial` and these statements are two most basic elements in behvioural modelling. All other behavioural statements can appear only inside these structured procedure statements.
- one more important thing to understand that the verilog is a concurrent programming language unlike C which is sequential , that means that all the `initial` `always` block runs parallel or seperately and start at simulation time 0.
- `always` and `initial` cant be nested.

### initial statement

```verilog 
module stimulus;
reg x,y,a,b,m;
initial 
    m=1'b0; //single statement doesnt need to be grouped
initial 
begin 
#5 a =1'b1; // multiple statement need to be grouped 
#25 b= 1'b0;
end 

initial 
begin
#10 x =1'b0
#25 y =1'b1;
end 
initial 
#50 $finish; // means finish the simulation at the 50th time unit
endmodule
```
- have to include the `begin` and `end` keyword for to group the statements they works the same as {} in `C` language where for one line statements we dont use this curly braces!!
- the initial block are typically used for the initialisation, monitoring, waveforms and other processes that must be executed only once during the entire simulation time.

### Always statement
- All behvioral statements inside an `always` statement constiutes an ``always`` block.The `always` block repeats the code in the block continously in a digital circuit and start at the simultion time 0.

```verilog 
//clock generator which toggles the clock bit every 10 th time unit
module clock_gen;

reg clock;

initial 
    clock =1'b0;//initialisation of the clock must be in initial block, if we put it in always the clock will be initialised multiple times and its best to put it inside the initial.

always
    #10 clock=~clock;

initial 
    #1000 $finish;// this statement should also be kept inside the initial block,for we want it to execute only once at the 1000th time unit.
    //if there is not halt statements like $finish and $stop, the alwyas will run forever, like a infinite loop.
endmodule 
```
---
### Procedural Assignments 
- It is used to update values of reg,integer,real or time variables. The value remains unchanged until another procedural assignment updates the variable with a different value.
- There are two types of procedural assignments statements:
1. **Blocking assignments** : this assignment statements are executed in the order they are specfied in sequential block and they dont block the execution of the statement in the parallel block.
- In Verilog, a blocking assignment uses the = operator. Think of it as executing statements in order, one after another—like following a recipe step-by-step. The next statement doesn't happen until the current one finishes.
```verilog 
reg x,y,z;
reg [15:0] reg_a,reg_b;
integer count;

initial 
begin 
//all behavioural procedure assignments happens inside the initial block and blocking assignments follow sequential manner
    x=0;y=1;z=1;//scalar assignmenets 
    count = 0;
    reg_a=16'b0;
    #15 reg_a[2]=1'b1;//bit assignment with delay 
    #10 reg_a[15:13]={x,y,z}//assign result of concatenation to part select of the vector with delay
    count = count +1; // assignment to integer 
end 
```
- In above example, each statement is executed one by one like the count statement wait for the 25 time unit to get executed and its value to be updated.

**tips**- if the left hand side register is short on the size and right hand side have more bits to be assigned to the left register , then the values are truncated and only the lsb bits are stored while the msb is discarded. If the size is more , then the msb bits are filled with zeroes.
2. **Nonblocking Assignments** : This assignment statement is mostly used in the sequential(clocked) logic, rather than the combinational logic.
- This assigment uses the "<=' which is similar to the relational operator, but its works as the non blocking when its used for the assignment and not in the expression.
```verilog 
reg x,y,z;
reg [15:0] reg_a,reg_b;
integer count;

initial 
begin 
//all behavioural procedure assignments happens inside the initial block and blocking assignments follow sequential manner
    x=0;y=1;z=1;//scalar assignmenets 
    count = 0;
    reg_a=16'b0; reg_b=reg_a;
    #15 reg_a[2]<=1'b1;//bit assignment with delay 
    #10 reg_a[15:13]<={x,y,z}//assign result of concatenation to part select of the vector with delay
    count = count +1; // assignment to integer 
end 
```
- In above example, the statement from x=0 to reg_b=reg_a worked in sequence but the delay statements work different as the reg_a bit assignment must happen at  15th time unit and next one at 10 th time unit but the count one happens immediately , rather than waiting for the respective delay it schedule them and when the time unit comes it then execute them so the count statement dont wait for the 25 time unit delay but happens immediately.

## Example of the blocking and non blocking assignment statements

```verilog 
// two concurrent block with blocking assignments
//here the race condition might arise the either a=b is executed first  before the b=a or vice versa and after the execution both a and b get the same one of the previous value of either a or b, and no swap occurs of a and b 
// as the a and b updated in one block, gets in other two so loss of the value occurs.
always @(posedge clock)
    a=b;
always @(posedge clock)
    b=a;


// two concurrent block with the non blocking assignments

always @(posedge clock)
    a<=b;
always @(posedge clock)
    b<=a;

//one thing is to be noted about the nonblocking code ,is that all right hand side variables are read and their value is stored in the temporary variable and during 'write' operation or assigment, those temporary values are assigned to the left hand side variables. 
// in easy words the a and b get their values swapped and b recieves the old copy of a, not the updated one and here the order of the block doesnt matters so no race condition.
```
---
as this chapter is kinda big and have so many new and interseting topic to be offered, we will be covering those in the other part.

## Thank you for reading !!
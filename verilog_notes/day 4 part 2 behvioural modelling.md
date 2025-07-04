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
1. **Blocking assignments** : 
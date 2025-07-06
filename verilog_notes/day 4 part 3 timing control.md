# Timing Control
- There is a necessity of the timing control statements in verilog , as they specify the simulation time at which  the procedural statements will execute and without it the simulation time doesnt advances.

- There are generally three methods of timing control,which are :
## **Delay based timing control** 
- This statment in verilog in an expression specifies the time duration between when the statement is encountered and when it is executed. This delay are specified by the symbol # and value suceeding it.
- there are three type of delay control for procedural assignments
1. **regular delay control** :it is  used when non zero delay is specified to the left of a procedural assignment.
```verilog 
parameter latency = 20 ;
parameter delay = 2;
reg x,y,z,p,q;
initial 
begin 
    x=0;//no delay control 
    #10 y=1;//delay control with fix value,and like here this statement will be executed at 10th units after it is encounterd.
    //so y=1 statement encountered at t=0 will be executed at t=10,and y gets the value 10.

    #latency z=0;//delay control with identifier
    
    #y x=x+1;//delay control with identifier 

    #(4:5:6) q=0;//minimum,typical and maximum delay values
end 
endmodule 
```

2. **Intra-assignment delay control** : so in this assignment, the delay is specified to the right of the expression.
```verilog 
reg x,y,z;
initial begin 
    x=0;z=0;
    y=#5 x +z;//takes value of x and z at the time 0, evaluates the expression but assigns it after 5 time unit or wait 5 time unit before assignment.
    // the thing here is that the value is evaluated at time 0 for to be assigned to the 5 and while the value of x and z might change between that time 0 to 5 , but the value to be assigned to y is precomputed doesnt get affected with x and z
    // think of this as the rhs is computed and its result is stored in a temporary variable.
end 
```
3. **Zero delay control**: This delay control is written using #0 and use for the control over the execution order.

```verilog
initial begin 
    x=0;
    y=0;
end 

initial begin 
    #0 x=1;
    #0 y=1;
end 

```
- so as above we have two initial block and if we dont use the zero delay control statement, then the x and y can be either 0 or 1 i.e which block statement is executed first is non deterministic, but with the zero delay timing control we can ensure that x and y will have the value 1 and this statement will be executed at last but the execution happens at the same time 0 and if we have too many zero delay control statement it makes then the order non determinsitic ,its not  advisible to have many zero delay statements.

## Event based timing control :
- So an event is like some special condition, like the change in the value on a register or a net. they can be utilzed to trigger execution of a statement or block of statements.
- there are four types of the event based timing control :
1. **Regular event control** :
```verilog 
@ (clock) q=d; //this statement is executed whenever signal clock value changes.
@(posedge clock) q=d; // q=d is executed when the clock does the postitve transistion which can be 
//0->1,x or z
//x->1 or z->1
@(negedge clock)q=d;// q=d is executed when signal clock does the negative transistion
//1->0,x or z
//x ->0 or z->0
q= @(posedge clock) d; //d is evaluted immediately and assign to the q at the positive edge of clock
```
2. **Named event control** : verilog provide the capablity to decalre an event and then trigger and recognize the occurece of that event. The event doesnt hold any data. A named event is decalred by the keyword `event`.An event is triggered by the symbol ->. The triggering of the event is recognised by the @.
```verilog 
//this example shows the data buffer storing the data after the last packet of the data has arrived.
event recieved_data;// declared a named event
always @(posedge clock)//checks at each postive clock edge
begin 
if (last_data_packet)//if this is the last data_packet
    ->recieved_data;//trigger the event recieved_data
end 
always @(recieved_data)//awaits for the triggering of event
data_buf={data_pkt[0],data_pkt[1],data_pkt[2],data_pkt[3]};//when triggering happens store four packet of recieved data in the data buffer 
```
3. **Event OR control** :
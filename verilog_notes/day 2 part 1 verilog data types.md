# verilog data types

The data types helps us in representation of the various elements in the digital hardware, like for the bit representaion we need a certain data type and also for decalring and storing different kind of the variables.

---

## Data types value set :

value set tells us the value a data type can take or a range.

| 0 | represents a logic zero, or a false condition |
| --- | --- |
| 1 | represents a logic one, or a true condition |
| x | represents an unknown logic value (can be zero or one) |
| z | represents a high-impedance state or floating  |

![image.png](images/626ba651-47cc-4dde-8e21-a75e8a23ec2e.png)

- while X or x represent unknown , it may be either 0 or 1 and in boolean logic it means “dont care”.
- Z or z denotes the high impedance state and represnt a incomplete connection or any unconnected wire will simply results in high impedance state.

---

## type of variables

1. **nets -** nets are simply wires used to connect multiple gates or outputs to the other gate inputs or representation of the connection between the hardware elements. By default they are of one bit value and have value z (unless its triget net , have value of x).

```verilog
wire a; //declare a wire or net a, and a net is defined with wire keyword.
wire b,c;// defining two wires. nets need drivers if there is not any then it takes value z.
wire d=1'b1;// it means 1 bit size and binary logic 1 value
```

1. **Registers** - they are data storage elements and used to retain the value until we place another. 
- they are different then digital register made out of the combination of the flipflops and used to hold the value simply.
- they dont need drivers to run unlike wire and default value is x.

```verilog
reg reset;//declare a register with the reg keyword
reset=1'b0;//giving the value to the register
```

1. **Vectors -** while net or reg data type by default are one bit size, to make them multi bit , we need vectors.

```verilog
wire [7:0] bus ; // an 8 bit bus 
wire [31:0] bus1,bus2,bus3 ; // 3 32 bit wide bus 
bus1[7] // referes to the 7th bit of bus1 
bus[2:0] //three lsb bit of bus and[0:2] is illegal as the bus was declared [high : low]
[left:right] // left value refers to the most significant bit. if [0:7], that means 0 is the msb
```

1. **Integer** : its a 32 bit wide data type used to store integer value .

```verilog
integer count; // count is an integer value 
```

1. **time** : its a unsigned 64bit wide and  is  used to store the simulation time as the verilog simulation is done with respect to the simluation time and declare using the keyword time.

```verilog
time        end_time;           // end_time can be stored a time value like 50ns
realtime    rtime;              // rtime = 40.25ps, this one stores time as floating value
```

1. **real :** a real variable can be store in this data type, which is declared with the keyword real and have default value 0.

```verilog
real  float; // float  is a real value 
```

1. **Array** : they are allowed for the reg,integer, time and vector register data types. and arent allowed for the real varibles. and multidimensional array arent permitted in verilog.

```verilog
integer count[0:7];//an array of 8 count variables
reg bool[31:0] // array of 32 one bit boolean variable
reg[4:0] port[0:7] // an array of 8 port with each port 5 bits wide
count[5] // for accessing 5th index value
port[3] //3rd element of the port 
```

| arrays  | vectors |
| --- | --- |
| 1. an array is a data type woth each bits are either 1 bit or n bit wide. | 1. vectors are the data type where a single element is n bit wide. |
| ex- reg[4:0] port[0:7] // an array of 8 port with each port 5 bits wide | ex - reg [4:0] port // here the port is single element but 8 bit wide. |
- arrays are also used to define RAM, ROM  etc or other memories.

```verilog
reg mem1bit [0:1023] //1 kilo bit memory element
```

1. **parameters** : they are used to define constants.

```verilog
parameter port_id=5; //defines a constant port_id
```

1. **Strings** : it is stored in reg and each character is of one byte. and if the size is smaller than the string then the leftmost part is truncated,else the extra space or zero are added to the start of the string.

```verilog
// "Hello World" requires 11 bytes
reg [8*11:1] str = "Hello World";         // Variable can store 11 bytes, str = "Hello World"
reg [8*5:1]  str = "Hello World";         // Variable stores only 5 bytes (rest is truncated), str = "World"
reg [8*20:1] str = "Hello World";         // Variable can store 20 bytes (rest is padded with zeros), str = "         Hello World"

special characters serve specail purpose in displaying strings.
escape_characters               charcters displayed
			\n                            newline
			\t                            tab
			%%                            %
```

---
## Thank you for reading !!
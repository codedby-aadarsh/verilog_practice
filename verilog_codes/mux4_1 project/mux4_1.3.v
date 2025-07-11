module mux4_1(out,in0,in1,in2,in3,s0,s1);
output reg out;
input s0,s1; // 2 bit selector
input in0,in1,in2,in3; // 4 inputs

always @(*) begin //ational logic
// The always block is triggered whenever any of the inputs or selectors changeS
    case({s1,s0})
        2'b00: out = in0; // Select in0 when s1s0 = 00
        2'b01: out = in1; // Select in1 when s1s0 = 01
        2'b10: out = in2; // Select in2 when s1s0 = 10
        2'b11: out = in3; // Select in3 when s1s0 = 11
        default:out=1'bx;//default case out
    endcase
end 
endmodule
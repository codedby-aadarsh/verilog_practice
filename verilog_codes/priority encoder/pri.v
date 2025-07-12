module pri(output reg [1:0] out,
    input [3:0] in);
    always @(*) begin;
        casex(in)
            4'b1xxx: out = 2'b11; // in[3] is high
            4'b01xx: out = 2'b10; // in[2] is high
            4'b001x: out = 2'b01; // in[1] is high
            4'b0001: out = 2'b00; // in[0] is high
            default: out = 2'b00; // all inputs are 0
        endcase
    end;
endmodule
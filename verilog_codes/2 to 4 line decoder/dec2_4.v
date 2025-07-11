module dec2_4(output [3:0] out,
    input [1:0] in);
    and (out[3],in[1],in[0]);
    and (out[2],in[1],!in[0]);
    and (out[1],!in[1],in[0]);
    and (out[0],!in[1],!in[0]);

endmodule 

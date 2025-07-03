// im designing mux2_1 using bufif0 and bufif1 gates
module mux2_1(
    input a,b,sel,    // Select signal
    output  out    // Output
);
bufif0 (out, a, ~sel); // If sel is 0, pass a to out
bufif1 (out, b, sel);  // If sel is 1, pass b to out
endmodule
    
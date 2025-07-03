module stimulus;
reg a,b;
reg sel;
wire out;

mux2_1 m1(
    .a(a),
    .b(b),
    .sel(sel),
    .out(out)
);
initial begin
    $dumpfile("mux2_1.vcd"); // Create a VCD file for waveform viewing
    $dumpvars(0, stimulus); // Dump all variables in the stimulus module
    // Test case 1: sel = 0, a = 0, b = 0
    a = 0; b = 0; sel = 0;
    #10; // Wait for 10 time units
    $display("Test case 1: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 2: sel = 0, a = 1, b = 0
    a = 1; b = 0; sel = 0;
    #10;
    $display("Test case 2: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 3: sel = 0, a = 0, b = 1
    a = 0; b = 1; sel = 0;
    #10;
    $display("Test case 3: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 4: sel = 0, a = 1, b = 1
    a = 1; b = 1; sel = 0;
    #10;
    $display("Test case 4: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 5: sel = 1, a = 0, b = 0
    a = 0; b = 0; sel = 1;
    #10;
    $display("Test case 5: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 6: sel = 1, a = 1, b = 0
    a = 1; b = 0; sel = 1;
    #10;
    $display("Test case 6: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);

    // Test case 7: sel = 1, a = 0, b = 1
    a = 0; b = 1; sel = 1;
    #10;
    $display("Test case 7: sel=%b, a=%b, b=%b, out=%b", sel, a, b, out);
    $finish; // End the simulation
end
endmodule

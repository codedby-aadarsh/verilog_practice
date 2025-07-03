module stimulus;
    reg [3:0] A,B;
    reg C_IN;
    wire C_OUT;
    wire [3:0] SUM;

    fulladder fa(SUM,C_OUT,A,B,C_IN);

    initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, stimulus);

    // Test 1
    A = 4'b1001; B = 4'b1010; C_IN = 1;
    #5;

    // Test 2
    A = 4'b0000; B = 4'b0001; C_IN = 0;
    #5;

    // Test 3
    A = 4'b1111; B = 4'b1111; C_IN = 1;
    #5;

    $finish;
end
endmodule
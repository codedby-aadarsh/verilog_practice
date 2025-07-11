module stimulus;
reg [3:0] IN;
wire OUT;

bit4_par m1(OUT,IN);
integer i=0;

initial begin ;
    $dumpfile("bit4.vcd");
    $dumpvars(0,stimulus);
    for (i=0;i<16;i++) begin ;
        IN = i;
        #1 $display("out=%b in=%b",OUT,IN);
    end;
    $finish;
end; 
endmodule
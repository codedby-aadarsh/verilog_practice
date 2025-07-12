module stimulus;
reg [3:0] IN;
wire [1:0] OUT;
integer i=0;

pri p1(OUT, IN);
initial begin;
    $dumpfile("pri.vcd");
    $dumpvars(0,stimulus);
    for(i=0; i<16; i++) begin;
        IN=i;
        #1 $display(" OUT=%b in=%b ",OUT,IN);
    end; 
    $finish;
end;

endmodule

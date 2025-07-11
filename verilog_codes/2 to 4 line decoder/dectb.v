module stimulus;
reg [1:0] IN;
wire [3:0] OUT;

dec2_4 m1(OUT,IN);
integer i=0;

initial begin;
    $dumpfile("dec4.vcd");
    $dumpvars(0,stimulus);
    for (i=0;i<4;i++) begin;
        IN=i;
        #1 $display("out=%b in=%b",OUT,IN);
    end
    $finish;
end 
endmodule

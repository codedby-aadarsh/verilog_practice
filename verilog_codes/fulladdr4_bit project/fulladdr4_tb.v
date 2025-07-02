module stimulus;
    // input and output variable decalration
    reg [3:0] A,B;
    reg C_IN;
    wire C_OUT;
    wire [3:0] SUM;

    fullbit4 fa(SUM,C_OUT,A,B,C_IN);

    initial begin
        A=4'b1001;B=4'b1010;C_IN=1;
        #1 $display("for the A=%b,B=%b and C_IN=%b, the outputs are SUM=%b and C_OUT=%b",A,B,C_IN,SUM,C_OUT);
    end 
endmodule
        
        


        


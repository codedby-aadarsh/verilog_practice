module simple_assign;
  wire [3:0] a = 4'b1010;
  initial begin
    $display("Value of a is %b", a);
    $finish;
  end
endmodule

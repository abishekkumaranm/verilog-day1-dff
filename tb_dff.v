module tb_dff;

reg clk;
reg reset;
reg d;
wire q;

dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    d = 0;

    #10 reset = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;

    #20 $finish;
end

initial begin
    $dumpfile("dff.vcd");
    $dumpvars(0, tb_dff);
end

endmodule

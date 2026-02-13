module piso_tb;

reg clk, rst, load;
reg [3:0] parallel_in;
wire serial_out;

piso uut (
    clk, rst, load,
    parallel_in, serial_out
);

always #5 clk = ~clk;

initial begin
    clk = 0; rst = 1; load = 0;
    parallel_in = 4'b1011;

    #10 rst = 0;

    load = 1; #10;
    load = 0;

    #50 $stop;
end

endmodule

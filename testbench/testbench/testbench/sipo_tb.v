module sipo_tb;

reg clk, rst;
reg serial_in;
wire [3:0] parallel_out;

sipo uut (
    clk, rst,
    serial_in, parallel_out
);

always #5 clk = ~clk;

initial begin
    clk = 0; rst = 1; serial_in = 0;

    #10 rst = 0;

    serial_in = 1; #10;
    serial_in = 0; #10;
    serial_in = 1; #10;
    serial_in = 1; #10;

    #20 $stop;
end

endmodule

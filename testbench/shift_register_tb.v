module shift_register_tb;

reg clk, rst;
reg shift_left, shift_right;
reg serial_in;
wire [3:0] data_out;

shift_register uut (
    clk, rst, shift_left, shift_right,
    serial_in, data_out
);

always #5 clk = ~clk;

initial begin
    clk = 0; rst = 1;
    shift_left = 0; shift_right = 0;
    serial_in = 0;

    #10 rst = 0;

    // Shift Left
    shift_left = 1; serial_in = 1; #10;
    serial_in = 0; #10;

    shift_left = 0;

    // Shift Right
    shift_right = 1; serial_in = 1; #10;

    #20 $stop;
end

endmodule

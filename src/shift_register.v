module shift_register (
    input clk,
    input rst,
    input shift_left,
    input shift_right,
    input serial_in,
    output reg [3:0] data_out
);

always @(posedge clk or posedge rst) begin
    if (rst)
        data_out <= 4'b0000;
    else if (shift_left)
        data_out <= {data_out[2:0], serial_in};
    else if (shift_right)
        data_out <= {serial_in, data_out[3:1]};
end

endmodule

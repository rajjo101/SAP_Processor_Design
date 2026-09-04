`timescale 1ns/1ps
module acc_mem;
wire [7:0] mem_data;
wire [3:0] address;
wire loadA;
mem16k ram (
    .addr(address),
    .data(mem_data)
);

accumulator acc (
    .clk(clk),
    .rst(rst),
    .load(loadA),
    .data_in(mem_data),
    .A(A)
);
endmodule
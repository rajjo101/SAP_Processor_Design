`timescale 1ns/1ps

module tb_test;

reg clk;
reg rst;

reg loadA;
reg loadB;

reg [7:0] data_in;

reg [3:0] op;

wire [7:0] A;
wire [7:0] B;
wire [3:0]opcode;
wire [7:0] out;
wire carry;
wire [7:0] alu_result;
assign alu_result = data_in;
assign opcode = op;
// Instantiate Accumulator
accumulator ACC(
    .clk(clk),
    .rst(rst),
    .loadA(loadA),
    .data_in(alu_result),
    .A(A)
);


// Instantiate B Register
register BREG(
    .clk(clk),
    .rst(rst),
    .loadB(loadB),
    .data_in(alu_result),
    .B(B)
);


// Instantiate ALU
addersubtractor ALU(
    .A(A),
    .B(B),
    .op(opcode),
    .out(out),
    .carry(carry)
);


// Clock generation
always #5 clk = ~clk;

//assign alu_result = data_in;
initial begin

    // Initialize
    clk = 0;
    rst = 1;
    loadA = 0;
    loadB = 0;
    data_in = 0;
    op = 4'b0010;

    #10;
    rst = 0;

    // Load 5 into accumulator
    #10;
    data_in = 8'd9;
    loadA = 1;

    #10;
    loadA = 0;

    // Load 3 into B register
    #10;
    data_in = 8'd4;
    loadB = 1;

    #10;
    loadB = 0;

    // ADD operation
    #10;
    op = 4'b0001;

    #10;
    $display("ADD Result = %d", out);

    // SUB operation
    #10;
    op = 4'b0001;

    #10;
    $display("SUB Result = %d", out);

    #20;
    $stop;

end

endmodule
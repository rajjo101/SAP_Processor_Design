`timescale 1ns/1ps
module tb_booth;
reg clk;
reg rst;
reg [3:0]a;
reg [3:0]b;
wire [3:0]a1;
wire [3:0]b1;
wire [7:0]result;
booth_accelerator multp (
	.clk(clk),
	.rst(rst),
	.a(a1),
	.b(b1),
	.result(result)
);

assign a1 = a;
assign b1 = b;

always #5 clk = ~ clk;

initial begin
    $monitor(
    "T=%0t a=%d b=%d result=%d",
    $time,
    a,
	 b,
	 result
    );
end


initial begin

    clk = 1;
    rst = 1;
	 a = 4'd4;
	 b = 4'd5;
    #20;
    rst = 0;
    #60;
    $stop;

end
endmodule
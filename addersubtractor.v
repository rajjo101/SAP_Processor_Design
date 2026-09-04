module addersubtractor(
	input [7:0]A,
	input [7:0]B,
	input [3:0]op,
	input EU,
	output [7:0]out,
	output carry
);
wire [8:0] temp;
wire [7:0]B_comp;
assign B_comp =
    (op == 4'b0010 && EU == 1'b1) ? (~B + 8'b00000001) :
    (op == 4'b0001 && EU == 1'b1) ? B :
    8'b00000000;

assign temp = A + B_comp;

assign out = 
		((op == 4'b0001 || op == 4'b0010 ) && EU == 1'b1)?temp[7:0]:8'b00000000;
assign carry  = temp[8];
endmodule
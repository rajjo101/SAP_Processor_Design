module accumulator(
	input clk,
	input rst,
	input loadA,
	input [7:0]data_in,
	output reg [7:0]A
);
always @(posedge clk, posedge rst)begin
	if(rst) begin
		A <= 8'b00000000;
	end
	else if(loadA)
		A <= data_in;
end

endmodule
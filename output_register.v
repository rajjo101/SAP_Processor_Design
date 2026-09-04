module output_register(
	input clk,
	input rst,
	input [7:0]A,
	input LO,
	output reg [7:0]out_data
);

always @(*) begin
		if(LO) begin
			out_data <= A;
		end
end

endmodule
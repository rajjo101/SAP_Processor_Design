module mar(
	input clk,
	input ld,
	input rst,
	input [3:0]bus,
	output reg [3:0]mar_out
);
always @(*)begin
	if(rst) begin
		mar_out <= 4'd0;
	end
	if(ld) begin
		mar_out <= bus;
	end
end
endmodule
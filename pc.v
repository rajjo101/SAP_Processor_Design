module pc(
	input clk,
	input rst,
	input cp,
//	input en,
	output reg [3:0]pc_out
);
	always @(posedge clk, posedge rst) begin
		if(rst)
			pc_out <= 4'b0000;
		else if(cp) begin
			pc_out <= pc_out + 1;
//			next_ins <= ins_reg;
		end
	end
endmodule

	
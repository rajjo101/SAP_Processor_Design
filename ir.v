module ir(
	input clk,
    input rst,
    input loadIR,
    input [7:0] data_in,

    output [3:0] op,
    output [3:0] addr
);

reg [7:0]instruction;

always @(posedge clk, posedge rst) begin
	if(rst)
		instruction <= 8'b00000000;
	else if(loadIR)
		instruction <= data_in;
	
end

assign op = instruction[7:4];
assign addr = instruction[3:0];
endmodule
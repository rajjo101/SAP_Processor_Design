module mem16k(
	input [3:0]addr,
	output [7:0]data
);
reg [7:0] mem[15:0];

initial begin
	mem[0] = 8'b00001001; // LDA 9
   mem[1] = 8'b00011010; // ADD A
   mem[2] = 8'b11100000; // OUT
   mem[3] = 8'b11110000; // HLT
   mem[9]  = 8'b00000111; // 7
   mem[10] = 8'b00000101; // 5
end

assign data = mem[addr];
endmodule
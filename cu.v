module cu (
	input clk,
	input rst,
	input [3:0]op,
	output reg[11:0]cntl,
	output reg halt
);

localparam CP = 11; // Increment PC
localparam EP = 10; // Enable PC onto bus
localparam LM = 9;  // Load MAR
localparam CE = 8;  // Enable RAM output
localparam LI = 7;  // Load IR
localparam EI = 6;  // Enable IR address onto bus
localparam LA = 5;  // Load Accumulator
localparam EA = 4;  // Enable Accumulator onto bus
localparam SU = 3;  // Subtract
localparam EU = 2;  // Enable ALU output
localparam LB = 1;  // Load B register
localparam LO = 0;  // Load Output register

localparam T1 = 3'd0;
localparam T2 = 3'd1;
localparam T3 = 3'd2;
localparam T4 = 3'd3;
localparam T5 = 3'd4;
localparam T6 = 3'd5;

reg [2:0]tstate;
always @(posedge clk, posedge rst) begin 
	if(rst) begin
		tstate <= 3'b000;
	end
	 else if(halt)
        tstate <= tstate; 
	else if(tstate == 3'b101)
		tstate <= 3'b000;
	else
		tstate <= tstate + 3'b001;
end

always @(*) begin
	 if(rst) begin
		halt = 1'b0;
	 end
    cntl = 12'b0;
case(tstate)

T1: begin 
		cntl = 12'd0;
		cntl[EP] = 1; 
		cntl[LM] = 1;
	end
	
T2: begin
		cntl = 12'd0; 
		cntl[CE] = 1'b1;
		cntl[LI] = 1'b1;
		cntl[CP] = 1'b1;
	 end
T3: begin
		
	 end
	 
T4: begin
		case(op)
                4'b0000,
                4'b0001,
                4'b0010: begin
                    cntl[EI] = 1;
                    cntl[LM] = 1;
                end

                4'b1110: begin
                    cntl[EA] = 1;
                    cntl[LO] = 1;
                end
					 4'b1111: begin
							cntl = 12'd0;
							halt = 1'b1;
					 end
            endcase
	 end
	 
T5: begin
		halt = 1'b0;
		if(op == 4'b0000) begin
			cntl = 12'd0; 
			cntl[CE] = 1'b1;
			cntl[LA] = 1'b1;
		end
		else if(op == 4'b0001 || op == 4'b0010) begin
			cntl[CE] = 1'b1;
			cntl[LB] = 1'b1;
		end
	 end
	 
T6: begin
		halt = 1'b0;
		cntl = 12'd0; 
		if(op == 4'b0001) begin
			cntl[EU] = 1'b1;
			cntl[LA] = 1'b1;
		end
		else if (op == 4'b0010) begin
			cntl[SU] = 1;
			cntl[EU] = 1;
			cntl[LA] = 1;
		end
	 end

endcase
end

endmodule
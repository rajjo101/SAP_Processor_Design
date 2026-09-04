module booth_accelerator( 
input clk, 
input rst, 
input [3:0]a, 
input [3:0]b, 
output reg [7:0]result 
);
reg [3:0]acc = 4'b0000; 
reg Q = 0; 
reg [2:0]count = 3'd0; 
reg [3:0]Qn; 
reg [3:0]temp = 4'd0;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        acc   <= 0;
        Qn    <= a;
        Q     <= 0;
        count <= 0;
        result<= 0;
    end
    else if(count < 4) begin

        temp = acc;

        case({Qn[0],Q})
            2'b01: temp = acc + b;
            2'b10: temp = acc - b;
        endcase

        {acc,Qn,Q} <= $signed({temp,Qn,Q}) >>> 1;

        count <= count + 1;
    end
    else begin
        result <= {acc,Qn};
    end
end
endmodule
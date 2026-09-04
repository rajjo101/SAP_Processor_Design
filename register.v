module register(
    input clk,
    input rst,
    input loadB,
    input [7:0] data_in,
    output reg [7:0] B
);

always @(posedge clk or posedge rst) begin
    if(rst)
        B <= 8'b00000000;

    else if(loadB)
        B <= data_in;
end

endmodule
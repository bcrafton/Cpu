module ram (
	clk,
	address,
	write_data,
	read_data,
	mem_op,
	state
); 

input clk;
input [15:0] address;
input [1:0] mem_op;

input [15:0] write_data;
output reg [15:0] read_data;
input wire [2:0] state;

reg [15:0] mem [0:1023];
 
always @ (posedge clk)
begin
	if(state == 3'b011) begin
		if (mem_op == 2'b10) begin
			 mem[address] = write_data;
		end
		else if (mem_op == 2'b01) begin
			read_data = mem[address];
		end
	end
end

endmodule

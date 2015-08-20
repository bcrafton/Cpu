module register_file
  (clk,
   write,
   write_address,
   write_data,
   read_address_1,
   read_data_1,
   read_address_2,
   read_data_2,
	state);

   reg [15:0] 	 regfile [0:7];

	input clk;
   input write;
   input wire [2:0] write_address;
   input wire [15:0] write_data;
   input wire [2:0] read_address_1;
   output reg [15:0] read_data_1;
   input wire [2:0] read_address_2;
   output reg [15:0] read_data_2;
	input wire [2:0] state;

	initial begin
		read_data_1 <= 4'h0000;
		read_data_2 <= 4'h0000;
		regfile[0] <= 4'h0000;
		regfile[1] <= 4'h0000;
		regfile[2] <= 4'h0000;
		regfile[3] <= 4'h0000;
		
		regfile[4] <= 4'h0000;
		regfile[5] <= 4'h0000;
		regfile[6] <= 4'h0000;
		regfile[7] <= 4'h0000;
	end
	
   always @(posedge clk) begin
		if(state == 3'b001) begin
			read_data_1 <= regfile[read_address_1];
			read_data_2 <= regfile[read_address_2];
		end
		else if(state == 3'b100) begin
			if (write) begin
				regfile[write_address] <= write_data;
			end
		end
   end
endmodule
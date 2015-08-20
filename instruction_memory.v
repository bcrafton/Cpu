`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:24:42 07/28/2015 
// Design Name: 
// Module Name:    instruction_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module instruction_memory(
    clk,
	 pc,
    instruction,
	 state
    );
	 
	 input wire clk;
	 input wire [15:0] pc;
	 input wire [2:0] state;
    output reg [15:0] instruction;
	 reg [15:0] memory [0:127];
	 
	 
	 initial $readmemh("C:\\Users\\Brian\\Desktop\\code.hex", memory);
	 
	 always @(posedge clk) begin
		if(state == 3'b000) begin
			instruction = memory[pc];
		end
	 end
endmodule
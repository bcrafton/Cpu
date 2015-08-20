`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:25 08/01/2015 
// Design Name: 
// Module Name:    program_counter 
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
module program_counter(
		clk,
		address,
		jump,
		pc,
		beq, 
		bne,
		compare,
		state
    );
	 
	 input wire clk;
	 input wire [15:0] address;
	 input wire jump;
	 output reg [15:0] pc;
	 output reg [2:0] state;
	 input wire beq;
	 input wire bne;
	 input wire compare;

	 initial begin
		pc = 0;
		state = 0;
	 end
		
	 always @(posedge clk) begin
		if(state == 4) begin
			state <= 0;
			if(jump || (bne && !compare) || (beq && compare)) begin
				pc <= address;
			end
			else begin
				pc <= pc + 1'b1;
			end
		end
		else begin
			state <= state + 1'b1;
		end
	 end
endmodule

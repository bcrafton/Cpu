`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:29:49 07/26/2015 
// Design Name: 
// Module Name:    alu 
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
module alu(
	 clk,
    alu_op,
	 data1,
	 data2,
	 compare,
	 alu_result,
	 state
    );
	 
	 input wire clk;
	 input wire [3:0] alu_op;
	 input wire [15:0] data1;
	 input wire [15:0] data2;
	 output reg compare;
	 output reg [15:0] alu_result;
	 input wire [2:0] state;
	 
	 always @(posedge clk) begin
		 if(state == 3'b010) begin
			 case(alu_op)
				0: alu_result <= data1 + data2; // ADD
				1: alu_result <= data1 - data2; // SUB
				2: alu_result <= !data1; // NOT
				3: alu_result <= data1 & data2; // AND
				4: alu_result <= data1 | data2; // OR
				5: alu_result <= ~(data1 &data2); // NAND
				6: alu_result <= ~(data1 | data2); // NOR
				7: alu_result <= data1;
				8: alu_result <= data2;
			 endcase
			if (data1 == data2)
				compare <= 1'b1;
			else
				compare <= 1'b0;
		end
	 end
endmodule

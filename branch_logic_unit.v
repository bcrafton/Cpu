`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:42 07/31/2015 
// Design Name: 
// Module Name:    branch_logic_unit 
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
module branch_logic_unit(
		branch,
		address,
		zero,
		pc,
		clk
    );
	 
	 input wire branch;
	 input wire [5:0] address;
	 input wire zero;
	 input wire pc;
	 input wire clk;
	 
	 always @(posedge clk) begin
		 if(branch && !zero)
			assign pc = address;
	 end
endmodule

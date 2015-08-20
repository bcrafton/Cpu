`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:13:52 07/26/2015 
// Design Name: 
// Module Name:    cpu 
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
module cpu(
	 clk,
	 instruction,
	 pc, 
	 reg_dst_out,
	 alu_src_out,
	 mem_to_reg_out,
	 reg_read_data_1,
	 reg_read_data_2,
	 alu_result,
	 ram_data_out,
	 state,
	 immediate
    );
	 
	 input clk;
	 output wire [2:0] state;
	 output wire [15:0] pc;
	 
	 wire [3:0] opcode;
	 wire [2:0] rs_idx;
	 wire [2:0] rt_idx;
	 wire [2:0] rd_idx;
	 output wire [15:0] immediate;
	 wire [15:0] address;
	 
	 wire  reg_dst;
	 wire  jump;
	 wire  mem_to_reg;
	 wire  [3:0] alu_op;
	 wire  [1:0] mem_op;
	 wire  alu_src;
	 wire  reg_write;
	 wire  ble;
	 wire  bne;
	 
	 output wire [15:0] instruction;
	 output wire [15:0] ram_data_out;
	 
	 output wire [15:0] reg_read_data_1;
	 output wire [15:0] reg_read_data_2;
	 
	 wire compare;
	 output wire [15:0] alu_result;
	 
	 output wire [2:0] reg_dst_out;
	 output wire [15:0] alu_src_out;
	 output wire [15:0] mem_to_reg_out;

	 assign opcode = instruction[15:12];
	 assign rs_idx = instruction[11:9];
	 assign rt_idx = instruction[8:6];
	 assign rd_idx = instruction[5:3];
	 assign immediate[5:0] = instruction[5:0];
	 assign address[5:0] = instruction[5:0];
	 assign immediate[15:6] = 9'b000000000;
	 assign address[15:6] = 9'b000000000;
	 
	 program_counter pc_unit(clk, address, jump, pc, beq, bne, compare, state);
	 
	 mux3 reg_dst_mux(rt_idx, rd_idx, reg_dst, reg_dst_out);
	 
	 mux16 alu_src_mux(reg_read_data_2, immediate, alu_src, alu_src_out);
	 
	 mux16 mem_to_reg_mux(alu_result, ram_data_out, mem_to_reg, mem_to_reg_out);
	 
	 instruction_memory im(clk, pc, instruction, state);
	 register_file regfile(clk, reg_write, reg_dst_out, mem_to_reg_out, rs_idx, reg_read_data_1, rt_idx, reg_read_data_2, state);
	 ram data_memory(clk, reg_read_data_1, reg_read_data_2, ram_data_out, mem_op, state);
	 
	 control_unit cu(clk, opcode, reg_dst, jump, mem_to_reg, alu_op, alu_src, reg_write, mem_op, beq, bne, state);
	 
	 alu alu_unit(clk, alu_op, reg_read_data_1, alu_src_out, compare, alu_result, state);	 
	 
endmodule

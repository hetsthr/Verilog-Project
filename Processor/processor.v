`timescale 1ns / 1ps
// Top Module Processor
module processor(clk,reset,data_out);
input clk,reset;
output [16:0] data_out; // Output Added in order to view RTL
wire [15:0] ins,r1_data,r2_data,data_alu;
wire [2:0] rd_alu,rd,aluop,imm_data;

// Program Counter
reg [15:0] pc;

assign data_out = data_alu;

always@(posedge clk, posedge reset)
	if(reset)
		pc <= 16'b0;
	else
		pc <= pc + 16'b1;

fetch fetch_unit_1 (clk,pc,ins,reset);
decode decode_unit_1 (clk,ins,rd_alu,data_alu,r1_data,r2_data,imm_data,rd,aluop,reset);
execute execute_unit_1 (r1_data,r2_data,imm_data,aluop,rd,data_alu,rd_alu,reset);

endmodule

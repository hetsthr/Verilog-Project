`timescale 1ns / 1ps
// Decode Unit
module decode(clk,ins,rd_alu,data_alu,r1_data,r2_data,imm_data,rd,aluop,reset);
input clk,reset;
input [15:0] ins,data_alu;
input [2:0] rd_alu;

output reg [15:0] r1_data,r2_data;
output reg [2:0] rd,aluop,imm_data;

reg [15:0] reg_bank [0:7];

// inital block for test purpose
initial begin
	reg_bank[3'd0] <= 16'h0;
	reg_bank[3'd1] <= 16'h5;
	reg_bank[3'd2] <= 16'h5;
	reg_bank[3'd3] <= 16'h0;
	reg_bank[3'd4] <= 16'h0;
	reg_bank[3'd5] <= 16'h0;
	reg_bank[3'd6] <= 16'h0;
	reg_bank[3'd7] <= 16'h0;
end

// Read Data and Negative Edge
always@(negedge clk) begin
	r1_data <= reg_bank[ins[12:10]];
	r2_data <= reg_bank[ins[9:7]];
	imm_data <= ins[12:10];
end

// Write Data at Positive Edge
always@(posedge clk, posedge reset) begin
	if (reset)
		reg_bank[rd_alu] <= reg_bank[rd_alu];
	else
		reg_bank[rd_alu] <= data_alu;
end

// Generate Control Signals based on the Instruction
always@(*) begin
	rd <= ins[6:4];
	case(ins[15:13])
	3'b000: aluop[1:0] <= 2'b00;
	3'b001: aluop[1:0] <= 2'b01;
	3'b010: aluop[1:0] <= 2'b10;
	3'b011: aluop[1:0] <= 2'b11;
	3'b100,3'b101,3'b110,3'b111: aluop[1:0] <= 2'b00;
	default: aluop[1:0] <= 2'b00;
	endcase
	
	case(ins[3:0])
	4'd1: aluop[2] <= 1'b0;
	4'd2: aluop[2] <= 1'b1;
	4'd0,4'd3,4'd4,4'd5,4'd6,4'd7,4'd8,4'd9,4'd10,4'd11,4'd12,4'd13,4'd14,4'd15: aluop[2] <= 1'b0;
	default: aluop[2] <= 1'b0;
	endcase
end
endmodule

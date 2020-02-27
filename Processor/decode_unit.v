`timescale 1ns / 1ps
module decode_unit(clk,INS,instruction_type,r1,r2,rd);
input clk;
input [15:0] INS;
output reg [1:0] instruction_type;
output reg [15:0]	r1,r2;
output reg [2:0] rd;
reg [2:0] func3;
reg [3:0] opcode; 

reg [15:0] reg_bank [7:0];

initial begin
	reg_bank[3'b000] = 15'd1;
	reg_bank[3'b001] = 15'd2;
	reg_bank[3'b010] = 15'd3;
	reg_bank[3'b011] = 15'd4;
	reg_bank[3'b100] = 15'd5;
	reg_bank[3'b101] = 15'd6;
	reg_bank[3'b110] = 15'd7;
	reg_bank[3'b111] = 15'd8;
end


always@(posedge clk)
begin
	opcode <= INS[3:0];
	if (opcode == 4'b0001)
		r1 <= reg_bank[INS[12:10]];
	else
		r1 <= {12'b0,INS[12:10]};
	r2 <= reg_bank[INS[9:7]];
	rd <= INS[6:4];
	func3 <= INS[15:13];
	
	if (func3 == 3'b0)
		instruction_type <= 2'b0;
	else if(func3 == 3'b001)
		instruction_type <= 2'b01;
	else if(func3 == 3'b010) 
		instruction_type <= 2'b10;
	else if(func3 == 3'b011) 
		instruction_type <= 2'b11;
end
endmodule

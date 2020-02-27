`timescale 1ns / 1ps
module fetch_unit(clk,INS);
input 	clk;
output	reg [15:0] INS; 

reg 	[15:0] instruction_memory [65535:0];
reg 	[15:0] PC;

initial begin
	PC = 16'b0;
	instruction_memory[0] = 16'b0000000010100001;
	instruction_memory[1] = 16'b0010111001010001;
	instruction_memory[2] = 16'b0100000111010010;
end

always@(posedge clk)
begin
	PC  <= PC + 1'b1;
	INS <= instruction_memory[PC];
end

endmodule

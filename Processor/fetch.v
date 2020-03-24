`timescale 1ns / 1ps
// Fetch Unit
module fetch(clk,pc,ins,reset);
input clk,reset;
input [15:0] pc;
output reg [15:0] ins;

reg [15:0] ins_mem [0:65535];

// initialize instruction memory from data file.
initial begin
	$readmemb("./python_script/myfile.data",ins_mem);
end

always@(posedge clk, posedge reset) begin
	if(reset)
		ins <= 16'b0;
	else
		ins <= ins_mem[pc];
end
endmodule

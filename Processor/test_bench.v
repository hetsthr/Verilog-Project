`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:09:07 03/21/2020
// Design Name:   processor
// Module Name:   D:/DA-IICT/Sem2/Digital System Architecture/Project/3 Stage/3_stage_pipeline/proc_design/test_bench.v
// Project Name:  proc_design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: processor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg clk;
	reg reset;
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	processor uut (
		.clk(clk),
		.reset(reset),
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#8 reset  = 0;
	end
	
	always #5 clk = ~clk;
   
	initial #100 $finish;
endmodule


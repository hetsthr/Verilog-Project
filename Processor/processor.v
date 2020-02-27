`timescale 1ns / 1ps
module processor(clk,op);
input clk;

output [1:0] op;
wire [15:0] INS;
wire [2:0] rd;
wire [15:0] r1,r2;

fetch_unit f1 (clk,INS);
decode_unit d1 (clk,INS,op,r1,r2,rd);

endmodule

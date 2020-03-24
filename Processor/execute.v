`timescale 1ns / 1ps
// Execute Unit
module execute(r1_data,r2_data,imm_data,aluop,rd,data_out,rd_out,reset);
input reset;
input [15:0] r1_data,r2_data;
input [2:0] rd,aluop,imm_data;

output reg [15:0] data_out;
output [2:0] rd_out;

// Address of Destination Register
assign rd_out = rd;

// Based on received data preform required operation
always@(*) begin
	if(reset)
		data_out <= 16'b0;
	else begin
		case(aluop[2])
		1'b0: begin
			case(aluop[1:0])
			2'b00: data_out <= r1_data + r2_data;
			2'b01: data_out <= r1_data - r2_data;
			2'b10: data_out <= r1_data & r2_data;
			2'b11: data_out <= r1_data | r2_data;
			default: data_out <= 16'b0;
			endcase
			end
		1'b1: begin
			case(aluop[1:0])
			2'b00: data_out <= {13'b0,imm_data} + r2_data;
			2'b01: data_out <= {13'b0,imm_data} - r2_data;
			2'b10: data_out <= {13'b0,imm_data} & r2_data;
			2'b11: data_out <= {13'b0,imm_data} | r2_data;
			default: data_out <= 16'b0;
			endcase
			end
		default:
			data_out <= 16'b0;
		endcase
	end
end

endmodule

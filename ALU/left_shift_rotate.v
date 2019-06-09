module left_shift_rotate ( // Left shift rotate
	input [15:0] in,
	input [3:0] shamt,
	output [15:0] out );
	assign out = (in << shamt) | (in >> (5'd16 - shamt));
endmodule
module arithmetic_right_shift ( // Arithmetic right shift
	input [15:0] in,
	input [3:0] shamt,
	output [15:0] out );
	assign out = $signed(in) >>> shamt;
endmodule
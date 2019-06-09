module right_shift ( // Logical right shift
	input [15:0] in,
	input [3:0] shamt,
	output [15:0] out );
	assign out = in >> shamt;
endmodule
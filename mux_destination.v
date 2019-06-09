module mux_destination (
	input [2:0] upper,
	input [2:0] lower,
	input selector,
	output [2:0] out
);
	assign out = selector ? lower : upper;
endmodule
module multiplexer (
	input [15:0] v0, v1,
	input selector,
	output [15:0] out
);

assign out = selector ? v1 : v0;

endmodule
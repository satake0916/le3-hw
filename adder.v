module adder (
	input [15:0] in,
	output [15:0] out
);

assign out = in + 16'b0000_0000_0000_0001;

endmodule
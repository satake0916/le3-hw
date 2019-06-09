module mux_pc (
	input PCSrc,
	input [15:0] pc, jump,
	output [15:0] out
);

multiplexer mux(.v0(pc), .v1(jump), .selector(PCSrc), .out(out));

endmodule
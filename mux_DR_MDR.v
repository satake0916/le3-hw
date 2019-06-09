module mux_DR_MDR (
	input [15:0] DR, MDR,
	input selector,
	output [15:0] out
);

assign out = selector ? MDR : DR;

endmodule
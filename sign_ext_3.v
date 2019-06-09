module sign_ext_3(
	input [3:0] in,
	output [7:0] out
);

assign out = {in[3], in[3], in[3], in[3], in[3:0]}; 
endmodule
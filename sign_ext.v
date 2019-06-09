

module sign_ext ( // 8ビットの符号付き整数を16ビットの符号付き整数に符号拡張する 	
input [7:0] in, 	
output [15:0] out ); 	
assign out = {in[7], in[7], in[7], in[7], in[7], in[7], in[7], in[7], in[7:0]}; 

endmodule


//already changed as ver.final

module external_output ( 	
input clock, 	
input [15:0] in1,
input [15:0] in2,
input right1, right2,
output [7:0] out0, 	
output [7:0] out1, 	
output [7:0] out2, 	
output [7:0] out3,
output [7:0] out4, 	
output [7:0] out5, 	
output [7:0] out6, 	
output [7:0] out7
); 
 
led7 l0(.in(in1[3:0]), .right(right1), .out(out0)); 
led7 l1(.in(in1[7:4]), .right(right1), .out(out1)); 
led7 l2(.in(in1[11:8]), .right(right1), .out(out2)); 
led7 l3(.in(in1[15:12]), .right(right1), .out(out3)); 
led7 l4(.in(in2[3:0]), .right(right2), .out(out4)); 
led7 l5(.in(in2[7:4]), .right(right2), .out(out5)); 
led7 l6(.in(in2[11:8]), .right(right2), .out(out6)); 
led7 l7(.in(in2[15:12]), .right(right2), .out(out7)); 

endmodule

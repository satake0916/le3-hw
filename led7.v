module led7 ( 	
input [3:0] in, 	
input right,
output reg [7:0] out ); 	
always @* begin
if (right == 1'b0) begin
out = 8'b00000000;
end else begin 		
case (in) 			
0: out = 8'b01111110; 			
1: out = 8'b00110000; 			
2: out = 8'b01101101; 			
3: out = 8'b01111001; 			
4: out = 8'b00110011; 			
5: out = 8'b01011011; 			
6: out = 8'b01011111; 			
7: out = 8'b01110010; 			
8: out = 8'b01111111; 			
9: out = 8'b01111011; 		  
10: out = 8'b01110111; 		  
11: out = 8'b00011111; 		  
12: out = 8'b00001101; 		  
13: out = 8'b00111101; 		  
14: out = 8'b01001111; 		  
15: out = 8'b01000111; 		  
default: out = 8'b11111111; 		
endcase 	
end
end 
endmodule


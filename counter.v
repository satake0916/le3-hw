module counter(
input clock,reset,halt,
output [7:0] out1,
output [7:0] out2,
output reg [3:0] selector
); 

reg [31:0] count;
reg [3:0] led_in1, led_in2;
reg halt_keep = 1'b0;

led7 led1(.in(led_in1), .right(halt_keep), .out(out1));
led7 led2(.in(led_in2), .right(halt_keep), .out(out2));

always @ (posedge clock or negedge reset) begin
	if(reset == 1'b0) begin
		count <= 32'h0;
		selector <= 4'hf;
		halt_keep <= 1'b0;
	end else if (halt == 1'b0 && halt_keep == 1'b0) begin
		count <= count + 32'b0000_0000_0000_0000_0000_0000_0000_0001;
		selector <= 4'hf;
	end else if (halt_keep == 1'b0)begin
		halt_keep <= 1'b1;
		selector <= 4'hf;
	end else begin
		case (selector)
			4'b0111: 
			begin
				selector <= 4'b1011;
				led_in2 <= count[11:8];
				led_in1 <= count[27:24];
			end
			4'b1011: 
			begin
				selector <= 4'b1101;
				led_in2 <= count[7:4];
				led_in1 <= count[23:20];
			end
			4'b1101: 
			begin
				selector <= 4'b1110;
				led_in2 <= count[3:0];
				led_in1 <= count[19:16];
			end
			default:
			begin
				selector <= 4'b0111;
				led_in2 <= count[15:12];
				led_in1 <= count[31:28];
			end
		endcase
	end
end

endmodule
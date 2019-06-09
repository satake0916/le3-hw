module programcounter (
	input clock,
	input reset,
	input [15:0] in,
	input [4:0] phasecounter,
	output reg [15:0] out
);

	always @(posedge clock or negedge reset) begin
		if (reset == 1'b0) begin
			out <= 16'b0;
		end else if(phasecounter[1] == 1'b1) begin
			out <= in;
		end
	end
endmodule
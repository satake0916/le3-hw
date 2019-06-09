//already changed as ver.final

module memory_access(
	input clock, reset,
	input [4:0] phasecounter,
	input MemRead, MemWrite,
	input [15:0] address,
	input [15:0] input_data,
	input [1:0]ledout,
	input switchin,
	input fromswitch,
	input inv_clock, 
	output reg [15:0] output_data,
	output [7:0] out0,out1,out2,out3, out4,out5,out6,out7,
	output [7:0] selector
);

wire wren;
wire [15:0] memory_data;

reg right1 = 1'b0;
reg right2 = 1'b0;

reg [15:0] output_7seg1, output_7seg2;

assign selector = 8'b00000001;
 
assign wren = phasecounter[3] && MemWrite;
data_memory mem(.address(address), .clock(inv_clock), .data(input_data), .wren(wren), .q(memory_data));
external_output ex(.clock(clock), .in1(output_7seg1), .in2(output_7seg2), .right1(right1), .right2(right2), .out0(out0), .out1(out1), .out2(out2), .out3(out3), .out4(out4), .out5(out5), .out6(out6), .out7(out7));

always @* begin
	if (switchin == 1'b1) begin
		output_data <= {8'd0, fromswitch, 7'd0};
	end else begin
		output_data <= memory_data;
	end
end

always @(posedge clock or negedge reset) begin
	if(reset == 1'b0) begin
		{right1, right2} <= 2'b00;
	end else if(phasecounter[3] == 1'b1) begin
		if(ledout == 2'b11) begin
			{right1, right2} <= 2'b11;
			output_7seg1 <= input_data;
			output_7seg2 <= address;
		end else if (ledout == 2'b10) begin
			{right1, right2} <= 2'b10;
			output_7seg1 <= input_data;
			output_7seg2 <= address;
		end
	end
end
endmodule
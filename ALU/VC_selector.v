module VC_selector (
	input [3:0] opcode,
	input _cond,
	output reg cond
);

always @* begin
	case (opcode[2:0])
		3'b000: cond <= _cond;
		3'b001: cond <= _cond;
		3'b101: cond <= _cond;
		default: cond <= 1'b0;
	endcase
end
	
endmodule
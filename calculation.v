module calculation ( 
	input clock, 
	input reset, 
	input [4:0] phasecounter,
	input [15:0] ext_d, // 7-0 bits of instrument code 
	input [15:0] ar, br, 	
	input [2:0] ALUSrc,
	input [3:0] ALUOp,
	output [15:0] dr, 	
	output [3:0] cond
); 

wire sign_flag, zero_flag, carry_flag, overflow_flag;

assign cond = {sign_flag, zero_flag, carry_flag, overflow_flag};

reg [15:0] op1_ALU, op2_ALU;

always @* begin
	case (ALUSrc)
		3'b000: {op1_ALU, op2_ALU} <= {br, ar};
		3'b001: {op1_ALU, op2_ALU} <= {br, ext_d};
		3'b010: {op1_ALU, op2_ALU} <= {16'd0, ext_d};
		3'b011: {op1_ALU, op2_ALU} <= {16'd0, ar};
		3'b100: {op1_ALU, op2_ALU} <= {ar, ext_d};
		3'b101: {op1_ALU, op2_ALU} <= {ar,br};
		default: {op1_ALU, op2_ALU} <= {16'hxxxx, 16'hxxxx};
	endcase
end

ALU alu(.dataA(op1_ALU), .dataB(op2_ALU), .opcode(ALUOp), .out(dr), .cond({sign_flag, zero_flag, carry_flag, overflow_flag})); 

endmodule


module branch_calculator (
	input S, Z, V,
	input Branch,
	input [15:0] PC_plus_1, instrument,
	output PCSrc,
	output [15:0] address
);

wire EQ, LT;
assign {EQ, LT} = {Z, S ^ V};

wire [15:0] sign_extended_d;
sign_ext se(.in(instrument[7:0]), .out(sign_extended_d));

reg hasB, hasEQ, hasLT, hasLE, hasNEQ;

assign PCSrc = Branch && (hasB || ((!hasEQ || EQ) && (!hasLT || LT) && (!hasLE || EQ || LT) && (!hasNEQ || !EQ))); 
assign address = PC_plus_1 + sign_extended_d;

always @* begin
	if (instrument[15:14] == 2'b10) begin
		case (instrument[13:11])
			3'b100: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'b10000; // B
			3'b111: case (instrument[10:8])
							3'b000: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'b01000; // BE
							3'b001: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'b00100; // BLT
							3'b010: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'b00010; // BLE
							3'b011: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'b00001; // BNE
							default: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'bxxxxx;
					  endcase
			default: {hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'bxxxxx;
		endcase
	end else begin
		{hasB, hasEQ, hasLT, hasLE, hasNEQ} <= 5'bxxxxx;
	end
end					
					
endmodule
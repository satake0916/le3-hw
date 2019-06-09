module multiplexer_ALU (
	input [15:0] v_add,
	input [15:0] v_sub,
	input [15:0] v_and,
	input [15:0] v_or,
	input [15:0] v_xor,
	input [15:0] v_cmp,
	input [15:0] v_mov,
	input [15:0] v_sll,
	input [15:0] v_slr,
	input [15:0] v_srl,
	input [15:0] v_sra,
	input [3:0] opcode,
	output reg [15:0] out );
	
	always @* begin
		case (opcode)
			 0: out <= v_add;  
			 1: out <= v_sub;  
			 2: out <= v_and;  
			 3: out <= v_or ;
			 4: out <= v_xor;
			 5: out <= v_cmp;
			 6: out <= v_mov;
//			 7: out <= ;
			 8: out <= v_sll;
			 9: out <= v_slr;
			10: out <= v_srl;
			11: out <= v_sra; 
//			12: out <= ;
//			13: out <= ;
//			14: out <= ;
//			15: out <= ;
			default: out <= 16'hffff;
		endcase
	end
endmodule
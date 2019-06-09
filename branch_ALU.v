module branch_ALU (
	input clock,reset,
	input [4:0] phasecounter,
	input [15:0] pc_plus_1,
	input [15:0] command,
	input [3:0] cond,
	input [15:0] BR, CR,
	output PCSrc,
	output reg [15:0] jump
);

reg Branch;
wire EQ1, LT1, EQ2, LT2;
wire Z,S,V;

wire [15:0] sign_extended_d_8, sign_extended_d_5, extended_d_3;

sign_ext se(.in(command[7:0]), .out(sign_extended_d_8));

assign S = cond[3];
assign Z = cond[2];
assign V = cond[0];
assign {EQ1, LT1} = {BR == CR, $signed(BR) < $signed(CR)};
assign {EQ2, LT2} = {Z, S ^ V};
assign PCSrc = Branch && (((command[15:11] == 5'b10001) && EQ1) || ((command[15:11] == 5'b10010) && LT1) ||
					(command[15:11] == 5'b10100) || ((command[15:11] == 5'b10101) && (LT1 || EQ1)) ||
					((command[15:11] == 5'b10110) && !EQ1) ||
					((command[15:8] == 8'b10111000) && EQ2) || ((command[15:8] == 8'b10111001) && LT2) ||
					((command[15:8] == 8'b10111010) && (LT2 || EQ2)) ||
					((command[15:8] == 8'b10111011) && !EQ2) || 
					((command[15:11] == 5'b10011) && (BR == extended_d_3)));
assign sign_extended_d_5 = {command[4], command[4], command[4], command[4], command[4], command[4], command[4], command[4], command[4], command[4], command[4], command[4:0]};
assign extended_d_3 = {13'b0, command[7:5]};
					
always @* begin
	case (command[15:11])
		5'b10001: Branch <= 1'b1; // BE'
		5'b10010: Branch <= 1'b1; // BLT'
		5'b10011: Branch <= 1'b1; // 正定数command[7:5]とreg([command[10:8])が等しいなら分岐
		5'b10100: Branch <= 1'b1; // B
		5'b10101: Branch <= 1'b1; // BLE'
		5'b10110: Branch <= 1'b1; // BNE'
		5'b10111: Branch <= 1'b1; // 条件分岐命令
		default: Branch <= 1'b0;
	endcase
end

always @* begin
	if (command[15:11] == 5'b10111 || command[15:11] == 5'b10100) begin
		jump <= pc_plus_1 + sign_extended_d_8;
	end else begin
		jump <= pc_plus_1 + sign_extended_d_5;
	end
end

endmodule
module command_data(
input [15:0] command,
output reg [15:0] ext_d,
output [2:0] des1, des2);

//sign_ext extend_d(.in(command[7:0]), .out(ext_d));
assign des1 = command[13:11];
assign des2 = command[10:8];

always @* //choose ext_d. ADDi,SUBi,SLL,SRL,SRL,SRA -> command[3:0], LD,ST,LI,Branch -> command[7:0]
begin
	if (command[15:14] == 2'b11) begin
		ext_d <= {command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3], command[3:0]};
	end else begin
		ext_d <= {command[7], command[7], command[7], command[7], command[7], command[7], command[7], command[7], command[7:0]};
	end
end

endmodule
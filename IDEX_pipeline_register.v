module IDEX_pipeline_register(
input clock,reset,
input [4:0] phasecounter,
//from controller
input RegDst, MemtoReg, RegWrite, MemRead, MemWrite,
input [2:0] ALUSrc,
input [3:0] ALUOp,
input [1:0] ledout,
input switchin,
//from pc
//input [15:0] pc,
//from fetch register 
input [15:0] data1,data2,
//from command
input [15:0] ext_d,
input [2:0] des1, des2,

output reg out_RegDst, out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite,
output reg [2:0] out_ALUSrc,
output reg [3:0] out_ALUOp,
output reg [1:0] out_ledout,
output reg out_switchin,
//output reg [15:0] out_pc, 
output reg [15:0] out_data1,out_data2,
output reg [15:0] out_ext_d,
output reg [2:0] out_des1, out_des2

);

always @(posedge clock or negedge reset)
begin
	if(reset == 1'b0)
		begin
			{out_RegDst, out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite} <= 5'b00000;
			out_ALUSrc <= 3'b0;
			out_ALUOp <= 4'b0;
			out_ledout <= 2'b00;
			out_switchin <= 1'b0;
			//out_pc <= 16'b0;
			out_data1 <= 16'b0;
			out_data2 <= 16'b0;
			out_ext_d <= 16'b0;
			out_des1 <= 3'b0;
			out_des2 <= 3'b0;
		end 
		else if(phasecounter[1] == 1'b1)
		begin
			{out_RegDst, out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite} <= {RegDst, MemtoReg, RegWrite, MemRead, MemWrite};
			out_ledout <= ledout;
			out_switchin <= switchin;
			out_ALUSrc <= ALUSrc;
			out_ALUOp <= ALUOp;
			//out_pc <= pc;
			out_data1 <= data1;
			out_data2 <= data2;
			out_ext_d <= ext_d;
			out_des1 <= des1;
			out_des2 <= des2;
		end
end

endmodule
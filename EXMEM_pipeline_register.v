module EXMEM_pipeline_register(
input clock,reset,
input [4:0] phasecounter,
//from controller
input MemtoReg, RegWrite, MemRead, MemWrite,
input [1:0] ledout,
input switchin,
//from fetch register 
input [15:0] address, data,
//from command
input [2:0] des,

output reg out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite,
output reg [1:0] out_ledout,
output reg out_switchin,
output reg [15:0] out_address,out_data,
output reg [2:0] out_des

);

always @(posedge clock or negedge reset)
begin
	if(reset == 1'b0)
		begin
			{out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite} <= 4'b0000;
			out_ledout <= 2'b00;
			out_switchin <= 1'b0;
			out_address <= 16'b0;
			out_data <= 16'b0;
			out_des <= 3'b0;
		end 
	else if(phasecounter[2] == 1'b1)
		begin
			{out_MemtoReg, out_RegWrite, out_MemRead, out_MemWrite} <= {MemtoReg, RegWrite, MemRead, MemWrite};
			out_ledout <= ledout;
			out_switchin <= switchin;
			out_address <= address;
			out_data <= data;
			out_des <= des;
		end
end

endmodule
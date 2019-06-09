module IFID_pipeline_register(
input clock,reset,
input [4:0] phasecounter,
input [15:0] pc,
input [15:0] command,
input [3:0] cond,
output reg [15:0] out_pc,
output reg [15:0] out_command,
output reg [3:0] out_cond);

always @(posedge clock or negedge reset)
begin
	if(reset == 1'b0)
	begin
		out_pc <= 16'b0;
		out_command <= 16'b0;
		out_cond <= 4'b0;
	end 
	else if(phasecounter[0] == 1'b1)
	begin
		out_pc <= pc;
		out_command <= command;
		out_cond <= cond;
	end
end

endmodule
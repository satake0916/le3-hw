
module general_register (
	input clock,
	input reset,
	input [2:0] rs,
	input [2:0] rd,
	input [2:0] wr, // written register
	input [15:0] x, // rdへ代入する値
	input write, // 書き込むかどうか
	output reg [15:0] rs_value, // レジスタrsの値
	output reg [15:0] rd_value // レジスタrdの値
//	output wire [15:0] register0,
//	output wire [15:0] register1,
//	output wire [15:0] register2,
//	output wire [15:0] register3,
//	output wire [15:0] register4,
//	output wire [15:0] register5,
//	output wire [15:0] register6,
//	output wire [15:0] register7
);

reg [15:0] registers [0:7]; 

//assign register0 = registers[0];
//assign register1 = registers[1];
//assign register2 = registers[2];
//assign register3 = registers[3];
//assign register4 = registers[4];
//assign register5 = registers[5];
//assign register6 = registers[6];
//assign register7 = registers[7];

always @(posedge clock or negedge reset)
begin 	
	if (reset == 1'b0)
	begin 		
		registers[0] <= 16'b0; 		
		registers[1] <= 16'b0; 		
		registers[2] <= 16'b0; 		
		registers[3] <= 16'b0; 		
		registers[4] <= 16'b0; 		
		registers[5] <= 16'b0; 		
		registers[6] <= 16'b0; 		
		registers[7] <= 16'b0; 	
		rs_value <= 16'b0;
		rd_value <= 16'b0;
	end else if (write == 1'b1) begin 		
		registers[wr] <= x;
	end else begin 		
		rs_value <= registers[rs]; 		
		rd_value <= registers[rd]; 	
	end 
end
endmodule
module register_file (
	input clock, // (inverse clock)
	input reset,
	input [4:0] phasecounter,
	input [15:0] command,
	input RegWrite,
	input [2:0] wr, // 値を書き込むレジスタの番号
	input [15:0] x, // レジスタに書き込む16ビットの値
	output reg [15:0] AR, BR, CR // レジスタの値
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
wire [3:0] ra, rb, rc;

assign ra = command[13:11];
assign rb = command[10:8];
assign rc = command[7:5];

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
		registers[3'b000] <= 16'b0; 		
		registers[3'b001] <= 16'b0; 		
		registers[3'b010] <= 16'b0; 		
		registers[3'b011] <= 16'b0; 		
		registers[3'b100] <= 16'b0; 		
		registers[3'b101] <= 16'b0; 		
		registers[3'b110] <= 16'b0; 		
		registers[3'b111] <= 16'b0;
		AR <= 16'b0;
		BR <= 16'b0;
		CR <= 16'b0;
	end else if (phasecounter[1] == 1'b1 || phasecounter[4] == 1'b1) begin
		if (RegWrite == 1'b1) begin 		
			registers[wr] <= x;
			AR <= ra != wr ? registers[ra] : x;
			BR <= rb != wr ? registers[rb] : x;
			CR <= rc != wr ? registers[rc] : x;	
		end else begin
			AR <= registers[ra];
			BR <= registers[rb];
			CR <= registers[rc];
		end
	end
end
endmodule
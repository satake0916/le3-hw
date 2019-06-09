//already changed as ver.final

module controller (
	input [15:0] command,
	output reg RegDst, MemtoReg, RegWrite, MemRead, MemWrite,
	output reg [2:0] ALUSrc,
	output reg [3:0] ALUOp,
	output reg [1:0] ledout,
	output reg switchin,
	output reg halt
);

/*
RegDst:書き込みレジスタのdestination reg番号が[13:11]で得られるなら0(演算、ロードストア)、[10:8]なら1(即値ロード、分岐)
ALUSrc:000->ar,br	001->d,br	010->0,d	011->ar,0	100->ar,d	101->br,ar
MemtoReg:レジスタの書き込みデータ入力へ渡される値がALUから得られるなら0(演算)、データメモリから得られるなら1(ロード,input)
RegWrite:書き込みレジスタ入力に指定されているレジスタに書き込みデータ入力の値が書き込まれるなら1(演算、ロード)
MemRead:データメモリから読みだすとき1(ロード)
MemWrite:データメモリに書き込むとき1(ストア)
ALUOp:op3(演算)                                                                                                 
ledout[1]:0->not output			 1-> output
ledout[0]:0->output only input_data	 1->output input_data and address
swichin:0->not input	1->input
halt(to phasecounter):0->not halt	1->halt 
*/

wire [1:0] op1 = command[15:14];
wire [2:0] op2 = command[13:11];
wire [3:0] op3 = command[7:4];
wire [3:0] d = command[3:0];

always @* begin
	case (op1)
		2'b00://ロード
		begin
			{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b01011;
			switchin <= 1'b0;
			ledout <= 2'b00;
			halt <= 1'b0;
			ALUSrc <= 3'b001; // br, d
			ALUOp <= 4'b0000; // ADD
		end
		2'b01://ストア
		begin
			{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b1010x;
			switchin <= 1'b0;
			ledout <= 2'b00;
			halt <= 1'b0;
			ALUSrc <= 3'b001; // br, d
			ALUOp <= 4'b0000; // ADD
		end
		2'b10://即値ロード、分岐
		begin
			switchin <= 1'b0;
			ledout <= 2'b00;
			halt <= 1'b0;
			ALUSrc <= 3'b010;
			ALUOp <= 4'b0000;
			case (op2)
				3'b000: // load immediate
				begin
					{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b10010;
				end
				3'b100: // branch without condition
				begin
					{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'bx000x;
				end
				3'b111: // branch
				begin
					{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'bx000x; // ALUSrcが微妙
				end
				default:
				begin
					{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b00000;
				end
			endcase
		end
		2'b11://演算
		begin
			if (op3[3] == 1'b0) begin
				case (op3)
					4'b0111://ADDi
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b00010;
						switchin <= 1'b0;
						ledout <= 2'b00;
						halt <= 1'b0;
						ALUSrc <= 3'b100;
						ALUOp <= 4'b0000; // ADD
					end
                    4'b0101: // CMP
                    begin
                       {RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'bx0000;
                       switchin <= 1'b0;
				       ledout <= 2'b00;
				       ALUSrc <= 3'b000;
				       ALUOp <= op3;
				       halt <= 1'b0;
                    end
					default://ADD,SUB,AND,OR,XOR
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b10010;
						switchin <= 1'b0;
						ledout <= 2'b00;
						halt <= 1'b0;
						ALUSrc <= 3'b000;
						ALUOp <= op3;
					end
				endcase
			end else begin
				case (op3)
					4'b1100: // IN
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b10011;
						switchin <= 1'b1;
						ledout <= 2'b00;
						halt <= 1'b0;
						ALUSrc <= 3'b000;
						ALUOp <= 4'b0110;//anything OK
					end
					4'b1101: // OUT
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'bx0000;
						switchin <= 1'b0;
						ALUSrc <= 3'b101;
						ALUOp <= 4'b0110;//mov at ALU
						halt <= 1'b0;
						if(d == 4'b0000) ledout <= 2'b10;
						else ledout <= 2'b11;
						
					end
					4'b1111: // HALT
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b00000;
						switchin <= 1'b0;
						ledout <= 2'b00;
						ALUSrc <= 3'b000;
						ALUOp <= 4'b0110;//anything OK
						halt <= 1'b1;
					end
					4'b1110: // SUBi
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b00010;
						switchin <= 1'b0;
						ledout <= 2'b00;
						halt <= 1'b0;
						ALUSrc <= 3'b100;
						ALUOp <= 4'b0001; // SUB
					end
					default: // SLL,SLR,SRL,SRA
					begin
						{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b10010;
						switchin <= 1'b0;
						ledout <= 2'b00;
						ALUSrc <= 3'b001;
						ALUOp <= op3;
						halt <= 1'b0;
					end
				endcase
			end	
		end
		default:
		begin
			{RegDst, MemRead, MemWrite, RegWrite, MemtoReg} <= 5'b00000;
			switchin <= 1'b0;
			ledout <= 2'b0;
			halt <= 1'b0;
			ALUSrc <= 3'b0;
			ALUOp <= 4'b0;
		end
	endcase
end
//
//always @(posedge clock or negedge reset) begin
//	if (reset == 1'b0) begin
//		{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b000000;
//		cond <= 3'b0;
//		switchin <= 1'b0;
//		ledout <= 1'b0;
//	end else begin
//		case (op1)
//			2'b00://ロード
//			begin
//				{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b011011;
//				switchin <= 1'b0;
//				ledout <= 1'b0;
//			end
//			2'b01://ストア
//			begin
//				{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'bx1010x;
//				switchin <= 1'b0;
//				ledout <= 1'b0;
//			end
//			2'b10://即値ロード、分岐
//			begin
//				switchin <= 1'b0;
//				ledout <= 1'b0;
//				case (op2)
//					3'b000: // load immediate
//					begin
//						{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b110010;
//					end
//					3'b100: // branch without condition
//					begin
//						{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'bxx000x;
//					end
//					3'b111: // branch
//					begin
//						{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'bxx000x; // ALUSrcが微妙
//						cond <= condition;
//					end
//					default:
//					begin
//						{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b000000;
//					end
//				endcase
//			end
//			2'b11://演算
//			begin
//				if (op3[3] == 1'b0) begin
//					{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b100010;
//					switchin <= 1'b0;
//					ledout <= 1'b0;
//				end else begin
//					case (op3)
//						4'b1100: // in
//						begin
//							{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b1x0010;
//							switchin <= 1'b1;
//							ledout <= 1'b0;
//						end
//						4'b1101: // out
//						begin
//							{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'bxx0000;
//							switchin <= 1'b0;
//							ledout <= 1'b1;
//						end
//						4'b1111: // halt
//						begin
//							{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b0x0000;
//							switchin <= 1'b0;
//							ledout <= 1'b0;
//						end
//						default: // shift
//						begin
//							{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b110010;
//							switchin <= 1'b0;
//							ledout <= 1'b0;
//						end
//					endcase
//				end	
//			end
//			default:
//			begin
//				{RegDst, ALUSrc, MemRead, MemWrite, RegWrite, MemtoReg} <= 6'b000000;
//				cond <= 3'b0;
//				switchin <= 1'b0;
//				ledout <= 1'b0;
//			end
//		endcase
//	end
//end
endmodule

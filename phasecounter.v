//already changed as ver.final

module phasecounter(
	input clock,
	input reset,
	input exc,
	input halt,
	output reg [4:0] phase);//p5p4p3p2p1
	
	reg [1:0] shift;
	reg onoff;//0:off 1:on (0: プロセッサを停止(Off)にする, 1: プロセッサを動作させる(On))
	reg phase_off_controller;//controll phase when you push the exc

	always @(posedge clock or negedge reset) begin
		if(reset == 1'b0) begin
					phase <= 5'b00000;
					shift <= 2'b11;
					onoff <= 1'b1;
					phase_off_controller <= 1'b0;
		end else begin
	
			shift[1] <= shift[0];
			shift[0] <= exc;
		
		
			if(shift == 2'b10) begin
				if(onoff == 1'b0) onoff <= 1'b1;
				else onoff <= 1'b0;
			end
		
			if (halt == 1'b1) begin
				phase <= 5'b00000;
				shift <= 2'b11;
				onoff <= 1'b0;
				phase_off_controller <= 1'b0;
			end else if (onoff == 1'b0) begin
				case(phase)
					5'b00001:phase <= 5'b00010;
					5'b00010:phase <= 5'b00100;
					5'b00101:
						begin
							phase <= 5'b01000;
							phase_off_controller <= 1'b1;
						end		
					5'b01000:
						begin
							if (phase_off_controller == 1'b1) begin
								phase <= 5'b10010;
								phase_off_controller <= 1'b0;
							end else begin
								phase <= 5'b10000;
							end
						end
					5'b10010:phase <= 5'b00100;
					5'b00100:phase <= 5'b01000;
					default:phase <= 5'b00000; // 停止させる
				endcase
			end else begin
				case(phase)
					5'b00001:phase <= 5'b00010;
					5'b00010:phase <= 5'b00101;
					5'b00101:phase <= 5'b01000;
					5'b01000:phase <= 5'b10010;
					5'b10010:phase <= 5'b00101;
					default:phase <= 5'b00001;
				endcase
			end
		end
	end		
	
endmodule
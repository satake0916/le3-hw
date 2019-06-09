// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"
// CREATED		"Fri Jun 15 09:28:10 2018"

module FINAL(
	clock,
	reset,
	exc,
	switch,
	counter_output_A,
	counter_output_B,
	counter_selector_A,
	counter_selector_B,
	out0,
	out1,
	out2,
	out3,
	out4,
	out5,
	out6,
	out7,
	phase,
	selector
);


input wire	clock;
input wire	reset;
input wire	exc;
input wire	switch;
output wire	[7:0] counter_output_A;
output wire	[7:0] counter_output_B;
output wire	[3:0] counter_selector_A;
output wire	[3:0] counter_selector_B;
output wire	[7:0] out0;
output wire	[7:0] out1;
output wire	[7:0] out2;
output wire	[7:0] out3;
output wire	[7:0] out4;
output wire	[7:0] out5;
output wire	[7:0] out6;
output wire	[7:0] out7;
output wire	[4:0] phase;
output wire	[7:0] selector;

wire	[15:0] SYNTHESIZED_WIRE_0;
wire	[4:0] SYNTHESIZED_WIRE_80;
wire	[15:0] SYNTHESIZED_WIRE_81;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[3:0] SYNTHESIZED_WIRE_9;
wire	[2:0] SYNTHESIZED_WIRE_10;
wire	[15:0] SYNTHESIZED_WIRE_11;
wire	[15:0] SYNTHESIZED_WIRE_82;
wire	[2:0] SYNTHESIZED_WIRE_13;
wire	[2:0] SYNTHESIZED_WIRE_14;
wire	[15:0] SYNTHESIZED_WIRE_15;
wire	[1:0] SYNTHESIZED_WIRE_16;
wire	[3:0] SYNTHESIZED_WIRE_18;
wire	[2:0] SYNTHESIZED_WIRE_19;
wire	[15:0] SYNTHESIZED_WIRE_83;
wire	[15:0] SYNTHESIZED_WIRE_21;
wire	[15:0] SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_24;
wire	[2:0] SYNTHESIZED_WIRE_25;
wire	[2:0] SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	[15:0] SYNTHESIZED_WIRE_32;
wire	[2:0] SYNTHESIZED_WIRE_34;
wire	[1:0] SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_84;
wire	[15:0] SYNTHESIZED_WIRE_85;
wire	[15:0] SYNTHESIZED_WIRE_42;
wire	[1:0] SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	[15:0] SYNTHESIZED_WIRE_48;
wire	[2:0] SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_51;
wire	[15:0] SYNTHESIZED_WIRE_52;
wire	[15:0] SYNTHESIZED_WIRE_53;
wire	[3:0] SYNTHESIZED_WIRE_56;
wire	[15:0] SYNTHESIZED_WIRE_57;
wire	[15:0] SYNTHESIZED_WIRE_58;
wire	[15:0] SYNTHESIZED_WIRE_86;
wire	SYNTHESIZED_WIRE_87;
wire	[15:0] SYNTHESIZED_WIRE_64;
wire	[3:0] SYNTHESIZED_WIRE_65;
wire	[15:0] SYNTHESIZED_WIRE_88;
wire	SYNTHESIZED_WIRE_68;
wire	[15:0] SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_73;
wire	[2:0] SYNTHESIZED_WIRE_76;
wire	[15:0] SYNTHESIZED_WIRE_77;
wire	[3:0] SYNTHESIZED_WIRE_79;

assign	counter_selector_A = SYNTHESIZED_WIRE_79;
assign	counter_selector_B = SYNTHESIZED_WIRE_79;
assign	phase = SYNTHESIZED_WIRE_80;




programcounter	b2v_inst(
	.clock(clock),
	.reset(reset),
	.in(SYNTHESIZED_WIRE_0),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out(SYNTHESIZED_WIRE_86));

assign	SYNTHESIZED_WIRE_84 =  ~clock;


controller	b2v_inst10(
	.command(SYNTHESIZED_WIRE_81),
	.RegDst(SYNTHESIZED_WIRE_3),
	.MemtoReg(SYNTHESIZED_WIRE_4),
	.RegWrite(SYNTHESIZED_WIRE_5),
	.MemRead(SYNTHESIZED_WIRE_6),
	.MemWrite(SYNTHESIZED_WIRE_7),
	.switchin(SYNTHESIZED_WIRE_8),
	.halt(SYNTHESIZED_WIRE_87),
	.ALUOp(SYNTHESIZED_WIRE_9),
	.ALUSrc(SYNTHESIZED_WIRE_10),
	.ledout(SYNTHESIZED_WIRE_16));


IDEX_pipeline_register	b2v_inst11(
	.clock(clock),
	.reset(reset),
	.RegDst(SYNTHESIZED_WIRE_3),
	.MemtoReg(SYNTHESIZED_WIRE_4),
	.RegWrite(SYNTHESIZED_WIRE_5),
	.MemRead(SYNTHESIZED_WIRE_6),
	.MemWrite(SYNTHESIZED_WIRE_7),
	.switchin(SYNTHESIZED_WIRE_8),
	.ALUOp(SYNTHESIZED_WIRE_9),
	.ALUSrc(SYNTHESIZED_WIRE_10),
	.data1(SYNTHESIZED_WIRE_11),
	.data2(SYNTHESIZED_WIRE_82),
	.des1(SYNTHESIZED_WIRE_13),
	.des2(SYNTHESIZED_WIRE_14),
	.ext_d(SYNTHESIZED_WIRE_15),
	.ledout(SYNTHESIZED_WIRE_16),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out_RegDst(SYNTHESIZED_WIRE_24),
	.out_MemtoReg(SYNTHESIZED_WIRE_27),
	.out_RegWrite(SYNTHESIZED_WIRE_28),
	.out_MemRead(SYNTHESIZED_WIRE_29),
	.out_MemWrite(SYNTHESIZED_WIRE_30),
	.out_switchin(SYNTHESIZED_WIRE_31),
	.out_ALUOp(SYNTHESIZED_WIRE_18),
	.out_ALUSrc(SYNTHESIZED_WIRE_19),
	.out_data1(SYNTHESIZED_WIRE_83),
	.out_data2(SYNTHESIZED_WIRE_21),
	.out_des1(SYNTHESIZED_WIRE_26),
	.out_des2(SYNTHESIZED_WIRE_25),
	.out_ext_d(SYNTHESIZED_WIRE_22),
	.out_ledout(SYNTHESIZED_WIRE_35));


calculation	b2v_inst12(
	.clock(clock),
	.reset(reset),
	.ALUOp(SYNTHESIZED_WIRE_18),
	.ALUSrc(SYNTHESIZED_WIRE_19),
	.ar(SYNTHESIZED_WIRE_83),
	.br(SYNTHESIZED_WIRE_21),
	.ext_d(SYNTHESIZED_WIRE_22),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.cond(SYNTHESIZED_WIRE_65),
	.dr(SYNTHESIZED_WIRE_32));


mux_destination	b2v_inst13(
	.selector(SYNTHESIZED_WIRE_24),
	.lower(SYNTHESIZED_WIRE_25),
	.upper(SYNTHESIZED_WIRE_26),
	.out(SYNTHESIZED_WIRE_34));


EXMEM_pipeline_register	b2v_inst15(
	.clock(clock),
	.reset(reset),
	.MemtoReg(SYNTHESIZED_WIRE_27),
	.RegWrite(SYNTHESIZED_WIRE_28),
	.MemRead(SYNTHESIZED_WIRE_29),
	.MemWrite(SYNTHESIZED_WIRE_30),
	.switchin(SYNTHESIZED_WIRE_31),
	.address(SYNTHESIZED_WIRE_32),
	.data(SYNTHESIZED_WIRE_83),
	.des(SYNTHESIZED_WIRE_34),
	.ledout(SYNTHESIZED_WIRE_35),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out_MemtoReg(SYNTHESIZED_WIRE_45),
	.out_RegWrite(SYNTHESIZED_WIRE_46),
	.out_MemRead(SYNTHESIZED_WIRE_37),
	.out_MemWrite(SYNTHESIZED_WIRE_38),
	.out_switchin(SYNTHESIZED_WIRE_39),
	.out_address(SYNTHESIZED_WIRE_85),
	.out_data(SYNTHESIZED_WIRE_42),
	.out_des(SYNTHESIZED_WIRE_49),
	.out_ledout(SYNTHESIZED_WIRE_43));


memory_access	b2v_inst16(
	.clock(clock),
	.reset(reset),
	.MemRead(SYNTHESIZED_WIRE_37),
	.MemWrite(SYNTHESIZED_WIRE_38),
	.switchin(SYNTHESIZED_WIRE_39),
	.fromswitch(switch),
	.inv_clock(SYNTHESIZED_WIRE_84),
	.address(SYNTHESIZED_WIRE_85),
	.input_data(SYNTHESIZED_WIRE_42),
	.ledout(SYNTHESIZED_WIRE_43),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out0(out0),
	.out1(out1),
	.out2(out2),
	.out3(out3),
	.out4(out4),
	.out5(out5),
	.out6(out6),
	.out7(out7),
	.output_data(SYNTHESIZED_WIRE_48),
	.selector(selector));


MEMWB_pipeline_register	b2v_inst17(
	.clock(clock),
	.reset(reset),
	.MemtoReg(SYNTHESIZED_WIRE_45),
	.RegWrite(SYNTHESIZED_WIRE_46),
	.ALUResult(SYNTHESIZED_WIRE_85),
	.data(SYNTHESIZED_WIRE_48),
	.des(SYNTHESIZED_WIRE_49),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out_MemtoReg(SYNTHESIZED_WIRE_51),
	.out_RegWrite(SYNTHESIZED_WIRE_73),
	.out_ALUResult(SYNTHESIZED_WIRE_52),
	.out_data(SYNTHESIZED_WIRE_53),
	.out_des(SYNTHESIZED_WIRE_76));


mux_DR_MDR	b2v_inst18(
	.selector(SYNTHESIZED_WIRE_51),
	.DR(SYNTHESIZED_WIRE_52),
	.MDR(SYNTHESIZED_WIRE_53),
	.out(SYNTHESIZED_WIRE_77));


branch_ALU	b2v_inst19(
	.clock(clock),
	.reset(reset),
	.BR(SYNTHESIZED_WIRE_82),
	.command(SYNTHESIZED_WIRE_81),
	.cond(SYNTHESIZED_WIRE_56),
	.CR(SYNTHESIZED_WIRE_57),
	.pc_plus_1(SYNTHESIZED_WIRE_58),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.PCSrc(SYNTHESIZED_WIRE_68),
	.jump(SYNTHESIZED_WIRE_69));


adder	b2v_inst2(
	.in(SYNTHESIZED_WIRE_86),
	.out(SYNTHESIZED_WIRE_88));


phasecounter	b2v_inst3(
	.clock(clock),
	.reset(reset),
	.exc(exc),
	.halt(SYNTHESIZED_WIRE_87),
	.phase(SYNTHESIZED_WIRE_80));


memory_fetch	b2v_inst4(
	.clock(SYNTHESIZED_WIRE_84),
	.pc(SYNTHESIZED_WIRE_86),
	.data(SYNTHESIZED_WIRE_64));


IFID_pipeline_register	b2v_inst5(
	.clock(clock),
	.reset(reset),
	.command(SYNTHESIZED_WIRE_64),
	.cond(SYNTHESIZED_WIRE_65),
	.pc(SYNTHESIZED_WIRE_88),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.out_command(SYNTHESIZED_WIRE_81),
	.out_cond(SYNTHESIZED_WIRE_56),
	.out_pc(SYNTHESIZED_WIRE_58));


mux_pc	b2v_inst6(
	.PCSrc(SYNTHESIZED_WIRE_68),
	.jump(SYNTHESIZED_WIRE_69),
	.pc(SYNTHESIZED_WIRE_88),
	.out(SYNTHESIZED_WIRE_0));


counter	b2v_inst7(
	.clock(clock),
	.reset(reset),
	.halt(SYNTHESIZED_WIRE_87),
	.out1(counter_output_A),
	.out2(counter_output_B),
	.selector(SYNTHESIZED_WIRE_79));


register_file	b2v_inst8(
	.clock(SYNTHESIZED_WIRE_84),
	.reset(reset),
	.RegWrite(SYNTHESIZED_WIRE_73),
	.command(SYNTHESIZED_WIRE_81),
	.phasecounter(SYNTHESIZED_WIRE_80),
	.wr(SYNTHESIZED_WIRE_76),
	.x(SYNTHESIZED_WIRE_77),
	.AR(SYNTHESIZED_WIRE_11),
	.BR(SYNTHESIZED_WIRE_82),
	.CR(SYNTHESIZED_WIRE_57));


command_data	b2v_inst9(
	.command(SYNTHESIZED_WIRE_81),
	.des1(SYNTHESIZED_WIRE_13),
	.des2(SYNTHESIZED_WIRE_14),
	.ext_d(SYNTHESIZED_WIRE_15));


endmodule

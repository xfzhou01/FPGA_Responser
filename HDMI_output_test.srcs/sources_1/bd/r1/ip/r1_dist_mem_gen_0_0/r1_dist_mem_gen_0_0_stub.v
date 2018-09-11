// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Sep 10 12:57:00 2018
// Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/bd/r1/ip/r1_dist_mem_gen_0_0/r1_dist_mem_gen_0_0_stub.v
// Design      : r1_dist_mem_gen_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.2" *)
module r1_dist_mem_gen_0_0(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[7:0],spo[511:0]" */;
  input [7:0]a;
  output [511:0]spo;
endmodule

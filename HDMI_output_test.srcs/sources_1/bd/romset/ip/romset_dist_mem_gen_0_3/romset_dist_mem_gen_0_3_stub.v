// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Sep 11 16:17:52 2018
// Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/84546/Desktop/main/HDMI_output_test.srcs/sources_1/bd/romset/ip/romset_dist_mem_gen_0_3/romset_dist_mem_gen_0_3_stub.v
// Design      : romset_dist_mem_gen_0_3
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_12,Vivado 2018.2" *)
module romset_dist_mem_gen_0_3(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[3:0],spo[2:0]" */;
  input [3:0]a;
  output [2:0]spo;
endmodule
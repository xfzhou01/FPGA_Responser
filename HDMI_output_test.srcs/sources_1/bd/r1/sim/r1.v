//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Mon Sep 10 12:55:04 2018
//Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
//Command     : generate_target r1.bd
//Design      : r1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "r1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=r1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "r1.hwdef" *) 
module r1
   (a_0,
    spo_0);
  input [7:0]a_0;
  output [511:0]spo_0;

  wire [7:0]a_0_1;
  wire [511:0]dist_mem_gen_0_spo;

  assign a_0_1 = a_0[7:0];
  assign spo_0[511:0] = dist_mem_gen_0_spo;
  r1_dist_mem_gen_0_0 dist_mem_gen_0
       (.a(a_0_1),
        .spo(dist_mem_gen_0_spo));
endmodule

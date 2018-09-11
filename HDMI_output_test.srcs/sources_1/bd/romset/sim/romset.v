//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Tue Sep 11 16:30:58 2018
//Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
//Command     : generate_target romset.bd
//Design      : romset
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "romset,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=romset,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=6,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "romset.hwdef" *) 
module romset
   (ansain,
    ansaout,
    ansbin,
    ansbout,
    anscin,
    anscout,
    ansin,
    ansout,
    hardin,
    hardout,
    titlein,
    titleout);
  input [3:0]ansain;
  output [239:0]ansaout;
  input [3:0]ansbin;
  output [239:0]ansbout;
  input [3:0]anscin;
  output [239:0]anscout;
  input [3:0]ansin;
  output [2:0]ansout;
  input [3:0]hardin;
  output [1:0]hardout;
  input [3:0]titlein;
  output [239:0]titleout;

  wire [3:0]a_0_1;
  wire [3:0]a_1_1;
  wire [3:0]a_2_1;
  wire [3:0]a_3_1;
  wire [3:0]a_4_1;
  wire [3:0]a_5_1;
  wire [2:0]ans_spo;
  wire [239:0]ansa_spo;
  wire [239:0]ansb_spo;
  wire [239:0]ansc_spo;
  wire [1:0]hard_spo;
  wire [239:0]title_spo;

  assign a_0_1 = ansin[3:0];
  assign a_1_1 = ansain[3:0];
  assign a_2_1 = anscin[3:0];
  assign a_3_1 = ansbin[3:0];
  assign a_4_1 = titlein[3:0];
  assign a_5_1 = hardin[3:0];
  assign ansaout[239:0] = ansa_spo;
  assign ansbout[239:0] = ansb_spo;
  assign anscout[239:0] = ansc_spo;
  assign ansout[2:0] = ans_spo;
  assign hardout[1:0] = hard_spo;
  assign titleout[239:0] = title_spo;
  romset_dist_mem_gen_0_3 ans
       (.a(a_0_1),
        .spo(ans_spo));
  romset_dist_mem_gen_0_1 ansa
       (.a(a_1_1),
        .spo(ansa_spo));
  romset_ansa_0 ansb
       (.a(a_3_1),
        .spo(ansb_spo));
  romset_ansb_0 ansc
       (.a(a_2_1),
        .spo(ansc_spo));
  romset_dist_mem_gen_0_2 hard
       (.a(a_5_1),
        .spo(hard_spo));
  romset_dist_mem_gen_0_0 title
       (.a(a_4_1),
        .spo(title_spo));
endmodule

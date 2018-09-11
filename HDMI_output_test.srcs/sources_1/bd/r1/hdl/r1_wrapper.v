//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Mon Sep 10 12:55:04 2018
//Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
//Command     : generate_target r1_wrapper.bd
//Design      : r1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module r1_wrapper
   (a_0,
    spo_0);
  input [7:0]a_0;
  output [511:0]spo_0;

  wire [7:0]a_0;
  wire [511:0]spo_0;

  r1 r1_i
       (.a_0(a_0),
        .spo_0(spo_0));
endmodule

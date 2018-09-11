//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Tue Sep 11 16:30:58 2018
//Host        : LAPTOP-IJ2NHTNA running 64-bit major release  (build 9200)
//Command     : generate_target romset_wrapper.bd
//Design      : romset_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module romset_wrapper
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

  wire [3:0]ansain;
  wire [239:0]ansaout;
  wire [3:0]ansbin;
  wire [239:0]ansbout;
  wire [3:0]anscin;
  wire [239:0]anscout;
  wire [3:0]ansin;
  wire [2:0]ansout;
  wire [3:0]hardin;
  wire [1:0]hardout;
  wire [3:0]titlein;
  wire [239:0]titleout;

  romset romset_i
       (.ansain(ansain),
        .ansaout(ansaout),
        .ansbin(ansbin),
        .ansbout(ansbout),
        .anscin(anscin),
        .anscout(anscout),
        .ansin(ansin),
        .ansout(ansout),
        .hardin(hardin),
        .hardout(hardout),
        .titlein(titlein),
        .titleout(titleout));
endmodule

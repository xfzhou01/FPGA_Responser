module top(
    input video_hs,
    input video_vs,
    input video_de,
    input [7:0] video_r,
    input [7:0] video_g,
    input [7:0] video_b,
    input sys_clk,
    output [0:0]HDMI_OEN,
    output TMDS_clk_n,
    output TMDS_clk_p,
    output [2:0]TMDS_data_n,
    output [2:0]TMDS_data_p,
    output video_clk
); 
//wire video_clk;
wire video_clk_5x;
//wire video_hs;
//wire video_vs;
//wire video_de;
//wire[7:0] video_r;
//wire[7:0] video_g;
//wire[7:0] video_b;
assign HDMI_OEN = 1'b1;

video_pll video_pll_m0
 (
 // Clock in ports
    .clk_in1(sys_clk),
  // Clock out ports
    .clk_out1(video_clk),
    .clk_out2(video_clk_5x),
  // Status and control signals
    .reset(1'b0),
    .locked()
 );
 
rgb2dvi
#(
      .kGenerateSerialClk(1'b0),
      .kClkRange(1),     
      .kRstActiveHigh(1'b1)
)
rgb2dvi_m0 (
     // DVI 1.0 TMDS video interface
      .TMDS_Clk_p(TMDS_clk_p),
      .TMDS_Clk_n(TMDS_clk_n),
      .TMDS_Data_p(TMDS_data_p),
      .TMDS_Data_n(TMDS_data_n),
      
     //Auxiliary signals 
      .aRst(1'b0), //asynchronous reset; must be reset when RefClk is not within spec
      .aRst_n(1'b1), //-asynchronous reset; must be reset when RefClk is not within spec
      
      // Video in
      .vid_pData({video_r,video_b,video_g}),
      .vid_pVDE(video_de),
      .vid_pHSync(video_hs),
      .vid_pVSync(video_vs),
      .PixelClk(video_clk),
      
      .SerialClk(video_clk_5x)// 5x PixelClk
      ); 
  
endmodule
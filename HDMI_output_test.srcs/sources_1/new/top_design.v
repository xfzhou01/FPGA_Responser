`timescale 1ns / 1ps
module top_design(
        input sys_clk,
        output [0:0]HDMI_OEN,
        output TMDS_clk_n,
        output TMDS_clk_p,
        output [2:0]TMDS_data_n,
        output [2:0]TMDS_data_p,
        /////////////////////////////
        input [239:0] Title,   // LINE1
        input [239:0] Ansa,    // LINE2
        input [239:0] Ansb,    // 3
        input [239:0] Ansc,    // 4
        input [239:0] Ansd,    // 5
        input [8:0] counter_time,
        input [10:0] score1,     //P1_Score: 
        input [10:0] score2,
        input [10:0] score3,
        input key1,
        input key2,
        input key3,
        input key_host,
        input warning
    );
    wire video_clk;
    //wire video_clk_5x;
    wire video_hs;
    wire video_vs;
    wire video_de;
    wire[7:0] video_r;
    wire[7:0] video_g;
    wire[7:0] video_b;
show_design sds(
        .Title(Title),   // LINE1
        .Ansa(Ansa),    // LINE2
        .Ansb(Ansb),    // 36
        .Ansc(Ansc),    // 4
        .Ansd(Ansd),    // 5
        .counter_time(counter_time),
        .score1(score1),     //P1_Score: 
        .score2(score2),
        .score3(score3),
        .key1(key1),
        .key2(key2),
        .key3(key3),
        .key_host(key_host),
        .warning(warning),
        .clk(video_clk),            
        .rst(1'b0),            
        .hs(video_hs),            
        .vs(video_vs),            
        .de(video_de),            
        .rgb_r(video_r),   
        .rgb_g(video_g),    
        .rgb_b(video_b)    
    );    
/*    color_bar hdmi_color_bar(
        .clk(video_clk),
        .rst(1'b0),
        .hs(video_hs),
        .vs(video_vs),
        .de(video_de),
        .rgb_r(video_r),
        .rgb_g(video_g),
        .rgb_b(video_b)
    );*/
    
    
    
    
    top(
        .video_hs(video_hs),
        .video_vs(video_vs),
        .video_de(video_de),
        .video_r(video_r),
        .video_g(video_g),
        .video_b(video_b),
        .sys_clk(sys_clk),
        .HDMI_OEN(HDMI_OEN),
        .TMDS_clk_n(TMDS_clk_n),
        .TMDS_clk_p(TMDS_clk_p),
        .TMDS_data_n(TMDS_data_n),
        .TMDS_data_p(TMDS_data_p),
        .video_clk(video_clk)
    ); 
endmodule

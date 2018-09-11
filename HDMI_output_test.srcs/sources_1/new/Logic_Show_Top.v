`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/10 14:01:07
// Design Name: 
// Module Name: Logic_Show_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Logic_Show_Top(
    input sys_clk,
    input key1,
    input key2,
    input key3,
    input key4, 
    output [0:0]HDMI_OEN,
    output TMDS_clk_n,
    output TMDS_clk_p,
    output [2:0]TMDS_data_n,
    output [2:0]TMDS_data_p,
    output debug1,
    output debug2,
    output debug3,
    output debug4
    );
    wire led1,led2,led3,led_host,warning;
    wire [10:0] show1,show2,show3;
    wire [8:0] show_count;
    wire [7:0] prob_counter_;
    wire [2:0] status;
    wire [2:0] ansout;
    wire [1:0] hardout;    
    Logic_Top lt(
        .clk(sys_clk),                      //  ϵͳʱ��
        .key1(key1),                     //  ����1  or����λ��ʵ��
        .key2(key2),                     //  ����2
        .key3(key3),                     //  
        .key_host(key4),                 //  �����˰�ť
        .hardness(hardout),           //  ��Ŀ�Ѷ�
    //    input [2:0] answer,             //  ��Ŀ��
        .right_answer(ansout),
        .max_problem(4),        //  �����Ŀ����
        //////////////
        .led1(led1),                    //  ���led1 ����Ӧ���1����ɹ���
        .led2(led2),                    //   ���led2  (��Ӧ���2����ɹ�)
        .led3(led3),                    //   ���led3  (��Ӧ���3����ɹ�)
        .led_host(led_host),                //   ���led4  (��Ӧ����)
        .show1(show1),
        .show2(show2),
        .show3(show3),
        .show_count(show_count),
        .warning(warning),
        //output [1:0] choose,
        .prob_counter_(prob_counter_),
        .status(status),
        .debug1(debug1),
        .debug2(debug2),
        .debug3(debug3),
        .debug4(debug4)
        );
        wire [239:0] ansaout;
        wire [239:0] bnsaout;
        wire [239:0] cnsaout;
        wire [239:0] titleout;
        
   
     romset_wrapper
              (.ansain(prob_counter_),
               .ansaout(ansaout),
               .ansbin(prob_counter_),
               .ansbout(bnsaout),
               .anscin(prob_counter_),
               .anscout(cnsaout),
               .ansin(prob_counter_),
               .ansout(ansout),
               .hardin(prob_counter_),
               .hardout(hardout),
               .titlein(prob_counter_),
               .titleout(titleout));        
    top_design(
         .sys_clk(sys_clk),
         .HDMI_OEN(HDMI_OEN),
         .TMDS_clk_n(TMDS_clk_n),
         .TMDS_clk_p(TMDS_clk_p),
         .TMDS_data_n(TMDS_data_n),
         .TMDS_data_p(TMDS_data_p),
         .Title(titleout),   // LINE1
         .Ansa(ansaout),    // LINE2
         .Ansb(bnsaout),    // 3
         .Ansc(cnsaout),    // 4
         .Ansd(0),    // 5
         .counter_time(show_count),
         .score1(show1),     //P1_Score: 
         .score2(show2),
         .score3(show3),
         .key1(led1),
         .key2(led2),
         .key3(led3),
         .key_host(led_host),
         .warning(warning)
            );
    
endmodule

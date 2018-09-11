`timescale 1ns / 1ps

module Logic_Top(
    input clk,                      //  系统时钟
    input key1,                     //  按键1  or用上位机实现
    input key2,                     //  按键2
    input key3,                     //  
    input key_host,                 //  主持人按钮
    input [1:0] hardness,           //  题目难度
//    input [2:0] answer,             //  题目答案
    input [2:0] right_answer,
    input [7:0] max_problem,        //  最大题目数量
    output led1,                    //  输出led1 （对应玩家1抢答成功）
    output led2,                    //   输出led2  (对应玩家2抢答成功)
    output led3,                    //   输出led3  (对应玩家3抢答成功)
    output led_host,                //   输出led4  (对应主持)
    output [10:0] show1,
    output [10:0] show2,
    output [10:0] show3,
    output [8:0] show_count,
    output warning,
    //output [1:0] choose,
    output [7:0] prob_counter_,
    output [2:0] status,
    output debug1,
    output debug2,
    output debug3,
    output debug4
    );
    
    reg [2:0] counter;
    reg [7:0] prob_counter;
    reg [2:0] answer_;
    
    
    wire [2:0] answer;
    wire p1,p2,p3,h0;  //  抢答信号
    wire [2:0] index;  //  哪一位幸运玩家抢答成功了呢
    wire mark;         //  确定玩家抢答完毕 
    wire game_start;   //  游戏开始 000
    wire warn;         // 60 s结束的警报
    wire count1;      // 题目显示，灭灯。重置 001
    wire count2;
    wire count3;
    wire count31,count01,count53,count25;
    wire count4;
    assign prob_counter_=prob_counter;
    assign debug4=counter[2];
    assign debug3=counter[1];
    assign debug2=counter[0];
    assign debug1=show_count[0];
    
    assign warning=warn;
    assign status=counter;
    assign game_start=(counter==0);
    assign count1=(counter==1);
    assign count2=(counter==2);
    assign count3=(counter==3);
    assign count31=(counter==0&&h0==1)||(counter==3&&h0==1);
    assign count01=(counter==0&&h0==1);
    assign count53=(counter==5&&((warn!=0)||(answer!=0)));
    assign count25=(counter==2&&h0==1);
    assign count4=(counter==3'b100);
    // 状态机切换规则
    always @(posedge clk) begin
        if(counter==0&&h0==1) begin
            prob_counter<=0;
            counter<=1;
        end
        if(counter==1&&mark==1)begin
            counter<=2;
        end
        if(counter==2&&h0==1) begin
            counter<=5;
        end
        if(counter==5&&(warn||answer!=0)) begin
            counter<=3;
        end
        if(counter==3'b011&&h0==1) begin
            counter<=3'b001;
            prob_counter<=prob_counter+1;
        end
        if(counter==3'b011&&(prob_counter==max_problem-1)) begin
            counter<=3'b100;
        end
//        if(counter==3'b100) begin
//            mark<=0;
//        end
    end
    
Trans tr(
        .p1(p1),
        .p2(p2),
        .p3(p3),
        .h0(0),
        .count(counter),
        .answer(answer)
        );    
    
    
    Key_Store k1( //按键消抖
        .key1(key1),
        .key2(key2),
        .key3(key3),
        .key_main(key_host),
        .clk(clk),
        .p1(p1),
        .p2(p2),
        .p3(p3),
        .h0(h0)
        );
     
     CtrlLogic cl(  //看看谁先抢到
           .p1(p1),
           .p2(p2),
           .p3(p3),
           .h0(count31),
           .clk(clk),
           .index(index),
           .marked(mark)
           );
           
     LED_Ctrl lc(
               .index(index),
               .host(h0),
               .rst(count31),
               .clk(clk),
               .host_1(led_host),
               .player1(led1),
               .player2(led2),
               .player3(led3)
               );    
    
    Point_adder pa(
                   .player(index),                     //抢答到的那个选手
                   .Isright((right_answer==answer)),                         // 抢答是否正确
                   .rst(count01),                             // 同步清零
                   .clk(clk),                          // 时钟
                   .hard(hardness),                    //  难度，分为简单，中等，难
                   .set(count53),                             //代表题目答完，可以进行加减分
                   .score1_out(show1),
                   .score2_out(show2),
                   .score3_out(show3)
                   );    

    counter_60 c60(
        .rst(count31||count4),   //重置时钟(当切换题目时进行重置)
        .clk(clk),     //系统时钟
        .start(count25),
        .ender(count53),
        .showing(show_count),
        .warning(warn) //警报
        );
    
    
    initial begin
        counter=0;
    end
    
endmodule

`timescale 1ns / 1ps


module Top_tst();

    reg clk,key1,key2,key3,key_host;
    reg [1:0] hardness;
    reg [2:0] answer;
    reg [2:0] right_answer;
    reg [7:0] max_problem;
    wire led1,led2,led3,led_host,warning;
    wire [10:0] show1,show2,show3;
    wire [8:0] show_count;
    wire [7:0] prob_counter;
    wire [2:0] status;
    
    initial begin
        clk=0; key1=0; key2=0; key3=0; key_host=0; hardness=0; answer=0; right_answer=0; max_problem=0;
        
        //==============================================================================================
        #1 max_problem=3;
        #50 key_host=1; 
        #5 key_host=0;  // 主持人按键，开始
        //=============================================================================================
        //进入状态一玩家开始抢答
        #50
        right_answer=1;
        hardness=1;
        #10 key1=1;
        #10 key1=0;
        #10 key2=1;
        #10 key2=0;
        #10 key3=1;
        #10 key3=0;
        //===============================================================================================
        //进入状态二玩家开始答题
        #50 
        answer=1;
        //===============================================================================================
        //状态三判定阶段
        #50 
        key_host=1;
        #10 key_host=0;
        //===============================================================================================
        key1=0; key2=0; key3=0; key_host=0; hardness=0; answer=0; right_answer=0;
        #50
        right_answer=2;
        hardness=2;
        #10 key2=1;
        #10 key2=0;
        #10 key1=1;
        #10 key1=0;
        #10 key3=1;
        #10 key3=0;
        //===============================================================================================
        //进入状态二玩家开始答题
        #50 
        answer=2;
        //===============================================================================================
        //状态三判定阶段
        #50 
        key_host=1;
        #10 key_host=0;
        //===============================================================================================
        key1=0; key2=0; key3=0; key_host=0; hardness=0; answer=0; right_answer=0;
        #50
        right_answer=1;
        hardness=0;
        #10 key3=1;
        #10 key3=0;
        #10 key1=1;
        #10 key1=0;
        #10 key2=1;
        #10 key2=0;
        //===============================================================================================
        //进入状态二玩家开始答题
        #50 
        answer=1;
        //===============================================================================================
        //状态三判定阶段
        #50 
        key_host=1;
        #10 key_host=0;        
        //状态四结束阶段
    end
    
    Logic_Top top_design(
        .clk(clk),                      //  系统时钟
        .key1(key1),                     //  按键1  or用上位机实现
        .key2(key2),                     //  按键2
        .key3(key3),                     //  
        .key_host(key_host),             //  主持人按钮
        .hardness(hardness),             //  题目难度
        .answer(answer),             //  题目答案
        .right_answer(right_answer),
        . max_problem(max_problem),        //  最大题目数量
        .led1(led1),                    //  输出led1 （对应玩家1抢答成功）
        .led2(led2),                    //   输出led2  (对应玩家2抢答成功)
        .led3(led3),                    //   输出led3  (对应玩家3抢答成功)
        .led_host(led_host),                //   输出led4  (对应主持)
        .show1(show1),
        .show2(show2),
        .show3(show3),
        .show_count(show_count),
        .warning(warning),
        .prob_counter_(prob_counter),
        .status(status)
        );
    always @(*) begin
        #1 clk<=~clk;
    end

endmodule

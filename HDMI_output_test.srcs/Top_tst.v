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
        #5 key_host=0;  // �����˰�������ʼ
        //=============================================================================================
        //����״̬һ��ҿ�ʼ����
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
        //����״̬����ҿ�ʼ����
        #50 
        answer=1;
        //===============================================================================================
        //״̬���ж��׶�
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
        //����״̬����ҿ�ʼ����
        #50 
        answer=2;
        //===============================================================================================
        //״̬���ж��׶�
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
        //����״̬����ҿ�ʼ����
        #50 
        answer=1;
        //===============================================================================================
        //״̬���ж��׶�
        #50 
        key_host=1;
        #10 key_host=0;        
        //״̬�Ľ����׶�
    end
    
    Logic_Top top_design(
        .clk(clk),                      //  ϵͳʱ��
        .key1(key1),                     //  ����1  or����λ��ʵ��
        .key2(key2),                     //  ����2
        .key3(key3),                     //  
        .key_host(key_host),             //  �����˰�ť
        .hardness(hardness),             //  ��Ŀ�Ѷ�
        .answer(answer),             //  ��Ŀ��
        .right_answer(right_answer),
        . max_problem(max_problem),        //  �����Ŀ����
        .led1(led1),                    //  ���led1 ����Ӧ���1����ɹ���
        .led2(led2),                    //   ���led2  (��Ӧ���2����ɹ�)
        .led3(led3),                    //   ���led3  (��Ӧ���3����ɹ�)
        .led_host(led_host),                //   ���led4  (��Ӧ����)
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

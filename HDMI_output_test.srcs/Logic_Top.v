`timescale 1ns / 1ps

module Logic_Top(
    input clk,                      //  ϵͳʱ��
    input key1,                     //  ����1  or����λ��ʵ��
    input key2,                     //  ����2
    input key3,                     //  
    input key_host,                 //  �����˰�ť
    input [1:0] hardness,           //  ��Ŀ�Ѷ�
//    input [2:0] answer,             //  ��Ŀ��
    input [2:0] right_answer,
    input [7:0] max_problem,        //  �����Ŀ����
    output led1,                    //  ���led1 ����Ӧ���1����ɹ���
    output led2,                    //   ���led2  (��Ӧ���2����ɹ�)
    output led3,                    //   ���led3  (��Ӧ���3����ɹ�)
    output led_host,                //   ���led4  (��Ӧ����)
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
    wire p1,p2,p3,h0;  //  �����ź�
    wire [2:0] index;  //  ��һλ�����������ɹ�����
    wire mark;         //  ȷ������������ 
    wire game_start;   //  ��Ϸ��ʼ 000
    wire warn;         // 60 s�����ľ���
    wire count1;      // ��Ŀ��ʾ����ơ����� 001
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
    // ״̬���л�����
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
    
    
    Key_Store k1( //��������
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
     
     CtrlLogic cl(  //����˭������
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
                   .player(index),                     //���𵽵��Ǹ�ѡ��
                   .Isright((right_answer==answer)),                         // �����Ƿ���ȷ
                   .rst(count01),                             // ͬ������
                   .clk(clk),                          // ʱ��
                   .hard(hardness),                    //  �Ѷȣ���Ϊ�򵥣��еȣ���
                   .set(count53),                             //������Ŀ���꣬���Խ��мӼ���
                   .score1_out(show1),
                   .score2_out(show2),
                   .score3_out(show3)
                   );    

    counter_60 c60(
        .rst(count31||count4),   //����ʱ��(���л���Ŀʱ��������)
        .clk(clk),     //ϵͳʱ��
        .start(count25),
        .ender(count53),
        .showing(show_count),
        .warning(warn) //����
        );
    
    
    initial begin
        counter=0;
    end
    
endmodule

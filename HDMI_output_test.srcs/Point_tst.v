`timescale 1ns / 1ps


module Point_tst();
    reg [2:0] player;
    reg Isright;
    reg rst;
    reg clk;
    reg [1:0] hard;
    reg set;
    wire [10:0] score1_out;
    wire [10:0] score2_out;
    wire [10:0] score3_out;
    
    
    initial begin
        clk=0; player=0;Isright=0;
        rst=0;hard=0; set=0;
        #50 rst=1;
        #5 rst=0;
        #50 player=2;
        #5 Isright=1; hard=1;
        #5 set=1;
        #100 set=0;
        
        #100
        #50 player=1;
        #5 Isright=1; hard=2;
        #5 set=1;
        #100 set=0;
        
        #100
        #50 player=2;
        #5 Isright=0; hard=2;
        #5 set=1;
        #100 set=0;
    end
    
    
     Point_adder pad(
           .player(player),       //���𵽵��Ǹ�ѡ��
           .Isright(Isright),            // �����Ƿ���ȷ
           .rst(rst),                // ͬ������
           .clk(clk),                // ʱ��
           .hard(hard),         //  �Ѷȣ���Ϊ�򵥣��еȣ���
           .set(set),                //������Ŀ���꣬���Խ��мӼ���
           .score1_out(score1_out),
           .score2_out(score2_out),
           .score3_out(score3_out)
   );
    
    always @(*) begin
        #1 clk<=~clk;
    end
    
endmodule

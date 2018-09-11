`timescale 1ns / 1ps




module counter_60(
    input rst,   //����ʱ��
    input clk,   //ϵͳʱ��
    //input clk2,  //1s��ʱ������
    input start,
    input ender,
    output [8:0] showing,
    output warning //����
    );
    parameter CLOCK_COUNT=30000000;  //50MHz->1Hz
    //��һ������ʱʱ�ӣ������ǣ�������ʼ��ʱ�򡾼�player���¼�������ʼ����ʱ����60��ʼ������
    //��60�������ʱ�򣬾����������60��û�������ʱ�������⣬��ô��Ļ�Ϻ㶨��ʾΪ��ʱ��
    //ֱ����һ����Ŀ�ĳ��֣�����ʱ����
    
    reg [25:0] clock_counter;
    reg [8:0] count;
    reg IsStart;  // ���ֵΪ1����ʼ�����ֵΪ0����ر�
    reg warning_;  //�����Ĵ���������ʱ����һ��
    
    assign showing = count;
    assign warning = warning_;
    
    initial begin
        count=0;
        clock_counter=0;
        IsStart=0;
        warning_=0;
    end
    
    always @(posedge clk) begin
        // �ڶ���ʱ��
        if (IsStart==1) begin
            clock_counter<=clock_counter+1;
            if(clock_counter>=CLOCK_COUNT) begin
                count<=count-1;
                clock_counter<=0;
                if(count==1) begin
                    IsStart<=0;
                    warning_<=1;
                    clock_counter<=0;
                end
            end
        end
    
        if(warning_==1) begin
            //����1s�ı���
            clock_counter<=clock_counter+1;
            if(clock_counter==CLOCK_COUNT) begin
                warning_<=0;
            end
        end
   //һ����ʼ�źű����£��Ϳ�ʼ��ʱ
   
        if(start==0&&ender==1) begin
            IsStart<=0;
        end
        if(start==1) begin
            IsStart<=1;
        end
        
      

        if(rst==1) begin
            count<=60;
            IsStart<=0;
            warning_<=0;
            clock_counter<=0;
        end
    end
    
    
    
endmodule

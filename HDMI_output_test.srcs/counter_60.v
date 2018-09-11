`timescale 1ns / 1ps




module counter_60(
    input rst,   //重置时钟
    input clk,   //系统时钟
    //input clk2,  //1s的时钟周期
    input start,
    input ender,
    output [8:0] showing,
    output warning //警报
    );
    parameter CLOCK_COUNT=30000000;  //50MHz->1Hz
    //做一个倒计时时钟，功能是，当抢答开始的时候【即player按下键】，开始倒计时，从60开始倒数，
    //当60秒数完的时候，警报响起，如果60秒没有数完的时候答完该题，那么屏幕上恒定显示为该时间
    //直到下一个题目的出现，倒计时重置
    
    reg [25:0] clock_counter;
    reg [8:0] count;
    reg IsStart;  // 如果值为1，则开始，如果值为0，则关闭
    reg warning_;  //警报寄存器，报警时持续一秒
    
    assign showing = count;
    assign warning = warning_;
    
    initial begin
        count=0;
        clock_counter=0;
        IsStart=0;
        warning_=0;
    end
    
    always @(posedge clk) begin
        // 第二个时钟
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
            //持续1s的报警
            clock_counter<=clock_counter+1;
            if(clock_counter==CLOCK_COUNT) begin
                warning_<=0;
            end
        end
   //一旦开始信号被按下，就开始计时
   
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

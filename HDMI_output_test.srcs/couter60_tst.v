`timescale 1ns / 1ps



module couter60_tst();
    reg p1;
    reg p2;
    reg p3;
    reg count31;
    reg clk;
    wire [2:0] index;
    wire mark;
    
    initial begin
        clk=0;
        p1=0;
        p2=0;
        p3=0;
        count31=0;
        // 初始化, 后来仿真数据传输过程
        #500 count31=1;
        #500 count31=0;
        #100 p1=1;
        #200 p2=1;
        #300 p3=1;
        #500 p1=0;p2=0;p3=0;
        #5000 count31=1;
        #500 count31=0;
        #100 p2=1;
        #200 p1=1;
        #300 p3=1;
    end
    
    always begin
        #50
        clk<=~clk;
    end
    
    
    
     CtrlLogic cl(  //看看谁先抢到
           .p1(p1),
           .p2(p2),
           .p3(p3),
           .h0(count31),
           .clk(clk),
           .index(index),
           .marked(mark)
           );


endmodule

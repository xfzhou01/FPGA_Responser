`timescale 1ps / 1ps

module Counter_tst2();
    reg rst;
    reg clk;
    reg start;
    wire [8:0] showing;
    wire warning;
    parameter CLOCK_COUNT=5;  
    //parameter CLOCK_COUNT=50000000;  //50MHz->1Hz
    
    initial begin
        rst=0;
        clk=0;
        start=0;
        ////////initialize  
        #50 rst=1;
        #50 rst=0;
        #500 start=1;
        #50 start=0;
    end
    
    counter_60 c60(
        .rst(rst),   //重置时钟
        .clk(clk),   //系统时钟
        //input clk2,  //1s的时钟周期
        .start(start),
        .showing(showing),
        .warning(warning) //警报
        );
    
    always begin
        #1 clk<=~clk;
    end
    
endmodule

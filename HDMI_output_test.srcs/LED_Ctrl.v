`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/23 15:15:34
// Design Name: 
// Module Name: LED_Ctrl
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


module LED_Ctrl(
    input [2:0] index,
    input host,
    input rst,
    input clk,
    output host_1,
    output player1,
    output player2,
    output player3
    );
    // host 表示主持人亮的灯
    // 主持人按下后，主持人灯亮，同时允许抢答
    // 另外有一个rst信号，不受任何人控制，指在一道题答完之后，清除所有灯亮，【但是这时候ctrl logic模块相应信号没有清除】
    reg host1,p1,p2,p3;  //代表四盏灯亮灭
    
    assign host_1=host1;
    assign player1=p1;
    assign player2=p2;
    assign player3=p3;
    
    initial begin   
        host1=0;
        p1=0;
        p2=0;
        p3=0;
    end 
    //intialize hoster and 3 players 

    
    always @(posedge clk) begin
         if(rst==1'b1) begin
                host1<=0;
                p1<=0;
                p2<=0;
                p3<=0;
         end 
        if(host==1'b1) begin
                host1<=0;
        end
        if(index==3'b000) begin
            //index = 0, 表示主持人刚刚按下抢答键
            p1<=0; p2<=0; p3<=0;
        end
        if(index==3'b001) begin
            p1<=1; p2<=0; p3<=0;
        end
        if(index==3'b010) begin
            p1<=0; p2<=1; p3<=0;
        end
        if(index==3'b011) begin
            p1<=0; p2<=0;p3<=1;
        end
    end
    
    
    
endmodule

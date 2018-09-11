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
           .player(player),       //抢答到的那个选手
           .Isright(Isright),            // 抢答是否正确
           .rst(rst),                // 同步清零
           .clk(clk),                // 时钟
           .hard(hard),         //  难度，分为简单，中等，难
           .set(set),                //代表题目答完，可以进行加减分
           .score1_out(score1_out),
           .score2_out(score2_out),
           .score3_out(score3_out)
   );
    
    always @(*) begin
        #1 clk<=~clk;
    end
    
endmodule

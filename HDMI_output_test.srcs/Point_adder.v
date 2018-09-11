`timescale 1ns / 1ps

// The module for add points



module Point_adder(
    input [2:0] player,       //抢答到的那个选手
    input Isright,            // 抢答是否正确
    input rst,                // 同步清零
    input clk,                // 时钟
    input [1:0] hard,         //  难度，分为简单，中等，难
    input set,                //代表题目答完，可以进行加减分
    output [10:0] score1_out,
    output [10:0] score2_out,
    output [10:0] score3_out
    );
    
    localparam SIMPLE=5;
    localparam MIDIUM=10;
    localparam HARD=20;
    
    reg setter;
    reg [10:0] score1,score2,score3;
    
    assign score1_out=score1;
    assign score2_out=score2;
    assign score3_out=score3;
    
    initial begin
        score1=0; score2=0; score3=0;
    end
    
    
  //  always @(posedge set) begin
   //     if(set==1) begin
   //         setter<=1;
   //     end
   // end
    
    always @(posedge clk) begin
        if(rst==1'b1) begin
            score1<=0;
            score2<=0;
            score3<=0;
            setter<=1'b0;
        end
    
         if (set==1'b1) begin
            if(player==3'b001) begin
                //如果第一个选手ok
                if (Isright==1'b1) begin 
                    if(hard==2'b00) begin
                        score1<=score1+SIMPLE;
                    end
                    if(hard==2'b01) begin
                        score1<=score1+MIDIUM;
                    end
                    if(hard==2'b10) begin
                       score1<=score1+HARD;
                    end
                end                                       
                else begin
                    if(hard==2'b00) begin
                        score1<=((score1-SIMPLE)>1000)?0:(score1-SIMPLE);
                    end
                    if(hard==2'b01) begin
                        score1<=((score1-MIDIUM)>1000)?0:(score1-MIDIUM);
                    end
                    if(hard==2'b10) begin
                        score1<=((score1-HARD)>1000)?0:(score1-HARD);                  
                    end
                 end
            end
            if(player==3'b010) begin
                //如果第一个选手ok
                if (Isright==1'b1) begin 
                    if(hard==2'b00) begin
                        score2<=score2+SIMPLE;
                    end
                    if(hard==2'b01) begin
                        score2<=score2+MIDIUM;
                    end
                    if(hard==2'b10) begin
                       score2<=score2+HARD;
                    end
                end                                       
                else begin
                    if(hard==2'b00) begin
                        score2<=((score2-SIMPLE)>1000)?0:(score2-SIMPLE);
                    end
                    if(hard==2'b01) begin
                        score2<=((score2-MIDIUM)>1000)?0:(score2-MIDIUM);
                    end
                    if(hard==2'b10) begin
                        score2<=((score2-HARD)>1000)?0:(score2-HARD);                  
                    end
                 end
            end            
            if(player==3'b011) begin
                //如果第一个选手ok
                if (Isright==1'b1) begin 
                    if(hard==2'b00) begin
                        score3<=score3+SIMPLE;
                    end
                    if(hard==2'b01) begin
                        score3<=score3+MIDIUM;
                    end
                    if(hard==2'b10) begin
                       score3<=score3+HARD;
                    end
                end                                       
                else begin
                    if(hard==2'b00) begin
                        score3<=((score3-SIMPLE)>1000)?0:(score3-SIMPLE);
                    end
                    if(hard==2'b01) begin
                        score3<=((score3-MIDIUM)>1000)?0:(score3-MIDIUM);
                    end
                    if(hard==2'b10) begin
                        score3<=((score3-HARD)>1000)?0:(score3-HARD);                  
                    end
                 end
            end                        
            setter<=1'b0;
         end
    end
    
    
    
    
endmodule

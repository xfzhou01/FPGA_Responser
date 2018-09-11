`timescale 1ns / 1ps

module CtrlLogic(
    input p1,
    input p2,
    input p3,
    input h0,
    input clk,
    output [2:0] index,
    output marked
    ); 
    
    //主持人的输入作为rest 信号，清除抢答结果
    reg mark;
    reg [2:0] indi;
    
    assign index=indi;
    assign marked=mark;
    
    initial begin
        mark=0;
        indi=0;
    end
    
    always @(posedge clk) begin
       if (mark==1'b0) begin
            if(p1==1) begin
                indi<=3'b001;
                mark<=1'b1;
            end
            if(p2==1'b1) begin
                indi<=3'b010;
                mark<=1'b1;
            end  
            if(p3==1'b1) begin
                indi<=3'b011;
                mark<=1'b1;
            end                     
       end
       if(h0==1'b1) begin
            indi<=3'b000;
            mark<=1'b0;
        end
    end
    
    
endmodule

`timescale 1ns / 1ps


module JudgeHighest(
    input [10:0] score1,
    input [10:0] score2,
    input [10:0] score3,
    output [7:0] ASC_Winner,
    output [7:0] shigh1,
    output [7:0] shigh2,
    output [7:0] shigh3,
    output [7:0] shigh4
    );
    
    wire high1,high2,high3;
    wire [10:0] bonus;
    
    assign high1=(score1>=score2)&&(score1>=score3);
    assign high2=(score2>=score1)&&(score2>=score3);
    assign high3=(score3>=score1)&&(score3>=score1);
    
    assign ASC_Winner=(high1)?(8'd17):((high2)?(8'd18):((high3)?(8'd19):(0)));
    assign bonus=(high1)?(score1):((high2)?(score2):((high3)?(score3):(0)));
    
    Score2ASC scb(
        .score1(bonus),
        .ASC1(shigh1),
        .ASC2(shigh2),
        .ASC3(shigh3),
        .ASC4(shigh4)
        );
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/09 23:53:11
// Design Name: 
// Module Name: Score2ASC
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


module Score2ASC(
    input [10:0] score1,
    output [7:0] ASC1,
    output [7:0] ASC2,
    output [7:0] ASC3,
    output [7:0] ASC4
    );
    
    assign ASC4=(score1%10)+16;
    assign ASC3=((score1/10)%10)+16;
    assign ASC2=((score1/100)%10)+16;
    assign ASC1=((score1/1000))+16;
    
endmodule

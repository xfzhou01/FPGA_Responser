`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/09 22:10:43
// Design Name: 
// Module Name: CounterToAscii
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


module CounterToAscii(
    input [8:0] counter_time,
    output [7:0] ASC1,
    output [7:0] ASC2
    );
    
    assign ASC1=(counter_time/10)+16;
    assign ASC2=(counter_time%10)+16;

    // 这里的ASC不是ASCII码，是可以用来显示的东西。
endmodule

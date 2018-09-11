`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/09/10 14:17:52
// Design Name: 
// Module Name: Trans
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


module Trans(
    input p1,
    input p2,
    input p3,
    input h0,
    input [2:0] count,
    output [2:0] answer
    );
    
    assign answer=(count==5)?((p1==1)?(3'b001):((p2==1)?(3'b010):((p3==1)?(3'b011):((h0==1)?(3'b000):(0))))):(0);
    
    
endmodule

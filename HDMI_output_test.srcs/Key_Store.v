`timescale 1ns / 1ps


module Key_Store( //°´¼üÏû¶¶
    input key1,
    input key2,
    input key3,
    input key_main,
    input clk,
    output p1,
    output p2,
    output p3,
    output h0
    );
    
    reg player1,player2,player3,host;
    
    always@(posedge clk) begin
        player1<=(!key1);
        player2<=(!key2);
        player3<=(!key3);
        host<=(!key_main);
    end
    
    assign p1=player1;
    assign p2=player2;
    assign p3=player3;
    assign h0=host;
    
endmodule

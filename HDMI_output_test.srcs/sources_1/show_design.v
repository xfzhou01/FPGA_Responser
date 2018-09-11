
module show_design(
    input [239:0] Title,   // LINE1
    input [239:0] Ansa,    // LINE2
    input [239:0] Ansb,    // 3
    input [239:0] Ansc,    // 4
    input [239:0] Ansd,    // 5
    input [8:0] counter_time,
    input [10:0] score1,     //P1_Score: 
    input [10:0] score2,
    input [10:0] score3,
    input key1,
    input key2,
    input key3,
    input key_host,
    input warning,
	input clk,            
	input rst,            
	output hs,            
	output vs,            
	output de,            
	output[7:0] rgb_r,   
	output[7:0] rgb_g,    
	output[7:0] rgb_b    
);

reg [239:0] line_score1;
reg [239:0] line_score2;
reg [239:0] line_score3;
reg [239:0] highest;
reg [239:0] counter;
reg [239:0] led_replace;
wire [7:0] w11,w12,w13,w14,w21,w22,w23,w24,w31,w32,w33,w34,ASC_Winner,shigh1,shigh2,shigh3,shigh4,counter1,counter2;
always @(posedge clk) begin
    line_score1[7:0]<=8'd48;  //P
    line_score1[15:8]<=8'd17;//1
    line_score1[23:16]<=8'd0;//S
    line_score1[31:24]<=8'd51;//c
    line_score1[39:32]<=8'd67;//o
    line_score1[47:40]<=8'd79;//o
    line_score1[55:48]<=8'd82;//r
    line_score1[63:56]<=8'd69;//e
    line_score1[71:64]<=8'd0;//e
    // 64-71 72-79 80-87 88-95
    line_score1[79:72]<=w11;
    line_score1[87:80]<=w12;
    line_score1[95:88]<=w13;
    line_score1[103:96]<=w14;
    line_score1[239:104]<=0;
end

always @(posedge clk) begin
    line_score2[7:0]<=8'd48;  //P
    line_score2[15:8]<=8'd18;//1
    line_score2[23:16]<=8'd0;//S
    line_score2[31:24]<=8'd51;//c
    line_score2[39:32]<=8'd67;//o
    line_score2[47:40]<=8'd79;//o
    line_score2[55:48]<=8'd82;//r
    line_score2[63:56]<=8'd69;//e
    line_score2[71:64]<=8'd0;//e
    // 64-71 72-79 80-87 88-95
    line_score2[79:72]<=w21;
    line_score2[87:80]<=w22;
    line_score2[95:88]<=w23;
    line_score2[103:96]<=w24;
    line_score2[239:104]<=0;
end

always @(posedge clk) begin
    line_score3[7:0]<=8'd48;  //P
    line_score3[15:8]<=8'd19;//1
    line_score3[23:16]<=8'd0;//S
    line_score3[31:24]<=8'd51;//c
    line_score3[39:32]<=8'd67;//o
    line_score3[47:40]<=8'd79;//o
    line_score3[55:48]<=8'd82;//r
    line_score3[63:56]<=8'd69;//e
    line_score3[71:64]<=8'd0;//e
    // 64-71 72-79 80-87 88-95
    line_score3[79:72]<=w31;
    line_score3[87:80]<=w32;
    line_score3[95:88]<=w33;
    line_score3[103:96]<=w34;
    line_score3[239:104]<=0;
end

always @(posedge clk) begin
    counter[7:0]<=8'd35;  //P
    counter[15:8]<=8'd79;//1
    counter[23:16]<=8'd85;//S
    counter[31:24]<=8'd78;//c
    counter[39:32]<=8'd84;//o
    counter[47:40]<=8'd69;//o
    counter[55:48]<=8'd82;//r
    counter[63:56]<=8'd0;//e
    counter[71:64]<=8'd0;//e
    // 64-71 72-79 80-87 88-95
    counter[79:72]<=counter1;
    counter[87:80]<=counter2;
    counter[239:88]<=0;    
end

always @(posedge clk) begin
    highest[7:0]<=8'd40;  //H
    highest[15:8]<=8'd73;//i
    highest[23:16]<=8'd71;//g
    highest[31:24]<=8'd72;//h
    highest[39:32]<=8'd69;//e
    highest[47:40]<=8'd83;//s
    highest[55:48]<=8'd84;//t
    highest[63:56]<=8'd0;// 
    // 64-71 72-79 80-87 88-95
    highest[71:64]<=8'd48;// P
    highest[79:72]<=ASC_Winner; //1 or 2 or 3
    highest[87:80]<=0;
    highest[95:88]<=0;
    highest[103:96]<=shigh1;    
    highest[111:104]<=shigh2;    
    highest[119:112]<=shigh3;    
    highest[239:120]<=shigh4;    
end



always @(posedge clk) begin 
    if(key1==1) begin
        led_replace[7:0]<=8'd95;
        led_replace[15:8]<=8'd95;
        led_replace[23:16]<=8'd95;
        led_replace[31:24]<=8'd95;
        led_replace[39:32]<=8'd95;
        led_replace[47:40]<=8'd95;
    end
    if(key1==0) begin
        led_replace[47:0]<=0;
    end
    if(key2==1) begin
        led_replace[55:48]<=8'd95;
        led_replace[63:56]<=8'd95;
        led_replace[71:64]<=8'd95;
        led_replace[79:72]<=8'd95;
        led_replace[87:80]<=8'd95;
        led_replace[95:88]<=8'd95;
    end
    if(key2==0) begin
        led_replace[95:48]<=0;
    end    
    if(key3==1) begin
        led_replace[103:96]<=8'd95;
        led_replace[111:104]<=8'd95;
        led_replace[119:112]<=8'd95;
        led_replace[127:120]<=8'd95;
        led_replace[135:128]<=8'd95;
        led_replace[143:136]<=8'd95;
    end    
    if(key3==0) begin
        led_replace[143:96]<=0;
    end 
    if(key_host==1) begin
        led_replace[151:144]<=8'd95;
        led_replace[159:152]<=8'd95;
        led_replace[167:160]<=8'd95;
        led_replace[175:168]<=8'd95;
        led_replace[183:176]<=8'd95;
        led_replace[191:184]<=8'd95;
    end   
    if(key_host==0) begin
        led_replace[191:144]<=0;
    end 
    if(warning==1) begin
        led_replace[199:192]<=8'd95;
        led_replace[207:200]<=8'd95;
        led_replace[215:208]<=8'd95;
        led_replace[223:216]<=8'd95;
        led_replace[231:224]<=8'd95;
        led_replace[239:232]<=8'd95;
    end     
    if(warning==0) begin
        led_replace[239:192]<=0;
    end    
end
Score2ASC sc1(
    .score1(score1),
    .ASC1(w11),
    .ASC2(w12),
    .ASC3(w13),
    .ASC4(w14)
    );
Score2ASC sc2(
        .score1(score2),
        .ASC1(w21),
        .ASC2(w22),
        .ASC3(w23),
        .ASC4(w24)
        );
Score2ASC sc3(
        .score1(score3),
        .ASC1(w31),
        .ASC2(w32),
        .ASC3(w33),
        .ASC4(w34)
        );              

JudgeHighest jh(
    .score1(score1),
    .score2(score2),
    .score3(score3),
    .ASC_Winner(ASC_Winner),
    .shigh1(shigh1),
    .shigh2(shigh2),
    .shigh3(shigh3),
    .shigh4(shigh4)
    );
CounterToAscii c2a(
        .counter_time(counter_time),
        .ASC1(counter1),
        .ASC2(counter2)
        );
parameter H_ACTIVE = 16'd480;
parameter H_FP = 16'd88;
parameter H_SYNC = 16'd44;
parameter H_BP = 16'd148; 
parameter V_ACTIVE = 16'd360;
parameter V_FP 	= 16'd4;
parameter V_SYNC  = 16'd5;
parameter V_BP	= 16'd36;
parameter H_TOTAL = H_ACTIVE + H_FP + H_SYNC + H_BP;
parameter V_TOTAL = V_ACTIVE + V_FP + V_SYNC + V_BP;

reg hs_reg;
reg vs_reg;
reg hs_reg_d0;
reg vs_reg_d0;
reg[11:0] h_cnt;
reg [11:0] h_cnt_next;
reg[11:0] v_cnt;
reg [11:0] v_cnt_next;
reg[11:0] active_x;
reg [11:0] next_x;
reg[11:0] active_y;
reg[11:0] next_y;
reg[7:0] rgb_r_reg;
reg[7:0] rgb_g_reg;
reg[7:0] rgb_b_reg;
reg h_active;
reg v_active;
wire video_active;
reg video_active_d0;
assign hs = hs_reg_d0;
assign vs = vs_reg_d0;
assign video_active = h_active & v_active;
assign de = video_active_d0;
assign rgb_r = rgb_r_reg;
assign rgb_g = rgb_g_reg;
assign rgb_b = rgb_b_reg;
always@(posedge clk or posedge rst)
begin
	if(rst)
		begin
			hs_reg_d0 <= 1'b0;
			vs_reg_d0 <= 1'b0;
			video_active_d0 <= 1'b0;
		end
	else
		begin
			hs_reg_d0 <= hs_reg;
			vs_reg_d0 <= vs_reg;
			video_active_d0 <= video_active;
		end
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		h_cnt <= 12'd0;
	else if(h_cnt == H_TOTAL - 1)
		h_cnt <= 12'd0;
	else
		h_cnt <= h_cnt + 12'd1;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		h_cnt_next <= 12'd1;
	else if(h_cnt_next == H_TOTAL - 1)
		h_cnt_next <= 12'd0;
	else
		h_cnt_next <= h_cnt_next + 12'd1;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		active_x <= 12'd0;
	else if(h_cnt >= H_FP + H_SYNC + H_BP - 1)
		active_x <= h_cnt - (H_FP[11:0] + H_SYNC[11:0] + H_BP[11:0] - 12'd1);
	else
		active_x <= active_x;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		active_y <= 12'd0;
	else if((v_cnt >= V_FP + V_SYNC + V_BP - 1)&&(h_cnt == H_FP + H_SYNC + H_BP - 1))
		active_y <= v_cnt - (V_FP[11:0] + V_SYNC[11:0] + V_BP[11:0] - 12'd1);
	else
		active_y <= active_y;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		next_x <= 12'd1;
	else if(h_cnt_next >= H_FP + H_SYNC + H_BP - 1)
		next_x <= h_cnt_next - (H_FP[11:0] + H_SYNC[11:0] + H_BP[11:0] - 12'd1);
	else
		next_x <= next_x;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		next_y <= 12'd0;
	else if(v_cnt_next >= V_FP + V_SYNC + V_BP - 1)
		next_y <= next_y - (V_FP[11:0] + V_SYNC[11:0] + V_BP[11:0] - 12'd1);
	else
		next_y <= next_y;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		v_cnt <= 12'd0;
	else if(h_cnt == H_FP  - 1)
		if(v_cnt == V_TOTAL - 1)
			v_cnt <= 12'd0;
		else
			v_cnt <= v_cnt + 12'd1;
	else
		v_cnt <= v_cnt;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		v_cnt_next <= 12'd0;
	else if(h_cnt_next == H_FP  - 1)
		if(v_cnt_next == V_TOTAL - 1)
			v_cnt_next <= 12'd0;
		else
			v_cnt_next <= v_cnt_next + 12'd1;
	else
		v_cnt_next <= v_cnt_next;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		hs_reg <= 1'b0;
	else if(h_cnt == H_FP - 1)
		hs_reg <= 1'b1;
	else if(h_cnt == H_FP + H_SYNC - 1)
		hs_reg <= 1'b0;
	else
		hs_reg <= hs_reg;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		h_active <= 1'b0;
	else if(h_cnt == H_FP + H_SYNC + H_BP - 1)
		h_active <= 1'b1;
	else if(h_cnt == H_TOTAL - 1)
		h_active <= 1'b0;
	else
		h_active <= h_active;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		vs_reg <= 1'd0;
	else if((v_cnt == V_FP - 1) && (h_cnt == H_FP - 1))
		vs_reg <= 1'b1;
	else if((v_cnt == V_FP + V_SYNC - 1) && (h_cnt == H_FP - 1))
		vs_reg <= 1'b0;	
	else
		vs_reg <= vs_reg;
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		v_active <= 1'd0;
	else if((v_cnt == V_FP + V_SYNC + V_BP - 1) && (h_cnt == H_FP - 1))
		v_active <= 1'b1;
	else if((v_cnt == V_TOTAL - 1) && (h_cnt == H_FP - 1))
		v_active <= 1'b0;	
	else
		v_active <= v_active;
end
wire [511:0] code;
wire [6:0] px,py,npx,npy,left_dist,up_dist,up_dist2;
reg [7:0] ASCII2;
wire [7:0] final;
assign px=active_x/16;
assign py=active_y/32; //ȡxiayige
assign npx=active_x/16;
assign npy=active_y/32;
assign left_dist=active_x-(npx*16);
assign up_dist=active_y-(npy*32);
assign up_dist2=(up_dist>=16)?(up_dist-16):(up_dist+16);
assign final=(code[(up_dist2*16+(16-left_dist))]==1)?0:255;

always @(py or px) begin
    if(py==0) begin
        ASCII2[7]<=Title[px*8+7];
        ASCII2[6]<=Title[px*8+6];
        ASCII2[5]<=Title[px*8+5];
        ASCII2[4]<=Title[px*8+4];
        ASCII2[3]<=Title[px*8+3];
        ASCII2[2]<=Title[px*8+2];
        ASCII2[1]<=Title[px*8+1];
        ASCII2[0]<=Title[px*8+0];
    end
    if(py==1) begin
        ASCII2[7]<=Ansa[px*8+7];
        ASCII2[6]<=Ansa[px*8+6];
        ASCII2[5]<=Ansa[px*8+5];
        ASCII2[4]<=Ansa[px*8+4];
        ASCII2[3]<=Ansa[px*8+3];
        ASCII2[2]<=Ansa[px*8+2];
        ASCII2[1]<=Ansa[px*8+1];
        ASCII2[0]<=Ansa[px*8+0];                
    end //Ansb
    if(py==2) begin
        ASCII2[7]<=Ansb[px*8+7];
        ASCII2[6]<=Ansb[px*8+6];
        ASCII2[5]<=Ansb[px*8+5];
        ASCII2[4]<=Ansb[px*8+4];
        ASCII2[3]<=Ansb[px*8+3];
        ASCII2[2]<=Ansb[px*8+2];
        ASCII2[1]<=Ansb[px*8+1];
        ASCII2[0]<=Ansb[px*8+0];                    
    end //Ansc
    if(py==3) begin
        ASCII2[7]<=Ansc[px*8+7];
        ASCII2[6]<=Ansc[px*8+6];
        ASCII2[5]<=Ansc[px*8+5];
        ASCII2[4]<=Ansc[px*8+4];
        ASCII2[3]<=Ansc[px*8+3];
        ASCII2[2]<=Ansc[px*8+2];
        ASCII2[1]<=Ansc[px*8+1];
        ASCII2[0]<=Ansc[px*8+0];                        
    end //Ansd
    if(py==4) begin
        ASCII2[7]<=Ansd[px*8+7];
        ASCII2[6]<=Ansd[px*8+6];
        ASCII2[5]<=Ansd[px*8+5];
        ASCII2[4]<=Ansd[px*8+4];
        ASCII2[3]<=Ansd[px*8+3];
        ASCII2[2]<=Ansd[px*8+2];
        ASCII2[1]<=Ansd[px*8+1];
        ASCII2[0]<=Ansd[px*8+0];                     
    end
    if(py==5) begin
        ASCII2[7]<=line_score1[px*8+7];
        ASCII2[6]<=line_score1[px*8+6];
        ASCII2[5]<=line_score1[px*8+5];
        ASCII2[4]<=line_score1[px*8+4];
        ASCII2[3]<=line_score1[px*8+3];
        ASCII2[2]<=line_score1[px*8+2];
        ASCII2[1]<=line_score1[px*8+1];
        ASCII2[0]<=line_score1[px*8+0];      
    end  //line_score2
    if(py==6) begin
        ASCII2[7]<=line_score2[px*8+7];
        ASCII2[6]<=line_score2[px*8+6];
        ASCII2[5]<=line_score2[px*8+5];
        ASCII2[4]<=line_score2[px*8+4];
        ASCII2[3]<=line_score2[px*8+3];
        ASCII2[2]<=line_score2[px*8+2];
        ASCII2[1]<=line_score2[px*8+1];
        ASCII2[0]<=line_score2[px*8+0];                    
    end  //line_score3
    if(py==7) begin
        ASCII2[7]<=line_score3[px*8+7];
        ASCII2[6]<=line_score3[px*8+6];
        ASCII2[5]<=line_score3[px*8+5];
        ASCII2[4]<=line_score3[px*8+4];
        ASCII2[3]<=line_score3[px*8+3];
        ASCII2[2]<=line_score3[px*8+2];
        ASCII2[1]<=line_score3[px*8+1];
        ASCII2[0]<=line_score3[px*8+0];                    
    end
    if(py==8) begin
        ASCII2[7]<=highest[px*8+7];
        ASCII2[6]<=highest[px*8+6];
        ASCII2[5]<=highest[px*8+5];
        ASCII2[4]<=highest[px*8+4];
        ASCII2[3]<=highest[px*8+3];
        ASCII2[2]<=highest[px*8+2];
        ASCII2[1]<=highest[px*8+1];
        ASCII2[0]<=highest[px*8+0];                    
    end
    if(py==9) begin
        ASCII2[7]<=counter[px*8+7];
        ASCII2[6]<=counter[px*8+6];
        ASCII2[5]<=counter[px*8+5];
        ASCII2[4]<=counter[px*8+4];
        ASCII2[3]<=counter[px*8+3];
        ASCII2[2]<=counter[px*8+2];
        ASCII2[1]<=counter[px*8+1];
        ASCII2[0]<=counter[px*8+0];    
    end
    if(py==10) begin
        ASCII2[7]<=led_replace[px*8+7];
        ASCII2[6]<=led_replace[px*8+6];
        ASCII2[5]<=led_replace[px*8+5];
        ASCII2[4]<=led_replace[px*8+4];
        ASCII2[3]<=led_replace[px*8+3];
        ASCII2[2]<=led_replace[px*8+2];
        ASCII2[1]<=led_replace[px*8+1];
        ASCII2[0]<=led_replace[px*8+0];    
    end
end

always@(posedge clk or posedge rst)
begin
	if(rst)
		begin
            rgb_r_reg <= 8'h00;
            rgb_g_reg <= 8'h00;
            rgb_b_reg <= 8'h00;
		end
	else if(video_active)
        begin
            rgb_r_reg <= final;
            rgb_g_reg <= final;
            rgb_b_reg <= final;

        end		
	else
		begin
			rgb_r_reg <= 8'h00;
			rgb_g_reg <= 8'h00;
			rgb_b_reg <= 8'h00;
		end
end
r1_wrapper rwp
   (.a_0(ASCII2),
    .spo_0(code));


endmodule 
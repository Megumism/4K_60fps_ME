`timescale 1ns/1ps
module result(sad,inx,iny,en,rst_n,clk,sad_out,x_out,y_out,sign_sad);
input [13:0]sad;
input rst_n;
input signed [3:0]inx;
input signed [3:0]iny;
input clk;
input en;
output sad_out;
output x_out;
output y_out;
output sign_sad;
reg [13:0]buf_sad;
reg signed [3:0]buf_x,buf_y;
reg sign_sad,sign_y,sign_x;
reg [3:0]count_bf_sad;
reg [1:0]count_bf_xy;
reg sad_reg,x_reg,y_reg;

////////////////////OUTPUT//////////////////////////

assign sad_out = sad_reg;
assign x_out = x_reg;
assign y_out = y_reg;

////////////////////INPUT//////////////////////////

always @(posedge clk or negedge rst_n) begin//buf_y
    if(!rst_n)begin
        buf_y <= 0;
    end
    else begin
        if(en) begin
            buf_y <= iny-7;
        end
        else begin
            buf_y <= buf_y;
        end
    end
end

always @(posedge clk or negedge rst_n) begin//buf_sad
    if(!rst_n)begin
        buf_sad <= 0;
    end
    else begin
        if(en) begin
            buf_sad <= sad;
        end
        else begin
            buf_sad <= buf_sad;
        end
    end
end
always @(posedge clk or negedge rst_n) begin//buf_x
    if(!rst_n)begin
        buf_x <= 0;
    end
    else begin
        if(en) begin
            buf_x <= inx-7;
        end
        else begin
            buf_x <= buf_x;
        end
    end
end

////////////////////OUTPUT BUFFER//////////////////////////

always @(posedge clk or negedge rst_n) begin//sad_reg
    if(!rst_n)begin
        sad_reg <= 0;
    end
    else begin
        if(sign_sad) begin
            sad_reg <= buf_sad[count_bf_sad];
        end
        else begin
            sad_reg <= sad_reg;
        end
    end
end

always @(posedge clk or negedge rst_n) begin//x_reg
    if(!rst_n)begin
        x_reg <= 0;
    end
    else begin
        if(sign_x) begin
            x_reg <= buf_x[count_bf_xy];
        end
        else begin
            x_reg <= x_reg;
        end
    end
end

always @(posedge clk or negedge rst_n) begin//y_reg
    if(!rst_n)begin
        y_reg <= 0;
    end
    else begin
        if(sign_y) begin
            y_reg <= buf_y[count_bf_xy];
        end
        else begin
            y_reg <= y_reg;
        end
    end
end

////////////////////COUNTER//////////////////////////

always@(posedge clk or negedge rst_n) begin//count_bf_sad
    if(!rst_n) begin
        count_bf_sad <= 4'd12;
    end
    else begin
        if(sign_sad) begin
            if(count_bf_sad>0) count_bf_sad <= count_bf_sad - 1;
            else count_bf_sad <= 4'd13; 
        end
        else begin
            count_bf_sad <= count_bf_sad;
        end
    end
end

always@(posedge clk or negedge rst_n) begin//count_bf_xy
    if(!rst_n) begin
        count_bf_xy <= 2'd2;
    end 
    else begin
        if(sign_x) begin
            if(count_bf_xy>0) count_bf_xy <= count_bf_xy - 1;
            else count_bf_xy <= 2'd3;
        end
        else begin
            count_bf_xy <= count_bf_xy;
        end
    end
end

////////////////////SIGN UPDATE//////////////////////////

always @(posedge clk or negedge rst_n) begin//sign_sad
    if(!rst_n) sign_sad <= 0;
    else if(en) sign_sad <= 1;
    else if(count_bf_sad == 4'd13) sign_sad <= 0;
    else sign_sad <= sign_sad;
end

always @(posedge clk or negedge rst_n) begin//sign_sad
    if(!rst_n) sign_x <= 0;
    else if(en) sign_x <= 1;
    else if(count_bf_xy == 2'd3) sign_x <= 0;
    else sign_x <= sign_x;
end

always @(posedge clk or negedge rst_n) begin//sign_sad
    if(!rst_n) sign_y <= 0;
    else if(en) sign_y <= 1;
    else if(count_bf_xy == 2'd3) sign_y <= 0;
    else sign_y <= sign_y;
end

endmodule
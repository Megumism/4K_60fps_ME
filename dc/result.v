`timescale 1ns/1ps

module result(sad,x,y,en,rst_n,clk,sad_out,x_out,y_out);
input [13:0]sad;
input rst_n;
input [3:0]x;
input [3:0]y;
input clk;
input en;
output sad_out;
output x_out;
output y_out;
reg [13:0]buf_sad;
reg [3:0]buf_x;
reg [3:0]buf_y;
reg sign_sad;
reg sign_x;
reg sign_y;
reg [4:0]count_bf_sad;
reg [2:0]count_bf_x;
reg [2:0]count_bf_y;
reg sad_reg;
reg x_reg;
reg y_reg;

assign sad_out = sad_reg;
assign x_out = x_reg;
assign y_out = y_reg;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        buf_sad <= 0;
        buf_x <= 0;
        buf_y <= 0;
    end
    else begin
        if(en) begin
            buf_sad <= sad;
            buf_x <= x;
            buf_y <= y;
            //$display("%d,%d,%d",x,y,sad) ;
        end
        else begin
            buf_sad <= buf_sad;
            buf_x <= buf_x;
            buf_y <= buf_y;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
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

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        x_reg <= 0;
    end
    else begin
        if(sign_x) begin
            x_reg <= buf_x[count_bf_x];
        end
        else begin
            x_reg <= x_reg;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        y_reg <= 0;
    end
    else begin
        if(sign_y) begin
            y_reg <= buf_y[count_bf_y];
        end
        else begin
            y_reg <= y_reg;
        end
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        count_bf_sad <= 13;
    end
    else begin
        if(sign_sad) begin
            if(count_bf_sad>0)  count_bf_sad <= count_bf_sad - 1;
            else count_bf_sad <= 13; 
        end
        else begin
            count_bf_sad <= count_bf_sad;
        end
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        count_bf_x <= 3;
    end 
    else begin
        if(sign_x) begin
            if(count_bf_x>0)  count_bf_x <= count_bf_x - 1;
            else count_bf_x <= 3;
        end
        else begin
            count_bf_x <= count_bf_x;
        end
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        count_bf_y <= 3;
    end
    else begin
       if(sign_y) begin
            if(count_bf_y>0)  count_bf_y <= count_bf_y - 1;
            else count_bf_y <= 3;
        end
        else begin
            count_bf_y <= count_bf_y;
        end
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sign_sad <= 0;
    else if(en) sign_sad <= 1;
    else if(count_bf_sad == 13) sign_sad <= 0;
    else sign_sad <= sign_sad;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sign_x <= 0;
    else if(en) sign_x <= 1;
    else if(count_bf_x == 3) sign_x <= 0;
    else sign_x <= sign_x;
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) sign_y <= 0;
    else if(en) sign_y <= 1;
    else if(count_bf_y == 3) sign_y <= 0;
    else sign_y <= sign_y;
end

endmodule
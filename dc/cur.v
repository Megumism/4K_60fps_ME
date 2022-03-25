`timescale 1ns/1ps 
module cur(clk, out, in,en_in,en_out,rst_n);


input [31:0]in;
input clk,rst_n,en_out;
output en_in;
output [63:0]out;
wire [63:0]reg_ra;
wire [63:0]reg_rb;
wire [63:0]reg_wa;
wire [63:0]reg_wb;
reg [3:0]addr_a;
reg [3:0]addr_b;
reg wea;
reg web;
reg mea;
reg meb;
reg testa;
reg testb;
reg [3:0]rma;
reg [3:0]rmb;
reg rmea;
reg rmeb;
reg sign;
reg [63:0]buffer;
reg pos;
reg [4:0] cur_count;
reg en_in;
reg cur_start;
reg [16:0]start;
reg [5:0]out_conti_count;
wire cur_count_zero,cur_count_24,cur_count_0_15,cur_count_1_16,cur_count_2_18,cur_count_1_18,curstart_pos_zero;

sadslspkb2p16x64m4b1w0cp0d0t0 dua(  .QA(reg_ra), 
                                    .QB(reg_rb), 
                                    .ADRA(addr_a), 
                                    .DA(reg_wa), 
                                    .WEA(wea), 
                                    .MEA(mea), 
                                    .CLKA(clk), 
                                    .TEST1A(testa), 
                                    .RMEA(rmea), 
                                    .RMA(rma), 
                                    .ADRB(addr_b), 
                                    .DB(reg_wb), 
                                    .WEB(web), 
                                    .MEB(meb), 
                                    .CLKB(clk), 
                                    .TEST1B(testb), 
                                    .RMEB(rmeb),
                                    .RMB(rmb));

assign out = reg_rb;
assign reg_wa = buffer;
assign cur_count_zero = (!en_out)&&(!cur_start);
assign cur_count_24 = (cur_count==24);
assign cur_count_0_15 = cur_count<=15&&cur_count>=0;
assign cur_count_1_16 = cur_count<=16&&cur_count>=1;
assign cur_count_2_18 = cur_count<=18&&cur_count>=2;
assign cur_count_1_18 = cur_count<=18&&cur_count>=1;
assign curstart_pos_zero = cur_start==0 && pos==0;
always@(posedge clk or negedge rst_n) begin//start
    if(!rst_n) start<=0;
    else if(en_in) start<=start + 1;
    else start<=0;
end

always@(posedge clk or negedge rst_n) begin//out_conti_count
    if(!rst_n) out_conti_count<=0;
    else if(en_out && (out_conti_count<24)) out_conti_count<=out_conti_count + 1;
    else out_conti_count<=0;
end

always@(posedge clk or negedge rst_n) begin//cur_start
    if(!rst_n) cur_start<=1;
    else if(!cur_start)cur_start<=0;
    else if(cur_count>19)cur_start<=0;
    else cur_start<=1;
end



always@(posedge clk or negedge rst_n) begin//cur_count
    if(!rst_n) cur_count<=0;
    else if(cur_count_zero) cur_count<=0;
    else if(cur_count_24)cur_count<=0;
    else cur_count<=cur_count+1;
end

always@(posedge clk or negedge rst_n) begin//en_in
    if(!rst_n) en_in<=0;
    else if(cur_start) begin
        if(cur_count<=18&&cur_count>=2)en_in<=1;
        else en_in <= 0;
    end
    else if(cur_count_zero) en_in<=0;
    else if(cur_count_0_15)en_in<=1;
    else en_in<=0;
end

always@(posedge clk or negedge rst_n) begin//wea
    if(!rst_n) wea<=0;
    else if(cur_start) begin
        if(cur_count<=23&&cur_count>=4)begin
            if(!sign) wea<=1;
            else wea <=0;
        end
        else wea<=0;
    end
    else if(cur_count_zero) wea<=0;
    else if(cur_count_1_16)
        if(!sign) wea<=1;
        else wea <=0;
    else wea<=0;
end

always@(posedge clk or negedge rst_n) begin//addr_a
    if(!rst_n) addr_a<=0;
    else if(cur_start) begin
        if(cur_count<=23&&cur_count>=4)begin
            if(!sign) addr_a<=addr_a+1;
            else addr_a <=addr_a;
        end
        else addr_a <=addr_a;
    end
    else if(cur_count_zero) addr_a<=addr_a;
    else if(cur_count_1_16)
        if(!sign) addr_a<=addr_a+1;
        else addr_a <=addr_a;
    else addr_a<=addr_a;
end

always@(posedge clk or negedge rst_n) begin//buffer
    if(!rst_n) begin buffer<=0;end
    else if(cur_start) begin
        if(cur_count<=20&&cur_count>=3)begin
            if(!sign) begin
                buffer[31:0] <= in;
            end
            else begin
                buffer[63:32] <= in;
            end
        end
        else buffer <=buffer;
    end
    else if(cur_count_zero) buffer<=buffer;
    else if(cur_count_2_18) begin
        if(!sign) begin
                buffer[31:0] <= in;
        end
        else begin
                buffer[63:32] <= in;
        end
    end
end

always@(negedge rst_n or posedge clk)begin
    if(!rst_n) pos<=0;
    else if(!cur_start) pos <=1;
    else pos<=0;        
end
always@(posedge clk or negedge rst_n) begin//sign
    if(!rst_n) begin sign<=0;end
    else if(cur_start) begin
        if(cur_count<=20&&cur_count>=3)begin
            sign <= ~sign;
        end
        else sign <= sign;
    end
    else if(curstart_pos_zero) sign <= ~sign;
    else if(cur_count_zero) sign<=sign;
    else if(cur_count_1_18) begin
        sign <= ~sign;
    end
end

always@(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        rmea <= 0;
        rmeb <= 0;
        mea <= 1;
        meb <= 1;
        testa <= 0;
        testb <= 0;
        web <= 0;
    end 
    else begin
        rmea <= rmea;
        rmeb <= rmeb;
        mea <= mea;
        meb <= meb;
        testa <= testa;
        testb <= testb;
        web <= web;
    end   
end

/*always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)begin
        buffer <= 0;
        sign <= 0;
    end
    else begin
        if(en_in) begin
            if(!sign) begin
                buffer[31:0] <= in;
            end
            else begin
                buffer[63:32] <= in;
            end
            sign <= ~sign;
        end
        else buffer <= buffer;
    end
end*/

/*always@(posedge clk or negedge rst_n)
begin
    if(!rst_n)begin
        wea <= 0;
    end
    else begin
        if(en_in)begin
            if(!sign && (start>0)) wea <= 1;
            else wea <= 0;
        end
        else begin
            wea <= 0;
        end
    end
end*/


/*always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        addr_a <= 0;
    end
    else begin 
        if(en_in) begin
            if(!sign &&(start>0)) begin
                addr_a <= addr_a + 1;
            end
            else begin
                addr_a <= addr_a;
            end
        end
        else begin
            addr_a <= addr_a;
        end
    end
end*/

always@(posedge clk or negedge rst_n)
begin
    if(!rst_n) begin
        addr_b <= 4'b0001;
    end
    else begin 
        if(en_out && (out_conti_count<8)) begin
                addr_b <= addr_b + 1;
        end
        else begin
            addr_b <= addr_b;
        end
    end
end

endmodule
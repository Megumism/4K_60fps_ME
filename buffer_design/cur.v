`timescale 1ns/1ps 
module cur(clk, out, in,en_in,en_out,rst_n);


input [31:0]in;
input clk,rst_n,en_out;
output en_in;
output [63:0]out;

wire [63:0]reg_ra,reg_rb,reg_wa,reg_wb;
reg [3:0]addr_a,addr_b;
wire web,mea,meb,testa,testb,rmea,rmeb;
wire[3:0]rma,rmb;
reg wea,sign,pos,en_in,cur_start;
reg [63:0]buffer;
reg [4:0] cur_count;
reg [16:0]start;
reg [4:0]out_conti_count;
wire en_out_zero,cur_count_24,cur_count_0_15,cur_count_1_16,cur_count_2_18,cur_count_1_18,curstart_pos_zero,cur_count_3_20,cur_count_4_23,out_conti_count_smaller_24,out_conti_count_smaller_8;

////////////////////SRAM//////////////////////////
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

////////////////////OUTPUT//////////////////////////
assign out = reg_rb;

//////////////////INPIUT OF SRAM///////////////////
assign reg_wa = buffer;

//////////////////UNCHANGED SIGNAL///////////////////
assign rmea = 0;
assign rmeb = 0;
assign mea = 1;
assign meb = 1;
assign testa = 0;
assign testb = 0;
assign web = 0;
assign rmb = 0;
assign rma = 0;

////////////////JUDGMENT CRITERIA/////////////////
assign en_out_zero = (!en_out) && (!cur_start);
assign cur_count_24 = (cur_count == 5'd24);
assign cur_count_0_15 = cur_count <= 5'd15 && cur_count >= 5'd0;
assign cur_count_1_16 = cur_count <= 5'd16 && cur_count >= 5'd1;
assign cur_count_2_18 = cur_count <= 5'd18 && cur_count >= 5'd2;
assign cur_count_1_18 = cur_count <= 5'd18 && cur_count >= 1;
assign curstart_pos_zero = cur_start == 0 && pos == 0;
assign out_conti_count_smaller_24 = en_out && (out_conti_count < 5'd24);
assign out_conti_count_smaller_8 = en_out && (out_conti_count < 5'd8);
assign cur_count_3_20 = cur_count <= 5'd20 && cur_count >= 5'd3;
assign cur_count_4_23 = cur_count <= 5'd23 && cur_count >= 5'd4;

///////////////////////START SIGN////////////////////////
/*always@(posedge clk or negedge rst_n) begin//start
    if(!rst_n) start<=0;
    else if(en_in) start<=start + 1;
    else start<=0;
end*/

always@(posedge clk or negedge rst_n) begin//cur_start
    if(!rst_n)            cur_start <= 1;
    else if(!cur_start)   cur_start <= 0;
    else if(cur_count>19) cur_start <= 0;
    else                  cur_start <= 1;
end

always@(negedge rst_n or posedge clk)begin//pos:lead to one additional sign transition
    if(!rst_n)          pos <= 0;
    else if(!cur_start) pos <= 1;
    else                pos <= 0;        
end

///////////////////////BUFFER INPUT SIGN////////////////////////
always@(posedge clk or negedge rst_n) begin//sign:point odd or even
    if(!rst_n)                 sign <= 0;
    else if(cur_start) 
        if(cur_count_3_20)     sign <= ~sign;
        else                   sign <= sign;
    else if(curstart_pos_zero) sign <= ~sign;
    else if(en_out_zero)       sign <= sign;
    else if(cur_count_1_18)    sign <= ~sign;
end

///////////////////////INPUT////////////////////////
always@(posedge clk or negedge rst_n) begin//cur_count:counter of 25
    if(!rst_n)            cur_count <= 0;
    else if(en_out_zero)  cur_count <= 0;
    else if(cur_count_24) cur_count <= 0;
    else                  cur_count <= cur_count + 1;
end

always@(posedge clk or negedge rst_n) begin//en_in:data_in_sign
    if(!rst_n)              en_in <= 0;
    else if(cur_start)
        if(cur_count_2_18)  en_in <= 1;
        else                en_in <= 0;
    else if(en_out_zero)    en_in <= 0;
    else if(cur_count_0_15) en_in <= 1;
    else                    en_in <= 0;
end

always@(posedge clk or negedge rst_n) begin//wea:sram_write_sign
    if(!rst_n)               wea <= 0;
    else if(cur_start) 
        if(cur_count_4_23)
            if(!sign)        wea <= 1;
            else             wea <= 0;
        else                 wea <= 0;
    else if(en_out_zero)     wea <= 0;
    else if(cur_count_1_16)
        if(!sign)            wea <= 1;
        else                 wea <= 0;
    else                     wea <= 0;
end

always@(posedge clk or negedge rst_n) begin//addr_a:sram_write_address
    if(!rst_n)                       addr_a <= 0;
    else if(cur_start) 
        if(cur_count_4_23)
            if(!sign)                addr_a <= addr_a+1;
            else                     addr_a <= addr_a;
        else                         addr_a <= addr_a;
    else if(en_out_zero)             addr_a <= addr_a;
    else if(cur_count_1_16)
        if(!sign)                    addr_a <= addr_a+1;
        else                         addr_a <= addr_a;
    else                             addr_a <= addr_a;
end

always@(posedge clk or negedge rst_n) begin//buffer:input_data_buffer
    if(!rst_n)                     buffer <= 0;
    else if(cur_start) 
        if(cur_count_3_20)
            if(!sign)              buffer[31:0] <= in;  
            else                   buffer[63:32] <= in;
        else                       buffer <= buffer;
    else if(en_out_zero)           buffer <= buffer;
    else if(cur_count_2_18) 
        if(!sign)                  buffer[31:0] <= in;
        else                       buffer[63:32] <= in;
end

///////////////////////OUTPUT////////////////////////
always@(posedge clk or negedge rst_n) begin//out_conti_count:counter of 8
    if(!rst_n)                          out_conti_count<=0;
    else if(out_conti_count_smaller_24) out_conti_count<=out_conti_count + 1;
    else                                out_conti_count<=0;
end

always@(posedge clk or negedge rst_n)begin//addr_b:sram_read_address
    if(!rst_n)                         addr_b <= 4'b0001;
    else 
        if(out_conti_count_smaller_8)  addr_b <= addr_b + 1;
        else                           addr_b <= addr_b;
end
endmodule
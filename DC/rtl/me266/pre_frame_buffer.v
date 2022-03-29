//previous frame buffer
//version 1


module pre_frame_buffer(clk, reset, in_en, out_en, cur_out, data_in, pre_frame_0,pre_frame_1,pre_frame_2,pre_frame_3,pre_frame_4,pre_frame_5,pre_frame_6,pre_frame_7,pre_frame_8,pre_frame_9,pre_frame_10,pre_frame_11,pre_frame_12,pre_frame_13,pre_frame_14,pre_frame_15,frame_end);
//defination of inputs and outputs

input clk;             //module enable
input reset;
input [63:0]data_in;
output out_en;
output in_en;
output  reg [63:0]pre_frame_0;
output  reg [63:0]pre_frame_1;
output  reg [63:0]pre_frame_2;
output  reg [63:0]pre_frame_3;
output  reg [63:0]pre_frame_4;
output  reg [63:0]pre_frame_5;
output  reg [63:0]pre_frame_6;
output  reg [63:0]pre_frame_7;
output  reg [63:0]pre_frame_8;
output  reg [63:0]pre_frame_9;
output  reg [63:0]pre_frame_10;
output  reg [63:0]pre_frame_11;
output  reg [63:0]pre_frame_12;
output  reg [63:0]pre_frame_13;
output  reg [63:0]pre_frame_14;
output  reg [63:0]pre_frame_15;
output frame_end;
output cur_out;

wire clk;
wire [63:0]data_in;
reg in_en;
reg out_en;
reg frame_end;
reg cur_out;


//defination of register

reg [4:0]addr_write;
reg [4:0]addr_read;
reg [6:0]clk_count;
reg [8:0]x_cycle_count;
reg [8:0]y_cycle_count;
reg [2:0]zero_sram;       //the Sram whose first byte is empty
reg [2:0]write_flag;      //Sram which is being writing
wire [63:0]tmp_out0;
wire [63:0]tmp_out1;
wire [63:0]tmp_out2;
reg [1:0]statu;

//judge the status in current cycle
//2'b00:in first cycle;
//2'b01:in nomal cycle;
//2'b10:in EOF cycle;

sadslspkb2p24x64m4b1w0cp0d0t0 sram0
                              (
                                  .QA(),
                                  .QB(tmp_out0),
                                  .ADRA(addr_write),
                                  .DA(data_in),
                                  .WEA(1'b1),
                                  .MEA(write_flag[0]),
                                  .CLKA(clk),
                                  .TEST1A(1'b0),
                                  .RMEA(1'b1),
                                  .RMA(4'b0011),
                                  .ADRB(addr_read),
                                  .DB({64{1'b0}}),
                                  .WEB(1'b0),
                                  .MEB(1'b1),
                                  .CLKB(clk),
                                  .TEST1B(1'b0),
                                  .RMEB(1'b1),
                                  .RMB(4'b0011));

sadslspkb2p24x64m4b1w0cp0d0t0 sram1
                              (
                                  .QA(),
                                  .QB(tmp_out1),
                                  .ADRA(addr_write),
                                  .DA(data_in),
                                  .WEA(1'b1),
                                  .MEA(write_flag[1]),
                                  .CLKA(clk),
                                  .TEST1A(1'b0),
                                  .RMEA(1'b1),
                                  .RMA(4'b0011),
                                  .ADRB(addr_read),
                                  .DB({64{1'b0}}),
                                  .WEB(1'b0),
                                  .MEB(1'b1),
                                  .CLKB(clk),
                                  .TEST1B(1'b0),
                                  .RMEB(1'b1),
                                  .RMB(4'b0011));

sadslspkb2p24x64m4b1w0cp0d0t0 sram2
                              (
                                  .QA(),
                                  .QB(tmp_out2),
                                  .ADRA(addr_write),
                                  .DA(data_in),
                                  .WEA(1'b1),
                                  .MEA(write_flag[2]),
                                  .CLKA(clk),
                                  .TEST1A(1'b0),
                                  .RMEA(1'b1),
                                  .RMA(4'b0011),
                                  .ADRB(addr_read),
                                  .DB({64{1'b0}}),
                                  .WEB(1'b0),
                                  .MEB(1'b1),
                                  .CLKB(clk),
                                  .TEST1B(1'b0),
                                  .RMEB(1'b1),
                                  .RMB(4'b0011));

always@(posedge clk)      //addr_write
begin
    if(statu == 1) begin
        if(clk_count == 21 && x_cycle_count != 480)
            addr_write <= (addr_write-22+32)%32;
        else if(clk_count <= 22 || clk_count == 25)
            addr_write <= (addr_write+1)%32;
    end
    else if(statu == 0&&clk_count<71 && clk_count!=0) begin
        if(clk_count%3 == 0) begin
            if(clk_count == 69)
                addr_write <= addr_write-22;
            else
                addr_write <= addr_write+1;
        end
        if(clk_count >69)
            addr_write <= addr_write+1;
    end

    if(clk_count == 73)
        addr_write <= addr_write+1;

    if(clk_count>=21&&x_cycle_count==480)
        addr_write <= 0;

    if(~reset || frame_end)
        addr_write <= 0;
end

always@(posedge clk)      //addr_read
begin
    if(statu == 0&& clk_count!=0) begin
        if(clk_count > 47 && clk_count <= 70)
            addr_read <= addr_read+1;
        if(clk_count == 70)
            addr_read <= addr_read-22;
        if(clk_count == 73)
            addr_read <= addr_read+1;
    end

    else if(statu == 1) begin
        if(clk_count == 22)
            addr_read <= (addr_read-22+32)%32;
        else if((clk_count >= 0 && clk_count <=22) || clk_count == 25)
            addr_read <= (addr_read+1)%32;
    end


    if(x_cycle_count == 480 && clk_count == 25)
        addr_read <= 0;

    if(~reset || frame_end)
        addr_read <= 0;
end

always@(posedge clk)      //clk_count
begin
    if(statu == 0) begin
        if(clk_count == 73)
            clk_count <= 1;
        else
            clk_count <= clk_count+1;
    end
    else begin
        if(clk_count == 25)
            clk_count <= 1;
        else
            clk_count <= clk_count+1;
    end

    if(~reset || frame_end)
        clk_count <= 1;
end

always@(posedge clk)      //zero_sram
begin
    if(statu == 0 && clk_count!=0) begin
        if(clk_count == 71)
            zero_sram<=3'b010;
    end
    else
        if(clk_count == 23 && x_cycle_count != 480) begin
            if(write_flag == 3'b100)
                zero_sram <= 3'b010;
            else if(write_flag == 3'b010)
                zero_sram <= 3'b001;
            else
                zero_sram <= 3'b100;
        end

    if(clk_count == 25 && x_cycle_count == 480)
        zero_sram<=3'b100;


    if(~reset || frame_end)
        zero_sram <= 3'b100;
end

always@(posedge clk)      //write_flag
begin
    if(statu == 1) begin
        if(clk_count == 21) begin
            if(write_flag == 3'b100)
                write_flag <= 3'b010;
            else if(write_flag == 3'b010)
                write_flag <= 3'b001;
            else
                write_flag <= 3'b100;
        end
    end
    else if(statu == 0 && clk_count!=0) begin
        if(clk_count < 70) begin
            if(write_flag == 3'b100)
                write_flag <= 3'b010;
            else if(write_flag == 3'b010)
                write_flag <= 3'b001;
            else
                write_flag <= 3'b100;
        end
    end

    if(x_cycle_count == 480 && clk_count == 21) begin
        write_flag <= 3'b100;
    end


    if(~reset || frame_end)
        write_flag <= 3'b100;
end

always@(posedge clk)      //in_en
begin
    if(statu == 0) begin
        in_en<=1;
        if(clk_count==70 || clk_count==71)
            in_en<=0;
    end
    else begin
        if(clk_count == 22)
            in_en <= 0;
        else if(clk_count == 24 && x_cycle_count != 480)
            in_en <= 1;
    end

    if(x_cycle_count == 480 && clk_count == 20)
        in_en<=0;

    if(x_cycle_count == 480 && clk_count == 24)
        in_en<=1;

    if(~reset)
        in_en<=1;
end

always@(posedge clk)      //out_en
begin
    if(statu == 0) begin
        if(clk_count == 2)
            out_en <=0;
        if(clk_count == 48)
            out_en <=1;
    end

    if(~reset || frame_end)
        out_en<=0;
end

always@(posedge clk)      //cur_out
begin
    if(statu == 0) begin
        if(clk_count == 48)
            cur_out <=1;
    end

    if(~reset || frame_end)
        cur_out<=0;

    if(x_cycle_count == 480 && clk_count == 24)
        cur_out<=0;
end

always@(posedge clk)     //x_cycle_count
begin
    if(statu == 0 && clk_count == 73)
        x_cycle_count <= x_cycle_count+1;
    if(statu == 1 && clk_count == 25)
        x_cycle_count <= x_cycle_count+1;
    if(statu == 1 && clk_count == 25 && x_cycle_count == 480)
        x_cycle_count <=1;
    if(~reset || frame_end)
        x_cycle_count <=1;
end

always@(posedge clk)    //y_cycle_count
begin
    if(x_cycle_count ==480 && clk_count == 25)
        y_cycle_count <= y_cycle_count+1;
    if(~reset || frame_end)
        y_cycle_count <=1;
end

always@(posedge clk)    //statu
begin
    if(statu == 0 && clk_count == 73)
        statu <= 1;
    if(x_cycle_count == 480 && clk_count == 25)
        statu <= 0;
    if(~reset || frame_end)
        statu <= 0;
end

always@(posedge clk)   //frame_end
begin
    if(x_cycle_count == 480 && y_cycle_count == 270 && clk_count == 25)
        frame_end <= 1;
    if(~reset)
        frame_end <= 0;
end

always@(posedge clk)      //pre_frame_0
begin
    if(zero_sram == 3'b100)
        pre_frame_0 <=  {tmp_out2[55:0],tmp_out1[63:56]};
    else if(zero_sram == 3'b010)
        pre_frame_0 <=  {tmp_out1[55:0],tmp_out0[63:56]};
    else
        pre_frame_0 <=  {tmp_out0[55:0],tmp_out2[63:56]};
end

always@(posedge clk)      //pre_frame_1
begin
    if(zero_sram == 3'b100)
        pre_frame_1 <=  {tmp_out2[47:0],tmp_out1[63:48]};
    else if(zero_sram == 3'b010)
        pre_frame_1 <=  {tmp_out1[47:0],tmp_out0[63:48]};
    else
        pre_frame_1 <=  {tmp_out0[47:0],tmp_out2[63:48]};
end

always@(posedge clk)      //pre_frame_2
begin
    if(zero_sram == 3'b100)
        pre_frame_2 <=  {tmp_out2[39:0],tmp_out1[63:40]};
    else if(zero_sram == 3'b010)
        pre_frame_2 <=  {tmp_out1[39:0],tmp_out0[63:40]};
    else
        pre_frame_2 <=  {tmp_out0[39:0],tmp_out2[63:40]};
end

always@(posedge clk)      //pre_frame_3
begin
    if(zero_sram == 3'b100)
        pre_frame_3 <=  {tmp_out2[31:0],tmp_out1[63:32]};
    else if(zero_sram == 3'b010)
        pre_frame_3 <=  {tmp_out1[31:0],tmp_out0[63:32]};
    else
        pre_frame_3 <=  {tmp_out0[31:0],tmp_out2[63:32]};
end

always@(posedge clk)      //pre_frame_4
begin
    if(zero_sram == 3'b100)
        pre_frame_4 <=  {tmp_out2[23:0],tmp_out1[63:24]};
    else if(zero_sram == 3'b010)
        pre_frame_4 <=  {tmp_out1[23:0],tmp_out0[63:24]};
    else
        pre_frame_4 <=  {tmp_out0[23:0],tmp_out2[63:24]};
end

always@(posedge clk)      //pre_frame_5
begin
    if(zero_sram == 3'b100)
        pre_frame_5 <=  {tmp_out2[15:0],tmp_out1[63:16]};
    else if(zero_sram == 3'b010)
        pre_frame_5 <=  {tmp_out1[15:0],tmp_out0[63:16]};
    else
        pre_frame_5 <=  {tmp_out0[15:0],tmp_out2[63:16]};
end

always@(posedge clk)      //pre_frame_6
begin
    if(zero_sram == 3'b100)
        pre_frame_6 <=  {tmp_out2[7:0],tmp_out1[63:8]};
    else if(zero_sram == 3'b010)
        pre_frame_6 <=  {tmp_out1[7:0],tmp_out0[63:8]};
    else
        pre_frame_6 <=  {tmp_out0[7:0],tmp_out2[63:8]};
end

always@(posedge clk)      //pre_frame_7
begin
    if(zero_sram == 3'b100)
        pre_frame_7 <=  tmp_out1[63:0];
    else if(zero_sram == 3'b010)
        pre_frame_7 <=  tmp_out0[63:0];
    else
        pre_frame_7 <=  tmp_out2[63:0];
end

always@(posedge clk)      //pre_frame_8
begin
    if(zero_sram == 3'b100)
        pre_frame_8 <=  {tmp_out1[55:0],tmp_out0[63:56]};
    else if(zero_sram == 3'b010)
        pre_frame_8 <=  {tmp_out0[55:0],tmp_out2[63:56]};
    else
        pre_frame_8 <=  {tmp_out2[55:0],tmp_out1[63:56]};
end

always@(posedge clk)      //pre_frame_9
begin
    if(zero_sram == 3'b100)
        pre_frame_9 <=  {tmp_out1[47:0],tmp_out0[63:48]};
    else if(zero_sram == 3'b010)
        pre_frame_9 <=  {tmp_out0[47:0],tmp_out2[63:48]};
    else
        pre_frame_9 <=  {tmp_out2[47:0],tmp_out1[63:48]};
end

always@(posedge clk)      //pre_frame_10
begin
    if(zero_sram == 3'b100)
        pre_frame_10 <=  {tmp_out1[39:0],tmp_out0[63:40]};
    else if(zero_sram == 3'b010)
        pre_frame_10 <=  {tmp_out0[39:0],tmp_out2[63:40]};
    else
        pre_frame_10 <=  {tmp_out2[39:0],tmp_out1[63:40]};
end

always@(posedge clk)      //pre_frame_11
begin
    if(zero_sram == 3'b100)
        pre_frame_11 <=  {tmp_out1[31:0],tmp_out0[63:32]};
    else if(zero_sram == 3'b010)
        pre_frame_11 <=  {tmp_out0[31:0],tmp_out2[63:32]};
    else
        pre_frame_11 <=  {tmp_out2[31:0],tmp_out1[63:32]};
end

always@(posedge clk)      //pre_frame_12
begin
    if(zero_sram == 3'b100)
        pre_frame_12 <=  {tmp_out1[23:0],tmp_out0[63:24]};
    else if(zero_sram == 3'b010)
        pre_frame_12 <=  {tmp_out0[23:0],tmp_out2[63:24]};
    else
        pre_frame_12 <=  {tmp_out2[23:0],tmp_out1[63:24]};
end

always@(posedge clk)      //pre_frame_13
begin
    if(zero_sram == 3'b100)
        pre_frame_13 <=  {tmp_out1[15:0],tmp_out0[63:16]};
    else if(zero_sram == 3'b010)
        pre_frame_13 <=  {tmp_out0[15:0],tmp_out2[63:16]};
    else
        pre_frame_13 <=  {tmp_out2[15:0],tmp_out1[63:16]};
end

always@(posedge clk)      //pre_frame_14
begin
    if(zero_sram == 3'b100)
        pre_frame_14 <=  {tmp_out1[7:0],tmp_out0[63:8]};
    else if(zero_sram == 3'b010)
        pre_frame_14 <=  {tmp_out0[7:0],tmp_out2[63:8]};
    else
        pre_frame_14 <=  {tmp_out2[7:0],tmp_out1[63:8]};
end

always@(posedge clk)      //pre_frame_15
begin
    if(zero_sram == 3'b100)
        pre_frame_15 <=  tmp_out0[63:0];
    else if(zero_sram == 3'b010)
        pre_frame_15 <=  tmp_out2[63:0];
    else
        pre_frame_15 <=  tmp_out1[63:0];
end

endmodule

//previous frame buffer
//version 1

`include"sadslspkb2p128x64m8b1w0cp0d0t0_fast_func.v"
module pre_frame_buffer(clk, en, reset, out_en, data_in, data_out, frame_end);
//defination of inputs and outputs
 
  input clk;
  input en;                 //module enable
  input reset;
  input [63:0]data_in;
  output out_en;
  output [183:0]data_out;
  output frame_end;
  
  wire clk;
  wire en;
  wire [63:0]data_in;
  reg out_en;
  reg frame_end;
  reg[183:0]data_out;

//defination of register
 
  reg [6:0]addr_write;
  reg [6:0]addr_read;
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
  
        sadslspkb2p128x64m8b1w0cp0d0t0 sram0 
        (
        .QA(), 
        .QB(tmp_out0), 
        .ADRA(addr_write), 
        .DA(data_in), 
        .WEA(1'b1), 
        .MEA(write_flag[0]), 
        .CLKA(clk), 
        .TEST1A(clk), 
        .RMEA(1'b1), 
        .RMA(4'b0011), 
        .ADRB(addr_read), 
        .DB({64{1'b0}}), 
        .WEB(1'b0), 
        .MEB(1'b1), 
        .CLKB(clk), 
        .TEST1B(clk), 
        .RMEB(1'b1), 
        .RMB(4'b0011));
        
        sadslspkb2p128x64m8b1w0cp0d0t0 sram1 
        (
        .QA(), 
        .QB(tmp_out1), 
        .ADRA(addr_write), 
        .DA(data_in), 
        .WEA(1'b1), 
        .MEA(write_flag[1]), 
        .CLKA(clk), 
        .TEST1A(clk), 
        .RMEA(1'b1), 
        .RMA(4'b0011), 
        .ADRB(addr_read), 
        .DB({64{1'b0}}), 
        .WEB(1'b0), 
        .MEB(1'b1), 
        .CLKB(clk), 
        .TEST1B(clk), 
        .RMEB(1'b1), 
        .RMB(4'b0011));
        
        sadslspkb2p128x64m8b1w0cp0d0t0 sram2 
        (
        .QA(), 
        .QB(tmp_out2), 
        .ADRA(addr_write), 
        .DA(data_in), 
        .WEA(1'b1), 
        .MEA(write_flag[2]), 
        .CLKA(clk), 
        .TEST1A(clk), 
        .RMEA(1'b1), 
        .RMA(4'b0011), 
        .ADRB(addr_read), 
        .DB({64{1'b0}}), 
        .WEB(1'b0), 
        .MEB(1'b1), 
        .CLKB(clk), 
        .TEST1B(clk), 
        .RMEB(1'b1), 
        .RMB(4'b0011));
  
  always@(posedge clk)      //addr_write
  begin
    if(statu == 1)
      begin
      if(clk_count == 21 && x_cycle_count != 480)
        addr_write <= (addr_write-22+128)%128;
      else if(clk_count <= 22 || clk_count == 26)
        addr_write <= (addr_write+1)%128;
      end
    else if(statu == 0)
      begin
      if(clk_count%3 == 0)
        begin
        if(clk_count == 69)
          addr_write <= addr_write-22;
        else
          addr_write <= addr_write+1;
        end
      if(clk_count >69)
        addr_write <= addr_write+1;  
      end
    else    
      begin
        if((clk_count)%3 == 0 && clk_count < 23)
          addr_write <= (addr_write+1)%128;
        if(clk_count == 22)
            addr_write <= (addr_write-22+128)%128;
      end
      
    if(x_cycle_count == 480 && clk_count == 21)
      addr_write <= (addr_write + 1 )%128;
    if(x_cycle_count == 480 && clk_count > 21)
      addr_write <= (addr_write + 1) -1;
    if(x_cycle_count == 480 && clk_count == 26)
      addr_write <= (addr_write + 1)%128;
      
    if(~reset || frame_end)
      addr_write <= 0;
  end
  
  always@(posedge clk)      //addr_read
  begin 
    if(statu == 0)
    begin
      if(clk_count > 47 && clk_count != 70)
        addr_read <= addr_read+1;
      if(clk_count == 70)
        addr_read <= addr_read-22;
    end
    
    else if(statu == 1)
      begin
        if(clk_count == 22)
          addr_read <= (addr_read-22+128)%128;
        else if((clk_count >= 0 && clk_count <=22) || clk_count == 26)
          addr_read <= (addr_read+1)%128;
      end
      
    else          
      begin
      if(clk_count >= 0 && clk_count < 22)
        begin
        if(addr_read == 127)
          addr_read <= 0;
        else
          addr_read <= (addr_read+1)%128;
        end
      else if(clk_count == 22)
          addr_read <= (addr_read + 106)%128;
      end 
    
    if(x_cycle_count == 480 && clk_count == 22)
      addr_read <= (addr_read + 136-22)%128;
      
    if(~reset || frame_end)
      addr_read <= 0;
  end
    
  always@(posedge clk)      //clk_count
  begin
    if(statu == 0)
      begin
        if(clk_count == 71)
          clk_count <= 1;
        else
          clk_count <= clk_count+1;
      end
    else
      begin
        if(clk_count == 26)
        clk_count <= 1;
        else
          clk_count <= clk_count+1;
      end
      
    if(~reset || frame_end)
      clk_count <= 1;    
  end
  
  always@(posedge clk)      //zero_sram
  begin
    if(statu == 0)
      begin
        if(clk_count == 71)
          zero_sram<=3'b010;
      end
    else
      if(clk_count == 23 && x_cycle_count != 480)
        begin
        if(write_flag == 3'b100)    
          zero_sram <= 3'b010;
        else if(write_flag == 3'b010)
          zero_sram <= 3'b001;
        else
          zero_sram <= 3'b100;  
        end
    if(~reset || frame_end)
      zero_sram <= 3'b100;
  end 
  
  always@(posedge clk)      //write_flag
  begin
    if(statu == 1)
      begin
      if(clk_count == 21)
        begin
          if(write_flag == 3'b100)    
            write_flag <= 3'b010;
          else if(write_flag == 3'b010)
            write_flag <= 3'b001;
          else
            write_flag <= 3'b100;
        end
      end
    else
    begin
      if(clk_count < 70)
        begin
        if(write_flag == 3'b100)
          write_flag <= 3'b010;
        else if(write_flag == 3'b010)
          write_flag <= 3'b001;
        else
          write_flag <= 3'b100;
        end
    end
    
    if(x_cycle_count == 480 && clk_count >= 24)
      begin
        if(write_flag == 3'b100)
          write_flag <= 3'b010;
        else if(write_flag == 3'b010)
          write_flag <= 3'b001;
        else
          write_flag <= 3'b100;
      end
      
    
    if(~reset || frame_end)
      write_flag <= 3'b100;
  end
  
  always@(posedge clk)      //out_en
  begin
    if(statu == 0)
      begin
        if(clk_count > 47 && clk_count <= 71)
          out_en <=1;
        else
          out_en <=0;
      end
    else
      begin
        if(clk_count >=1 && clk_count <= 23)
          out_en <=1;
        else
          out_en <=0;
      end
    if(~reset || frame_end)
      out_en<=0;
  end
  
  always@(posedge clk)      //data_out
  begin
    if(out_en)
      begin
      if(zero_sram == 3'b100)
        data_out <= {tmp_out2[47:0],tmp_out1[63:0],tmp_out0[63:0]};
      else if(zero_sram == 3'b010)
        data_out <= {tmp_out1[47:0],tmp_out0[63:0],tmp_out2[63:0]};
      else
        data_out <= {tmp_out0[47:0],tmp_out2[63:0],tmp_out1[63:0]};
      end
  end
  
  always@(posedge clk)     //x_cycle_count
  begin
    if(statu == 0 && clk_count == 71)
       x_cycle_count <= x_cycle_count+1;
    if(statu == 1 && clk_count == 26)
      x_cycle_count <= x_cycle_count+1;
    if(statu == 1 && clk_count == 26 && x_cycle_count == 480)
      x_cycle_count <=1;
    if(statu == 2 && clk_count == 26)
      x_cycle_count <= x_cycle_count+1;
    if(~reset || frame_end)
      x_cycle_count <=1;
  end
  
  always@(posedge clk)    //y_cycle_count
  begin
    if(x_cycle_count ==480 && clk_count == 26)
      y_cycle_count <= y_cycle_count+1;
    if(~reset || frame_end)
      y_cycle_count <=1;
  end
  
  always@(posedge clk)    //statu
  begin
    if(statu == 0 && clk_count == 71)
      statu <= 1;
    if(statu == 1 && clk_count == 26 && x_cycle_count == 480)
      statu <= 2;
    if(statu == 2 && clk_count == 26)
      statu <= 1;
    if(~reset || frame_end)
      statu <= 0;  
  end
  
  always@(posedge clk)   //frame_end
  begin
    if(x_cycle_count == 480 && y_cycle_count == 270 && clk_count == 26)
      frame_end <= 1;
    else
      frame_end <= 0;
  end
  
endmodule
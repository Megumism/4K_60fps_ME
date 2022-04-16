`timescale 1ns/1ps 
module me266(clk,rst,ref_in,cur_in,ref_read,cur_read,sad_out,x_out,y_out,sign_sad);

  input clk,rst;
  input[63:0] ref_in;
  input[31:0] cur_in;
  output ref_read,cur_read;
  output sad_out,x_out,y_out,sign_sad;
  wire cur_out;
  wire [63:0] crt_frame;
  wire cur_read;
  wire [31:0] cur_in;
  reg cur_reset;
  wire sign_sad;
  wire sad_out;
  
  wire x_out;
  wire y_out;
  wire [63:0] ref_in;

  reg [2:0] ref_flag;
  wire ref_read,ref_out;
  wire [183:0] data_out;

  reg core_reset;
  wire [14-1:0] sad_min;
  wire [4-1:0] motion_vec_x_min;
  wire [4-1:0] motion_vec_y_min;
  wire frame_end;
  wire sad_en,en_sad_out;
  reg cur_out_late,cur_out_late_late;
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////





cur CUR(.clk(clk),
        .out(crt_frame),
        .in(cur_in),
        .en_in(cur_read),
        .en_out(cur_out),
        .rst_n(rst));
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////


pre_frame_buffer PRE (.clk(clk),
                      .rst_n(rst),
                      .in_en(ref_read),
                      .out_en(ref_out),
                      .cur_out(cur_out),
                      .data_in(ref_in),
                      .data_out(data_out),
                      .frame_end(frame_end));


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////


always@(posedge clk or negedge rst)//core_reset
begin
  if(!rst) core_reset<=0;
  else if(!ref_out)core_reset<=0;
  else core_reset<=1;
end

    core CORE(
    .clk(clk),
    .rst_n(core_reset),
    .crt_frame_0(crt_frame),
    .crt_frame_1(crt_frame),
    .crt_frame_2(crt_frame),
    .crt_frame_3(crt_frame),
    .crt_frame_4(crt_frame),
    .crt_frame_5(crt_frame),
    .crt_frame_6(crt_frame),
    .crt_frame_7(crt_frame),
    .crt_frame_8(crt_frame),
    .crt_frame_9(crt_frame),
    .crt_frame_10(crt_frame),
    .crt_frame_11(crt_frame),
    .crt_frame_12(crt_frame),
    .crt_frame_13(crt_frame),
    .crt_frame_14(crt_frame),
    .crt_frame_15(crt_frame),
    .pre_frame_0(data_out[183:120]),
    .pre_frame_1(data_out[175:112]),
    .pre_frame_2(data_out[167:104]),
    .pre_frame_3(data_out[159:96]),
    .pre_frame_4(data_out[151:88]),
    .pre_frame_5(data_out[143:80]),
    .pre_frame_6(data_out[135:72]),
    .pre_frame_7(data_out[127:64]),
    .pre_frame_8(data_out[119:56]),
    .pre_frame_9(data_out[111:48]),
    .pre_frame_10(data_out[103:40]),
    .pre_frame_11(data_out[95:32]),
    .pre_frame_12(data_out[87:24]),
    .pre_frame_13(data_out[79:16]),
    .pre_frame_14(data_out[71:8]),
    .pre_frame_15(data_out[63:0]),
    .sad_min(sad_min),
    .sad_en(sad_en),
    .motion_vec_x_min(motion_vec_x_min),
    .motion_vec_y_min(motion_vec_y_min)
    );
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
always@(posedge clk or negedge rst) begin
  if(!rst) cur_out_late <= 0;
  else     cur_out_late <= cur_out;
end

always@(posedge clk or negedge rst) begin
  if(!rst) cur_out_late_late <= 0;
  else     cur_out_late_late <= cur_out_late;
end

assign en_sad_out = sad_en && cur_out_late_late;

result RESULT(.sad(sad_min),
              .inx(motion_vec_x_min),
              .iny(motion_vec_y_min),
              .en(en_sad_out),
              .rst_n(rst),
              .sad_out(sad_out),
              .sign_sad(sign_sad),
              .x_out(x_out),
              .y_out(y_out),
              .clk(clk));
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////




 
endmodule
			



`timescale 1ns/1ps 
module me266(clk,rst,ref_in,cur_in,ref_read,cur_read,sad_out,x_out,y_out);

  input clk,rst;
  input[63:0] ref_in;
  input[31:0] cur_in;
  output ref_read,cur_read,sad_out,x_out,y_out;
  wire cur_out;
  wire [63:0] crt_frame;
  wire cur_read;
  wire [31:0] cur_in;
  reg cur_reset;
  wire sad_out;
  wire x_out;
  wire y_out;
  wire [63:0] ref_in;

  reg [2:0] ref_flag;
  wire ref_read,ref_out;
  wire [63:0] pre_frame_0,pre_frame_1,pre_frame_2,pre_frame_3,pre_frame_4,pre_frame_5,pre_frame_6,pre_frame_7,pre_frame_8,pre_frame_9,pre_frame_10,pre_frame_11,pre_frame_12,pre_frame_13,pre_frame_14,pre_frame_15;

  reg core_reset;
  wire [14-1:0] sad_min;
  wire [4-1:0] motion_vec_x_min;
  wire [4-1:0] motion_vec_y_min;
  wire frame_end;
  wire sad_en;
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
                      .reset(rst),
                      .in_en(ref_read),
                      .out_en(ref_out),
                      .cur_out(cur_out),
                      .data_in(ref_in),
                      .pre_frame_0(pre_frame_0),
                      .pre_frame_1(pre_frame_1),
                      .pre_frame_2(pre_frame_2),
                      .pre_frame_3(pre_frame_3),
                      .pre_frame_4(pre_frame_4),
                      .pre_frame_5(pre_frame_5),
                      .pre_frame_6(pre_frame_6),
                      .pre_frame_7(pre_frame_7),
                      .pre_frame_8(pre_frame_8),
                      .pre_frame_9(pre_frame_9),
                      .pre_frame_10(pre_frame_10),
                      .pre_frame_11(pre_frame_11),
                      .pre_frame_12(pre_frame_12),
                      .pre_frame_13(pre_frame_13),
                      .pre_frame_14(pre_frame_14),
                      .pre_frame_15(pre_frame_15),
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
    .pre_frame_0(pre_frame_0),
    .pre_frame_1(pre_frame_1),
    .pre_frame_2(pre_frame_2),
    .pre_frame_3(pre_frame_3),
    .pre_frame_4(pre_frame_4),
    .pre_frame_5(pre_frame_5),
    .pre_frame_6(pre_frame_6),
    .pre_frame_7(pre_frame_7),
    .pre_frame_8(pre_frame_8),
    .pre_frame_9(pre_frame_9),
    .pre_frame_10(pre_frame_10),
    .pre_frame_11(pre_frame_11),
    .pre_frame_12(pre_frame_12),
    .pre_frame_13(pre_frame_13),
    .pre_frame_14(pre_frame_14),
    .pre_frame_15(pre_frame_15),
    .sad_min(sad_min),
    .sad_en(sad_en),
    .motion_vec_x_min(motion_vec_x_min),
    .motion_vec_y_min(motion_vec_y_min)
    );
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

result RESULT(.sad(sad_min),
              .x(motion_vec_x_min),
              .y(motion_vec_y_min),
              .en(sad_en),
              .rst_n(rst),
              .sad_out(sad_out),
              .x_out(x_out),
              .y_out(y_out),
              .clk(clk));
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////




 
endmodule
			



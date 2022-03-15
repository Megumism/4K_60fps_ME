module core (input wire clk,
             input wire rst_n,
             input wire [64-1:0] crt_frame_0,
             input wire [64-1:0] crt_frame_1,
             input wire [64-1:0] crt_frame_2,
             input wire [64-1:0] crt_frame_3,
             input wire [64-1:0] crt_frame_4,
             input wire [64-1:0] crt_frame_5,
             input wire [64-1:0] crt_frame_6,
             input wire [64-1:0] crt_frame_7,
             input wire [64-1:0] crt_frame_8,
             input wire [64-1:0] crt_frame_9,
             input wire [64-1:0] crt_frame_10,
             input wire [64-1:0] crt_frame_11,
             input wire [64-1:0] crt_frame_12,
             input wire [64-1:0] crt_frame_13,
             input wire [64-1:0] crt_frame_14,
             input wire [64-1:0] crt_frame_15,
             input wire [64-1:0] pre_frame_0,
             input wire [64-1:0] pre_frame_1,
             input wire [64-1:0] pre_frame_2,
             input wire [64-1:0] pre_frame_3,
             input wire [64-1:0] pre_frame_4,
             input wire [64-1:0] pre_frame_5,
             input wire [64-1:0] pre_frame_6,
             input wire [64-1:0] pre_frame_7,
             input wire [64-1:0] pre_frame_8,
             input wire [64-1:0] pre_frame_9,
             input wire [64-1:0] pre_frame_10,
             input wire [64-1:0] pre_frame_11,
             input wire [64-1:0] pre_frame_12,
             input wire [64-1:0] pre_frame_13,
             input wire [64-1:0] pre_frame_14,
             input wire [64-1:0] pre_frame_15,
             output wire sad_en,
             output reg [14-1:0] sad_min,
             output reg [4-1:0] motion_vec_x_min,
             output reg [4-1:0] motion_vec_y_min);
    
    reg [5-1:0] pro_cnt;
    
    // counter这边要注意如下风险：
    // 在没有加流水线的情况下，第0周期读入core，第8周期进比较树，第9周期能结果寄存器有值中间，第24周期有可以输出的终值。
    // 基于上述的逻辑，才有第8周期的crt_keep，才有第8周期到第23周期允许修改结果寄存器，才有y偏置量为8，才有第24周期的输出使能。
    // 3.15: 在加法树到比较树之间增加了一级流水

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pro_cnt <= 0;
        end
        else begin
            if (pro_cnt == 24) begin
                pro_cnt <= 0;
            end
            else begin
                pro_cnt <= pro_cnt+1;
            end
        end
    end
    
    wire crt_keep;
    assign crt_keep = (pro_cnt >= 5'd8) ? 1'b1 : 1'b0;
    assign sad_en = (pro_cnt == 5'd0);
    
    wire [14-1:0] sad_data_0;
    wire [14-1:0] sad_data_1;
    wire [14-1:0] sad_data_2;
    wire [14-1:0] sad_data_3;
    wire [14-1:0] sad_data_4;
    wire [14-1:0] sad_data_5;
    wire [14-1:0] sad_data_6;
    wire [14-1:0] sad_data_7;
    wire [14-1:0] sad_data_8;
    wire [14-1:0] sad_data_9;
    wire [14-1:0] sad_data_10;
    wire [14-1:0] sad_data_11;
    wire [14-1:0] sad_data_12;
    wire [14-1:0] sad_data_13;
    wire [14-1:0] sad_data_14;
    wire [14-1:0] sad_data_15;

    // sad sad_#(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_#),.crt_frame(crt_frame_#),.sad(sad_#));
    sad sad_0(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_0),.crt_frame(crt_frame_0),.sad_data(sad_data_0));
    sad sad_1(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_1),.crt_frame(crt_frame_1),.sad_data(sad_data_1));
    sad sad_2(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_2),.crt_frame(crt_frame_2),.sad_data(sad_data_2));
    sad sad_3(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_3),.crt_frame(crt_frame_3),.sad_data(sad_data_3));
    sad sad_4(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_4),.crt_frame(crt_frame_4),.sad_data(sad_data_4));
    sad sad_5(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_5),.crt_frame(crt_frame_5),.sad_data(sad_data_5));
    sad sad_6(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_6),.crt_frame(crt_frame_6),.sad_data(sad_data_6));
    sad sad_7(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_7),.crt_frame(crt_frame_7),.sad_data(sad_data_7));
    sad sad_8(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_8),.crt_frame(crt_frame_8),.sad_data(sad_data_8));
    sad sad_9(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_9),.crt_frame(crt_frame_9),.sad_data(sad_data_9));
    sad sad_10(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_10),.crt_frame(crt_frame_10),.sad_data(sad_data_10));
    sad sad_11(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_11),.crt_frame(crt_frame_11),.sad_data(sad_data_11));
    sad sad_12(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_12),.crt_frame(crt_frame_12),.sad_data(sad_data_12));
    sad sad_13(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_13),.crt_frame(crt_frame_13),.sad_data(sad_data_13));
    sad sad_14(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_14),.crt_frame(crt_frame_14),.sad_data(sad_data_14));
    sad sad_15(.clk(clk),.rst_n(rst_n),.crt_keep(crt_keep),.pre_frame(pre_frame_15),.crt_frame(crt_frame_15),.sad_data(sad_data_15));

    wire [14-1:0] sad_cmp;
    wire [4-1:0] motion_vec_x_cmp;
    
    compare_tree ct(.sad_data_0(sad_data_0),.sad_data_1(sad_data_1),.sad_data_2(sad_data_2),.sad_data_3(sad_data_3),.sad_data_4(sad_data_4),.sad_data_5(sad_data_5),.sad_data_6(sad_data_6),.sad_data_7(sad_data_7),.sad_data_8(sad_data_8),.sad_data_9(sad_data_9),.sad_data_10(sad_data_10),.sad_data_11(sad_data_11),.sad_data_12(sad_data_12),.sad_data_13(sad_data_13),.sad_data_14(sad_data_14),.sad_data_15(sad_data_15),.sad_cmp(sad_cmp),.motion_vec_x_cmp(motion_vec_x_cmp));
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sad_min <= 14'b11_1111_1111_1111;
        end
        else begin
            if (pro_cnt == 5'd8) begin
                sad_min <= 14'b11_1111_1111_1111;
            end
            else if (pro_cnt >= 5'd9 || pro_cnt == 5'd0) begin
                sad_min <= (sad_cmp < sad_min) ? sad_cmp : sad_min;
            end
            else begin
                sad_min <= sad_min;
            end
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            motion_vec_y_min <= 4'b0;
        end
        else begin
            if (pro_cnt == 5'd8) begin
                motion_vec_y_min <= 4'b0;
            end
            // else if (pro_cnt == 5'd0) begin
            //     motion_vec_y_min <= (sad_cmp < sad_min) ? (5'd15) : motion_vec_y_min;
            // end
            else if (pro_cnt >= 5'd9 || pro_cnt == 5'd0) begin
                motion_vec_y_min <= (sad_cmp < sad_min) ? (pro_cnt - 5'd9) : motion_vec_y_min;
            end
            else begin
                motion_vec_y_min <= motion_vec_y_min;
            end
        end
    end
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            motion_vec_x_min <= 4'b0;
        end
        else begin
            if (pro_cnt == 5'd8) begin
                motion_vec_x_min <= 4'b0;
            end
            else if (pro_cnt >= 5'd9 || pro_cnt == 5'd0) begin
                motion_vec_x_min <= (sad_cmp < sad_min) ? motion_vec_x_cmp : motion_vec_x_min;
            end
            else begin
                motion_vec_x_min <= motion_vec_x_min;
            end
        end
    end
    
endmodule

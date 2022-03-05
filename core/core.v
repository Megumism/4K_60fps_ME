module core (input wire clk,
             input wire rst,
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
             output reg [14-1:0] sad_min,
             output reg [4-1:0] motion_vec_x_min,
             output reg [4-1:0] motion_vec_y_min);
    
    reg [5-1:4] pro_cnt;
    
    always @(posedge clk) begin
        if (rst) begin
            pro_cnt <= 0;
        end
        else begin
            if (pro_cnt == 24) begin
                pro_cnt = 0;
            end
            else begin
                pro_cnt <= pro_cnt+1;
            end
        end
    end
    
    wire crt_keep;
    assign crt_keep = (pro_cnt > = 8?) 1'b1 : 1'b0;
    
    // sad sad_#(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_#),.crt_frame(crt_frame_#),.sad(sad_#));
    sad sad_0(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_0),.crt_frame(crt_frame_0),.sad(sad_0));
    sad sad_1(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_1),.crt_frame(crt_frame_1),.sad(sad_1));
    sad sad_2(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_2),.crt_frame(crt_frame_2),.sad(sad_2));
    sad sad_3(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_3),.crt_frame(crt_frame_3),.sad(sad_3));
    sad sad_4(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_4),.crt_frame(crt_frame_4),.sad(sad_4));
    sad sad_5(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_5),.crt_frame(crt_frame_5),.sad(sad_5));
    sad sad_6(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_6),.crt_frame(crt_frame_6),.sad(sad_6));
    sad sad_7(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_7),.crt_frame(crt_frame_7),.sad(sad_7));
    sad sad_8(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_8),.crt_frame(crt_frame_8),.sad(sad_8));
    sad sad_9(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_9),.crt_frame(crt_frame_9),.sad(sad_9));
    sad sad_10(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_10),.crt_frame(crt_frame_10),.sad(sad_10));
    sad sad_11(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_11),.crt_frame(crt_frame_11),.sad(sad_11));
    sad sad_12(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_12),.crt_frame(crt_frame_12),.sad(sad_12));
    sad sad_13(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_13),.crt_frame(crt_frame_13),.sad(sad_13));
    sad sad_14(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_14),.crt_frame(crt_frame_14),.sad(sad_14));
    sad sad_15(.clk(clk),.rst(rst),.crt_keep(crt_keep),.pre_frame(pre_frame_15),.crt_frame(crt_frame_15),.sad(sad_15));
    
    wire [14-1:0] sad_cmp;
    wire [4-1:0] motion_vec_y;
    wire [14-1:0] sad_0;
    wire [14-1:0] sad_1;
    wire [14-1:0] sad_2;
    wire [14-1:0] sad_3;
    wire [14-1:0] sad_4;
    wire [14-1:0] sad_5;
    wire [14-1:0] sad_6;
    wire [14-1:0] sad_7;
    wire [14-1:0] sad_8;
    wire [14-1:0] sad_9;
    wire [14-1:0] sad_10;
    wire [14-1:0] sad_11;
    wire [14-1:0] sad_12;
    wire [14-1:0] sad_13;
    wire [14-1:0] sad_14;
    wire [14-1:0] sad_15;
    
    compare_tree ct(.sad_0(sad_0),.sad_1(sad_1),.sad_2(sad_2),.sad_3(sad_3),.sad_4(sad_4),.sad_5(sad_5),.sad_6(sad_6),.sad_7(sad_7),.sad_8(sad_8),.sad_9(sad_9),.sad_10(sad_10),.sad_11(sad_11),.sad_12(sad_12),.sad_13(sad_13),.sad_14(sad_14),.sad_15(sad_15),.sad_cmp(sad_cmp),.motion_vec_y(motion_vec_y));
    
    always @(posedge clk) begin
        if (rst) begin
            sad_min = 14'b11_1111_1111_1111;
        end
        else begin
            if (pro_cnt == 0) begin
                sad_min = 14'b11_1111_1111_1111;
            end
            else if (pro_cnt > = 8 && pro_cnt< 24) begin
                sad_min = (sad_min < sad_cmp) ? sad_min : sad_cmp;
            end
            else begin
                sad_min = sad_min;
            end
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            motion_vec_y_min = 4'b0;
        end
        else begin
            if (pro_cnt == 0) begin
                motion_vec_y_min = 4'b0;
            end
            else if (pro_cnt > = 8 && pro_cnt< 24) begin
                motion_vec_y_min = (sad_min < sad_cmp) ? motion_vec_y_min : motion_vec_y;
            end
            else begin
                motion_vec_y_min = motion_vec_y_min;
            end
        end
    end

    always @(posedge clk) begin
        if (rst) begin
            motion_vec_x_min = 4'b0;
        end
        else begin
            if (pro_cnt == 0) begin
                motion_vec_x_min = 4'b0;
            end
            else if (pro_cnt > = 8 && pro_cnt< 24) begin
                motion_vec_x_min = (sad_min < sad_cmp) ? motion_vec_x_min : pro_cnt[4-1:0] - 4'd8;
            end
            else begin
                motion_vec_x_min = motion_vec_x_min;
            end
        end
    end
    
endmodule

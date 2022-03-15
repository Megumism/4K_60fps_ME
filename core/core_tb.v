`timescale 1ps/1ps

module core_tb();
    
    reg     clk;
    reg     rst_n;
    
    initial begin
        clk             = 1'b0;
        forever #50 clk = ~clk;
    end
    
    initial begin
        rst_n         = 1'b0;
        #300    rst_n = 1'b1;
        // #3000000 $display("---     result is %d         ---\n", verify);
        #10000   $stop;
    end
    
    reg [64-1:0] crt_frame_0;
    reg [64-1:0] crt_frame_1;
    reg [64-1:0] crt_frame_2;
    reg [64-1:0] crt_frame_3;
    reg [64-1:0] crt_frame_4;
    reg [64-1:0] crt_frame_5;
    reg [64-1:0] crt_frame_6;
    reg [64-1:0] crt_frame_7;
    reg [64-1:0] crt_frame_8;
    reg [64-1:0] crt_frame_9;
    reg [64-1:0] crt_frame_10;
    reg [64-1:0] crt_frame_11;
    reg [64-1:0] crt_frame_12;
    reg [64-1:0] crt_frame_13;
    reg [64-1:0] crt_frame_14;
    reg [64-1:0] crt_frame_15;
    wire [64-1:0] pre_frame_0;
    wire [64-1:0] pre_frame_1;
    wire [64-1:0] pre_frame_2;
    wire [64-1:0] pre_frame_3;
    wire [64-1:0] pre_frame_4;
    wire [64-1:0] pre_frame_5;
    wire [64-1:0] pre_frame_6;
    wire [64-1:0] pre_frame_7;
    wire [64-1:0] pre_frame_8;
    wire [64-1:0] pre_frame_9;
    wire [64-1:0] pre_frame_10;
    wire [64-1:0] pre_frame_11;
    wire [64-1:0] pre_frame_12;
    wire [64-1:0] pre_frame_13;
    wire [64-1:0] pre_frame_14;
    wire [64-1:0] pre_frame_15;
    wire sad_en;
    wire [14-1:0] sad_min;
    wire [4-1:0] motion_vec_x_min;
    wire [4-1:0] motion_vec_y_min;
    reg [23*8-1:0] data_in;
    
    // assign pre_frame_# = data_in[(23-#)*8-1:(23-8-#)*8];
    assign pre_frame_0    = data_in[(23-0)*8-1:(23-8-0)*8];
    assign pre_frame_1    = data_in[(23-1)*8-1:(23-8-1)*8];
    assign pre_frame_2    = data_in[(23-2)*8-1:(23-8-2)*8];
    assign pre_frame_3    = data_in[(23-3)*8-1:(23-8-3)*8];
    assign pre_frame_4    = data_in[(23-4)*8-1:(23-8-4)*8];
    assign pre_frame_5    = data_in[(23-5)*8-1:(23-8-5)*8];
    assign pre_frame_6    = data_in[(23-6)*8-1:(23-8-6)*8];
    assign pre_frame_7    = data_in[(23-7)*8-1:(23-8-7)*8];
    assign pre_frame_8    = data_in[(23-8)*8-1:(23-8-8)*8];
    assign pre_frame_9    = data_in[(23-9)*8-1:(23-8-9)*8];
    assign pre_frame_10   = data_in[(23-10)*8-1:(23-8-10)*8];
    assign pre_frame_11   = data_in[(23-11)*8-1:(23-8-11)*8];
    assign pre_frame_12   = data_in[(23-12)*8-1:(23-8-12)*8];
    assign pre_frame_13   = data_in[(23-13)*8-1:(23-8-13)*8];
    assign pre_frame_14   = data_in[(23-14)*8-1:(23-8-14)*8];
    assign pre_frame_15   = data_in[(23-15)*8-1:(23-8-15)*8];
    
    core core_test(
    .clk(clk),
    .rst_n(rst_n),
    .crt_frame_0(crt_frame_0),
    .crt_frame_1(crt_frame_1),
    .crt_frame_2(crt_frame_2),
    .crt_frame_3(crt_frame_3),
    .crt_frame_4(crt_frame_4),
    .crt_frame_5(crt_frame_5),
    .crt_frame_6(crt_frame_6),
    .crt_frame_7(crt_frame_7),
    .crt_frame_8(crt_frame_8),
    .crt_frame_9(crt_frame_9),
    .crt_frame_10(crt_frame_10),
    .crt_frame_11(crt_frame_11),
    .crt_frame_12(crt_frame_12),
    .crt_frame_13(crt_frame_13),
    .crt_frame_14(crt_frame_14),
    .crt_frame_15(crt_frame_15),
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
    .sad_en(sad_en),
    .sad_min(sad_min),
    .motion_vec_x_min(motion_vec_x_min),
    .motion_vec_y_min(motion_vec_y_min)
    );
    
    initial begin
        crt_frame_0  = 64'b0;
        crt_frame_1  = 64'b0;
        crt_frame_2  = 64'b0;
        crt_frame_3  = 64'b0;
        crt_frame_4  = 64'b0;
        crt_frame_5  = 64'b0;
        crt_frame_6  = 64'b0;
        crt_frame_7  = 64'b0;
        crt_frame_8  = 64'b0;
        crt_frame_9  = 64'b0;
        crt_frame_10 = 64'b0;
        crt_frame_11 = 64'b0;
        crt_frame_12 = 64'b0;
        crt_frame_13 = 64'b0;
        crt_frame_14 = 64'b0;
        crt_frame_15 = 64'b0;
    end
    
    initial begin
        #200;
        #100 data_in = {8'b0,{176{1'b1}}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {{8{1'b1}},16'b0,{160{1'b1}}};
        #100 data_in = {{64{1'b1}},8'b0,{112{1'b1}}};
        
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        
        #100 data_in = {184{1'b1}};
        #100 data_in = {184{1'b1}};
        #100 data_in = {{120{1'b1}},64'b0};
    end
    
    
endmodule

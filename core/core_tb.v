`timescale 1ps/1ps

module core_tb();
    
    reg     clk;
    reg     rst;
    
    initial begin
        clk             = 1'b0;
        forever #50 clk = ~clk;
    end
    
    initial begin
        rst         = 1'b1;
        #300    rst = 1'b0;
        // #3000000 $display("---     result is %d         ---\n", verify);
        #10000   $stop;
    end
    
    wire [64-1:0] crt_frame_0;
    wire [64-1:0] crt_frame_1;
    wire [64-1:0] crt_frame_2;
    wire [64-1:0] crt_frame_3;
    wire [64-1:0] crt_frame_4;
    wire [64-1:0] crt_frame_5;
    wire [64-1:0] crt_frame_6;
    wire [64-1:0] crt_frame_7;
    wire [64-1:0] crt_frame_8;
    wire [64-1:0] crt_frame_9;
    wire [64-1:0] crt_frame_10;
    wire [64-1:0] crt_frame_11;
    wire [64-1:0] crt_frame_12;
    wire [64-1:0] crt_frame_13;
    wire [64-1:0] crt_frame_14;
    wire [64-1:0] crt_frame_15;
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
    reg [64-1:0] crt_in;
    
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
    .rst(rst),
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
    
    assign crt_frame_0  = crt_in;
    assign crt_frame_1  = crt_in;
    assign crt_frame_2  = crt_in;
    assign crt_frame_3  = crt_in;
    assign crt_frame_4  = crt_in;
    assign crt_frame_5  = crt_in;
    assign crt_frame_6  = crt_in;
    assign crt_frame_7  = crt_in;
    assign crt_frame_8  = crt_in;
    assign crt_frame_9  = crt_in;
    assign crt_frame_10 = crt_in;
    assign crt_frame_11 = crt_in;
    assign crt_frame_12 = crt_in;
    assign crt_frame_13 = crt_in;
    assign crt_frame_14 = crt_in;
    assign crt_frame_15 = crt_in;

    initial begin
        #200;
        #100 crt_in = 64'b1111101011111010111110101111101011111010111110101111101011111010;
        #100 crt_in = 64'b1010000110100000100111101001110110011100100110111001101110011011;
        #100 crt_in = 64'b0100110101001011010010100100011101000011010000100100001001000001;
        #100 crt_in = 64'b0001100000011001000110110001101100010111000101010001010000010010;

        #100 crt_in = 64'b0010101000101011001010110010101000101010001010100010100100101001;
        #100 crt_in = 64'b1001110110011101100111101010000010100011101001001010010110100101;
        #100 crt_in = 64'b1001111110011111100111101001111010011110100111101001111010011110;
        #100 crt_in = 64'b0010011000100110001001010010010100100110001001100010011000100111;
    end
    
    initial begin
        #200;
        #100 data_in = {184{1'b0}};
        #100 data_in = {184{1'b0}};
        #100 data_in = {184{1'b0}};
        #100 data_in = {184{1'b0}};
        #100 data_in = {184{1'b0}};
        
        #100 data_in = {184{1'b0}};
        #100 data_in = {184{1'b0}};
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111010;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010100110101001001010001010100001101000011010000010011101100111011001110110011100100111011001101110011011100110001001011110010111;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000001000111010001000100001001000000001111110011111101000001010000100100001001000001010000000011111000111101001111010011110000111100;
        
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000011010000110100001100100011001000110110001110100011101000111100001111000011101000111000001101100011011000110100001101000011000;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000101011001010110010101100101100001011000010101100101011001010010010101000101001001010010010100000100111001001110010100000100111;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010011010100110111001101110011100100111001001110110011110101000001010000110100011101000111010010110100101101001011010010110100101;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010011111100111111001111110011111100111101001111010011110100111101001111010100000100111111001111110011111100111111010000010100000;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000100100001001000010010000100100001001000010010000100101001001010010010100100101001001010010011000100111001001110010011000100110;
        
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000111011001111110100000001000010010000110100010001000111010010000100100101001010010011000100110001001100010011000100101101001011;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111010111110101111101011111010;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010101010101010011010100010100111101001101010001110100011101000111010000110100001101000001001111110011101100111001001110010011101;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000110110001101100011011100110101001101010011010100110110001101110011101000111010001110010011100000110110001101010011010000110100;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000011001000110100001101000011010000110100001101000011011000110110001110100100000001000000001111100011111000111110001111000011110;
        
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000000110111001101010011001100110011001100110011001100110011001100110011001100110010001100100011000000101101001010110010110000101001;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010011011100110111001110010011100100111001001111010100000101000011010001010100010101000111010001110100011101001001010010010100100;
        #100 data_in = 184'b0000000000000000000000000000000000000000000000000000000010100000101000001010000010100000101000001010000110100001101000101010001010100010101000101010001010100010101000111010001110100011;
    end
    
    
endmodule

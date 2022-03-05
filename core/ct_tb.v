`timescale 1ps/1ps

module ct_tb();
    
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
        #1000   $stop;
    end
    
    reg [14-1:0] sad_0;
    reg [14-1:0] sad_1;
    reg [14-1:0] sad_2;
    reg [14-1:0] sad_3;
    reg [14-1:0] sad_4;
    reg [14-1:0] sad_5;
    reg [14-1:0] sad_6;
    reg [14-1:0] sad_7;
    reg [14-1:0] sad_8;
    reg [14-1:0] sad_9;
    reg [14-1:0] sad_10;
    reg [14-1:0] sad_11;
    reg [14-1:0] sad_12;
    reg [14-1:0] sad_13;
    reg [14-1:0] sad_14;
    reg [14-1:0] sad_15;
    
    initial begin
        sad_0  = 14'd0;
        sad_1  = 14'd1;
        sad_2  = 14'd2;
        sad_3  = 14'd3;
        sad_4  = 14'd4;
        sad_5  = 14'd5;
        sad_6  = 14'd6;
        sad_7  = 14'd7;
        sad_8  = 14'd8;
        sad_9  = 14'd9;
        sad_10 = 14'd10;
        sad_11 = 14'd11;
        sad_12 = 14'd12;
        sad_13 = 14'd13;
        sad_14 = 14'd14;
        sad_15 = 14'd15;
        #100
        sad_0  = 14'd45;
        sad_1  = 14'd7;
        sad_2  = 14'd2;
        sad_3  = 14'd3;
        sad_4  = 14'd4;
        sad_5  = 14'd6;
        sad_6  = 14'd6;
        sad_7  = 14'd7;
        sad_8  = 14'd8;
        sad_9  = 14'd9;
        sad_10 = 14'd10;
        sad_11 = 14'd11;
        sad_12 = 14'd132;
        sad_13 = 14'd13;
        sad_14 = 14'd14;
        sad_15 = 14'd15;
        #100
        sad_0  = 14'd435;
        sad_1  = 14'd234;
        sad_2  = 14'd345;
        sad_3  = 14'd489;
        sad_4  = 14'd3457;
        sad_5  = 14'd23;
        sad_6  = 14'd347;
        sad_7  = 14'd3983;
        sad_8  = 14'd2349;
        sad_9  = 14'd912;
        sad_10 = 14'd1342;
        sad_11 = 14'd135;
        sad_12 = 14'd1334;
        sad_13 = 14'd134;
        sad_14 = 14'd135;
        sad_15 = 14'd1349;
    end

    wire [14-1:0] sad_cmp;
    wire [4-1:0] motion_vec_y;
    
    compare_tree ct(.sad_0(sad_0),.sad_1(sad_1),.sad_2(sad_2),.sad_3(sad_3),.sad_4(sad_4),.sad_5(sad_5),.sad_6(sad_6),.sad_7(sad_7),.sad_8(sad_8),.sad_9(sad_9),.sad_10(sad_10),.sad_11(sad_11),.sad_12(sad_12),.sad_13(sad_13),.sad_14(sad_14),.sad_15(sad_15),.sad_cmp(sad_cmp),.motion_vec_y(motion_vec_y));
    
    
endmodule

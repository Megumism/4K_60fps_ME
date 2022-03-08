`timescale 1ps/1ps

module sad_tb();
    
    reg clk;
    reg rst;
    reg crt_keep;
    
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

    initial begin
        crt_keep = 1'b0;
        //1T=100ps 
        #1100   crt_keep = 1'b1;
    end

    reg [64-1:0] pre_frame;
    reg [64-1:0] crt_frame;
    wire [14-1:0] sad_data;

    initial begin
        pre_frame = 64'hFFFFFFFFFFFFFFFF;
        crt_frame = 64'b0;
    end

    
    sad sad_for_test (.clk(clk)
                     ,.rst(rst)
                     ,.crt_keep(crt_keep)
                     ,.pre_frame(pre_frame)
                     ,.crt_frame(crt_frame)
                     ,.sad_data(sad_data));

endmodule

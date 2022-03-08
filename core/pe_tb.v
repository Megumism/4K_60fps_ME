`timescale 1ps/1ps

module pe_tb();
    
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

    reg [8-1:0] crt_pixel_i;
    reg [8-1:0] pre_pixel_i;
    wire [8-1:0] crt_pixel_o;
    wire [8-1:0] pre_pixel_o;
    wire [8-1:0] ad;

    initial begin
        crt_pixel_i = 8'b00000000;
        pre_pixel_i = 8'b11111111;
        #400
        crt_pixel_i = 8'b11111111;
        pre_pixel_i = 8'b00000000;
        #100
        crt_pixel_i = 8'b11111111;
        pre_pixel_i = 8'b11111111;
    end

    pe pe_for_test (.clk(clk)
                   ,.rst(rst)
                   ,.crt_keep(crt_keep)
                   ,.crt_pixel_i(crt_pixel_i)
                   ,.pre_pixel_i(pre_pixel_i)
                   ,.crt_pixel_o(crt_pixel_o)
                   ,.pre_pixel_o(pre_pixel_o)
                   ,.ad(ad));

endmodule
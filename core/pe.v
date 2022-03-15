module pe (input wire clk,
           input wire rst,
           input wire crt_keep,
           input wire [8-1:0] crt_pixel_i,
           input wire [8-1:0] pre_pixel_i,
           output wire [8-1:0] crt_pixel_o,
           output wire [8-1:0] pre_pixel_o,
           output wire [8-1:0] ad);
    
    //定义内部用于计算的当前帧像素信号
    reg [8-1:0] crt_pixel_cal;
    always @(posedge clk) begin

        if(rst) crt_pixel_cal <= 0;

        else begin
            if(crt_keep == 0) crt_pixel_cal <= crt_pixel_i;
            else crt_pixel_cal <= crt_pixel_cal;
        end
    
    end

    //定义内部用于计算的先前帧像素信号
    reg [8-1:0] pre_pixel_cal;
    always @(posedge clk) begin

        if(rst) pre_pixel_cal <= 0;

        else pre_pixel_cal <= pre_pixel_i;

    end

    //定义计算结果AD值
    assign ad = (crt_pixel_cal > pre_pixel_cal)
               ?(crt_pixel_cal - pre_pixel_cal)
               :(pre_pixel_cal - crt_pixel_cal);

    //定义输出的当前帧像素信号
    assign crt_pixel_o = crt_pixel_cal;

    //定义输出的先前帧像素信号
    assign pre_pixel_o = pre_pixel_cal;

endmodule
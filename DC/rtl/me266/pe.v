module pe (input wire clk,
           input wire rst_n,
           input wire crt_keep,
           input wire [8-1:0] crt_pixel_i,
           input wire [8-1:0] pre_pixel_i,
           output wire [8-1:0] crt_pixel_o,
           output wire [8-1:0] pre_pixel_o,
           output wire [8-1:0] ad);
    
    //????????????????
    reg [8-1:0] crt_pixel_cal;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) crt_pixel_cal <= 0;

        else begin
            if(crt_keep == 0) crt_pixel_cal <= crt_pixel_i;
            else crt_pixel_cal <= crt_pixel_cal;
        end
    
    end

    //????????????????
    reg [8-1:0] pre_pixel_cal;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) pre_pixel_cal <= 0;

        else pre_pixel_cal <= pre_pixel_i;

    end

    //??????AD?
    assign ad = (crt_pixel_cal > pre_pixel_cal)
               ?(crt_pixel_cal - pre_pixel_cal)
               :(pre_pixel_cal - crt_pixel_cal);

    //????????????
    assign crt_pixel_o = crt_pixel_cal;

    //????????????
    assign pre_pixel_o = pre_pixel_cal;

endmodule

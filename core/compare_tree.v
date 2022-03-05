module compare_tree (input wire [14-1:0] sad_0,
                     input wire [14-1:0] sad_1,
                     input wire [14-1:0] sad_2,
                     input wire [14-1:0] sad_3,
                     input wire [14-1:0] sad_4,
                     input wire [14-1:0] sad_5,
                     input wire [14-1:0] sad_6,
                     input wire [14-1:0] sad_7,
                     input wire [14-1:0] sad_8,
                     input wire [14-1:0] sad_9,
                     input wire [14-1:0] sad_10,
                     input wire [14-1:0] sad_11,
                     input wire [14-1:0] sad_12,
                     input wire [14-1:0] sad_13,
                     input wire [14-1:0] sad_14,
                     input wire [14-1:0] sad_15,
                     output wire [14-1:0] sad_cmp,
                     output wire [4-1:0] motion_vec_y);
    
    // wire [14-1:0] cmp_0_#;
    wire [14+1-1:0] cmp_0_0;
    wire [14+1-1:0] cmp_0_1;
    wire [14+1-1:0] cmp_0_2;
    wire [14+1-1:0] cmp_0_3;
    wire [14+1-1:0] cmp_0_4;
    wire [14+1-1:0] cmp_0_5;
    wire [14+1-1:0] cmp_0_6;
    wire [14+1-1:0] cmp_0_7;
    // wire [14+2-1:0] cmp_1_#;
    wire [14+2-1:0] cmp_1_0;
    wire [14+2-1:0] cmp_1_1;
    wire [14+2-1:0] cmp_1_2;
    wire [14+2-1:0] cmp_1_3;
    //
    wire [14+3-1:0] cmp_2_0;
    wire [14+3-1:0] cmp_2_1;
    //
    wire [14+4-1:0] cmp;
    
    // assign cmp_0_# = (sad_ < sad_) ? {1'b0, sad_} : {1'b0, sad_};
    assign cmp_0_0    = (sad_0 < sad_1) ? {1'b0, sad_0} : {1'b1, sad_1};
    assign cmp_0_1    = (sad_2 < sad_3) ? {1'b0, sad_2} : {1'b1, sad_3};
    assign cmp_0_2    = (sad_4 < sad_5) ? {1'b0, sad_4} : {1'b1, sad_5};
    assign cmp_0_3    = (sad_6 < sad_7) ? {1'b0, sad_6} : {1'b1, sad_7};
    assign cmp_0_4    = (sad_8 < sad_9) ? {1'b0, sad_8} : {1'b1, sad_9};
    assign cmp_0_5    = (sad_10 < sad_11) ? {1'b0, sad_10} : {1'b1, sad_11};
    assign cmp_0_6    = (sad_12 < sad_13) ? {1'b0, sad_12} : {1'b1, sad_13};
    assign cmp_0_7    = (sad_14 < sad_15) ? {1'b0, sad_14} : {1'b1, sad_15};
    //
    assign cmp_1_0 = (cmp_0_0[14-1:0] < cmp_0_1[14-1:0]) ? {1'b0, cmp_0_0} : {1'b1, cmp_0_1};
    assign cmp_1_1 = (cmp_0_2[14-1:0] < cmp_0_3[14-1:0]) ? {1'b0, cmp_0_2} : {1'b1, cmp_0_3};
    assign cmp_1_2 = (cmp_0_4[14-1:0] < cmp_0_5[14-1:0]) ? {1'b0, cmp_0_4} : {1'b1, cmp_0_5};
    assign cmp_1_3 = (cmp_0_6[14-1:0] < cmp_0_7[14-1:0]) ? {1'b0, cmp_0_6} : {1'b1, cmp_0_7};
    //
    assign cmp_2_0 = (cmp_1_0[14-1:0] < cmp_1_1[14-1:0]) ? {1'b0, cmp_1_0} : {1'b1, cmp_1_1};
    assign cmp_2_1 = (cmp_1_2[14-1:0] < cmp_1_3[14-1:0]) ? {1'b0, cmp_1_2} : {1'b1, cmp_1_3};
    //
    assign cmp = (cmp_2_0[14-1:0] < cmp_2_1[14-1:0]) ? {1'b0, cmp_2_0} : {1'b1, cmp_2_1};
    //
    assign motion_vec_y = cmp[14+3:14];
    assign sad_cmp      = cmp[14-1:0];
    
endmodule

//module idct_chip(clk,rstn,mode,start,din,dout,dout_mode);
module me266_chip(clk,rst,ref_in,cur_in,ref_read,cur_read,sad_out,x_out,y_out,sign_sad);

input clk,rst;
input[63:0] ref_in;
input[31:0] cur_in;
output ref_read,cur_read,sad_out,x_out,y_out,sign_sad;

wire net_clk,net_rst,net_ref_read,net_cur_read,net_sad_out,net_x_out,net_y_out,net_sign_sad;
wire [63:0] net_ref_in;
wire [31:0] net_cur_in;


//input clk,rstn;
//input [1:0] mode;
//input start;
//input [15:0] din;

//output [15:0] dout;
//output [1:0] dout_mode;

//wire net_clk,net_rstn;
//wire [1:0] net_mode,net_dout_mode;
//wire net_start;
//wire [15:0] net_din,net_dout;


HPDWUW1416DGP
	HPDWUW1416DGP_clk(.PAD(clk),.C(net_clk),.IE(1'b1)),
	HPDWUW1416DGP_rst(.PAD(rst),.C(net_rst),.IE(1'b1)),

	HPDWUW1416DGP_ref_in0(.PAD(ref_in[0]),.C(net_ref_in[0]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in1(.PAD(ref_in[1]),.C(net_ref_in[1]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in2(.PAD(ref_in[2]),.C(net_ref_in[2]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in3(.PAD(ref_in[3]),.C(net_ref_in[3]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in4(.PAD(ref_in[4]),.C(net_ref_in[4]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in5(.PAD(ref_in[5]),.C(net_ref_in[5]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in6(.PAD(ref_in[6]),.C(net_ref_in[6]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in7(.PAD(ref_in[7]),.C(net_ref_in[7]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in8(.PAD(ref_in[8]),.C(net_ref_in[8]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in9(.PAD(ref_in[9]),.C(net_ref_in[9]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in10(.PAD(ref_in[10]),.C(net_ref_in[10]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in11(.PAD(ref_in[11]),.C(net_ref_in[11]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in12(.PAD(ref_in[12]),.C(net_ref_in[12]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in13(.PAD(ref_in[13]),.C(net_ref_in[13]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in14(.PAD(ref_in[14]),.C(net_ref_in[14]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in15(.PAD(ref_in[15]),.C(net_ref_in[15]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in16(.PAD(ref_in[16]),.C(net_ref_in[16]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in17(.PAD(ref_in[17]),.C(net_ref_in[17]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in18(.PAD(ref_in[18]),.C(net_ref_in[18]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in19(.PAD(ref_in[19]),.C(net_ref_in[19]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in20(.PAD(ref_in[20]),.C(net_ref_in[20]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in21(.PAD(ref_in[21]),.C(net_ref_in[21]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in22(.PAD(ref_in[22]),.C(net_ref_in[22]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in23(.PAD(ref_in[23]),.C(net_ref_in[23]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in24(.PAD(ref_in[24]),.C(net_ref_in[24]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in25(.PAD(ref_in[25]),.C(net_ref_in[25]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in26(.PAD(ref_in[26]),.C(net_ref_in[26]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in27(.PAD(ref_in[27]),.C(net_ref_in[27]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in28(.PAD(ref_in[28]),.C(net_ref_in[28]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in29(.PAD(ref_in[29]),.C(net_ref_in[29]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in30(.PAD(ref_in[30]),.C(net_ref_in[30]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in31(.PAD(ref_in[31]),.C(net_ref_in[31]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in32(.PAD(ref_in[32]),.C(net_ref_in[32]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in33(.PAD(ref_in[33]),.C(net_ref_in[33]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in34(.PAD(ref_in[34]),.C(net_ref_in[34]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in35(.PAD(ref_in[35]),.C(net_ref_in[35]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in36(.PAD(ref_in[36]),.C(net_ref_in[36]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in37(.PAD(ref_in[37]),.C(net_ref_in[37]),.IE(1'b1)),
  	HPDWUW1416DGP_ref_in38(.PAD(ref_in[38]),.C(net_ref_in[38]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in39(.PAD(ref_in[39]),.C(net_ref_in[39]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in40(.PAD(ref_in[40]),.C(net_ref_in[40]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in41(.PAD(ref_in[41]),.C(net_ref_in[41]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in42(.PAD(ref_in[42]),.C(net_ref_in[42]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in43(.PAD(ref_in[43]),.C(net_ref_in[43]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in44(.PAD(ref_in[44]),.C(net_ref_in[44]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in45(.PAD(ref_in[45]),.C(net_ref_in[45]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in46(.PAD(ref_in[46]),.C(net_ref_in[46]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in47(.PAD(ref_in[47]),.C(net_ref_in[47]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in48(.PAD(ref_in[48]),.C(net_ref_in[48]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in49(.PAD(ref_in[49]),.C(net_ref_in[49]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in50(.PAD(ref_in[50]),.C(net_ref_in[50]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in51(.PAD(ref_in[51]),.C(net_ref_in[51]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in52(.PAD(ref_in[52]),.C(net_ref_in[52]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in53(.PAD(ref_in[53]),.C(net_ref_in[53]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in54(.PAD(ref_in[54]),.C(net_ref_in[54]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in55(.PAD(ref_in[55]),.C(net_ref_in[55]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in56(.PAD(ref_in[56]),.C(net_ref_in[56]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in57(.PAD(ref_in[57]),.C(net_ref_in[57]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in58(.PAD(ref_in[58]),.C(net_ref_in[58]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in59(.PAD(ref_in[59]),.C(net_ref_in[59]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in60(.PAD(ref_in[60]),.C(net_ref_in[60]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in61(.PAD(ref_in[61]),.C(net_ref_in[61]),.IE(1'b1)),
	HPDWUW1416DGP_ref_in62(.PAD(ref_in[62]),.C(net_ref_in[62]),.IE(1'b1)),
        HPDWUW1416DGP_ref_in63(.PAD(ref_in[63]),.C(net_ref_in[63]),.IE(1'b1)),



   
        HPDWUW1416DGP_cur_in0(.PAD(cur_in[0]),.C(net_cur_in[0]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in1(.PAD(cur_in[1]),.C(net_cur_in[1]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in2(.PAD(cur_in[2]),.C(net_cur_in[2]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in3(.PAD(cur_in[3]),.C(net_cur_in[3]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in4(.PAD(cur_in[4]),.C(net_cur_in[4]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in5(.PAD(cur_in[5]),.C(net_cur_in[5]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in6(.PAD(cur_in[6]),.C(net_cur_in[6]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in7(.PAD(cur_in[7]),.C(net_cur_in[7]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in8(.PAD(cur_in[8]),.C(net_cur_in[8]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in9(.PAD(cur_in[9]),.C(net_cur_in[9]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in10(.PAD(cur_in[10]),.C(net_cur_in[10]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in11(.PAD(cur_in[11]),.C(net_cur_in[11]),.IE(1'b1)),
 	HPDWUW1416DGP_cur_in12(.PAD(cur_in[12]),.C(net_cur_in[12]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in13(.PAD(cur_in[13]),.C(net_cur_in[13]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in14(.PAD(cur_in[14]),.C(net_cur_in[14]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in15(.PAD(cur_in[15]),.C(net_cur_in[15]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in16(.PAD(cur_in[16]),.C(net_cur_in[16]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in17(.PAD(cur_in[17]),.C(net_cur_in[17]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in18(.PAD(cur_in[18]),.C(net_cur_in[18]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in19(.PAD(cur_in[19]),.C(net_cur_in[19]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in20(.PAD(cur_in[20]),.C(net_cur_in[20]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in21(.PAD(cur_in[21]),.C(net_cur_in[21]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in22(.PAD(cur_in[22]),.C(net_cur_in[22]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in23(.PAD(cur_in[23]),.C(net_cur_in[23]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in24(.PAD(cur_in[24]),.C(net_cur_in[24]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in25(.PAD(cur_in[25]),.C(net_cur_in[25]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in26(.PAD(cur_in[26]),.C(net_cur_in[26]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in27(.PAD(cur_in[27]),.C(net_cur_in[27]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in28(.PAD(cur_in[28]),.C(net_cur_in[28]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in29(.PAD(cur_in[29]),.C(net_cur_in[29]),.IE(1'b1)),
	HPDWUW1416DGP_cur_in30(.PAD(cur_in[30]),.C(net_cur_in[30]),.IE(1'b1)),
        HPDWUW1416DGP_cur_in31(.PAD(cur_in[31]),.C(net_cur_in[31]),.IE(1'b1));












	
HPDWUW1416DGP
	HPDWUW1416DGP_ref_read(.PAD(ref_read),.I(net_ref_read),.OE(1'b1)),
	HPDWUW1416DGP_cur_read(.PAD(cur_read),.I(net_cur_read),.OE(1'b1)),
	HPDWUW1416DGP_sign_sad(.PAD(sign_sad),.I(net_sign_sad),.OE(1'b1)),
	HPDWUW1416DGP_sad_out(.PAD(sad_out),.I(net_sad_out),.OE(1'b1)),
	HPDWUW1416DGP_y_out(.PAD(y_out),.I(net_y_out),.OE(1'b1)),
	HPDWUW1416DGP_x_out(.PAD(x_out),.I(x_out),.OE(1'b1));
	


me266 ME266(.clk(net_clk),
            .rst(net_rst),
	    .ref_in(net_ref_in),
            .cur_in(net_cur_in),
	    .ref_read(net_ref_read),
	    .cur_read(net_cur_read),
		.sign_sad(net_sign_sad),
	    .sad_out(net_sad_out),
	    .x_out(net_x_out),
	    .y_out(net_y_out));

endmodule
	

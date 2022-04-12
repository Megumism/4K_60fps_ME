`timescale 1ns/1ps 
module ME266_TB();

integer cur,pre,sadt,xt,yt;
reg [63:0] ref_in;
reg [31:0] cur_in;
reg signed [13:0] sad;
reg signed [3:0] x,y;

reg clk,rst;
reg [3:0] count;
wire ref_read,cur_read;
wire sad_out,x_out,y_out,sign_sad;

me266 ME266 (.clk(clk),
             .rst(rst),
             .ref_in(ref_in),
             .cur_in(cur_in),
             .ref_read(ref_read),
             .cur_read(cur_read),
             .sign_sad(sign_sad),
             .sad_out(sad_out),
             .x_out(x_out),
             .y_out(y_out));




initial//txt load
begin 
    clk=0;
    count=0;
	  cur=$fopen("D:/desktop/ME_data_2022/inputs/4k/cur_3.txt","r");//load cur//记得改地址
	  pre=$fopen("D:/desktop/ME_data_2022/inputs/4k/ref_bi.txt","r");//load ref	 
    sadt=$fopen("D:/desktop/sad.txt","w");//write sad	 
    xt=$fopen("D:/desktop/x.txt","w");//write x 
    yt=$fopen("D:/desktop/y.txt","w");//write y 
    
	  
end

initial
begin
  rst=1;
  #15;
  rst=0;
  #15;
  rst=1;
end
always #5 clk=~clk;
always@(negedge clk)//ref_in
begin
  if(ref_read==1)$fscanf(pre,"%b" ,ref_in) ;
  else ref_in<=ref_in;
 // $display("%b,%b",ref_in[63:0],ref_read) ;
end
	
always@(posedge clk)//cur_in
begin
  if(cur_read==1)$fscanf(cur,"%b" ,cur_in) ;
  else cur_in<=cur_in;
  //$display("%b,%b",cur_in[31:0],cur_read) ; 
end

always@(posedge clk)//sad
begin
  if(sign_sad) sad[13:0]<={sad[12:0],sad_out};
  else sad[13:0]<=sad[13:0];
end

always@(posedge clk)//x
begin
  if(sign_sad) x[3:0]<={x[2:0],x_out};
  else x[3:0]<=x[3:0];
end

always@(posedge clk)//y
begin
  if(sign_sad) y[3:0]<={y[2:0],y_out};
  else y[3:0]<=y[3:0];
end

always@(posedge clk)//count
begin
  if(sign_sad) count<=count+1;
  else if(count==14) count<=0;
  else count<=0;
end

always@(posedge clk)//write sad
begin
  if(count==14) $fwrite(sadt,"%d\n",sad[13:0]) ;
  else rst<=rst;
end

always@(posedge clk)//write x{x[4:4],x[2:0]}
begin
  if(count==5) begin 
    if({x[0],x[3:1]}==8) $fwrite(xt,"%d\n",4'd8);
    else $fwrite(xt,"%d\n",$signed({x[0],x[3:1]}));
      end
  else rst<=rst;

end

always@(posedge clk)//write y
begin
  if(count==5) begin 
    if({y[0],y[3:1]}==8) $fwrite(yt,"%d\n",4'd8);
    else $fwrite(yt,"%d\n",$signed({y[0],y[3:1]}));
      end
  else rst<=rst;

end




endmodule
			



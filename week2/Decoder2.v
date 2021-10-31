module Decoder2(d3,d2,d1,d0,a0,a1);
	input a0,a1;
	output d3,d2,d1,d0;
	wire inva0,inva1;
	assign inva0= ~a0;
	assign inva1=  ~a1;
	assign d0=inva0 & inva1;
	assign d1=a0 & inva1;
	assign d2=a1 & inva0;
	assign d3=a1 & a0;
endmodule

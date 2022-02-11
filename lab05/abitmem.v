module aBit_mem(data,wr,clk,selection,outp);
input data,wr,clk,selection;
output outp;
wire dffclk,w;
assign dffclk=(~wr&clk&selection);

dFlipFlop(clk,data,w);
assign outp=w;

endmodule

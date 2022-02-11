module oneByteMem(data,wr,clk,select,byteOut);
input [7:0]data, wr, clk, select;
output [7:0]byteOut;

aBit_mem(data[0],wr,clk,select,byteOut[0]);
aBit_mem(data[1],wr,clk,select,byteOut[1]);
aBit_mem(data[2],wr,clk,select,byteOut[2]);
aBit_mem(data[3],wr,clk,select,byteOut[3]);
aBit_mem(data[4],wr,clk,select,byteOut[4]);
aBit_mem(data[5],wr,clk,select,byteOut[5]);
aBit_mem(data[6],wr,clk,select,byteOut[6]);
aBit_mem(data[7],wr,clk,select,byteOut[7]);

endmodule

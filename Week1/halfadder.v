module halfAdder(in,in1,outs,outc);
input in,in1;
output outc,outs;
assign {outc,outs}=in+in1;
endmodule

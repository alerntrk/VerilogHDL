module XorGate(in,in1,outp);
input in,in1;
output outp;
wire t1,t2,inv1,inv2;
notGate(in,inv1);
notGate(in1,inv2);
andGate(in,inv2,t1);
andGate(in1,inv1,t2);
OrGate(t1,t2,outp);
endmodule

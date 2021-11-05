module halfAdder2(o1,o2,i1,i2);
output o1,o2;
input i1,i2;
wire t1,t2,t3;

NandGate(t1,i1,i2);
NandGate(t2,i1,t1);
NandGate(t3,i2,t1);
NandGate(o1,t2,t3);
NandGate(o2,t1,t1);
endmodule

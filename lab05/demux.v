module demux(E,S1,S0,Y3,Y2,Y1,Y0);
input E,S1,S0;
output Y3,Y2,Y1,Y0;
wire nS1,nS0;
not n0(nS0,S0);
not n1(nS1,S1);
and a0(Y0,E,nS1,nS0);
and a1(Y1,E,nS1,S0);
and a2(Y2,E,S1,nS0);
and a3(Y3,E,S1,S0);
endmodule

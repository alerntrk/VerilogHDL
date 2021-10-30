module Decoder(d3,d2,d1,d0,a0,a1);
output d3,d2,d1,d0;
input a0,a1;
wire inva0,inva1;
notGate(inva0,a0);
notGate(inva1,a1);
andGate(d0,inva0,inva1);
andGate(d1,a0,inva1);
andGate(d2,inva0,a1);
andGate(d3,a0,a1);
endmodule

module halfAdder2(carry,out,in1,in2);
input in1,in2;
output carry,out;
XorGate(in1,in2,out);
andGate(in1,in2,carry);
endmodule

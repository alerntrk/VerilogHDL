module NandGate(o,in1,in2);
	output o;
	input in1,in2;
	assign o=~(in1 & in2);
endmodule

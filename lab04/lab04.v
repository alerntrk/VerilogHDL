/*
The analog signal, which is applied to ADC input is changing from 0 to 3V. The ADC is an 8-bit device, which
has the output pins connected to FPGA.
- Combinational logic will be designed by using three 8-bit comparators that include 4x1 multiplexers.
- The circuit should measure the analog input and the duty cycle of the PWM generated by FPGA device is
changing according to analog input value. You can see the duty cycle values (for the input voltages) in the
table below: 0 ≤Vin<0.5 à duty cycle=0%
0.5≤Vin<1.5 à cycle=30%
1.5≤Vin<2.5 à cycle=60%
2.5≤Vin<3.0 à cycle=100%
You can choose the PWM period value. Please follow the steps given below:
1. Design a 4x1 multiplexer module,
2. Design the 8-bit comparator module (Use the multiplexer modules),
3. Use the comparator modules and generate the proper PWM signals and derive the FPGA code.
4. Synthesize the circuit, program the FPGA, and verify its operation.

*/
//Mux
module mux(I0,I1,I2,I3,S0,S1,F);
input I0,I1,I2,I3,S0,S1;
output F;
assign F=(~S0&~S1&I0)|(~S0&I1&S1)|(~S1&I2&S0)|(S0&I3&S1);
endmodule

//2 bit comparator
module twobcomp(A1,A2,B1,B2,L,E,G);
input A1,A2,B1,B2;
output L,E,G;
mux(0,~B1&~B2,~B1,~B1|~B2,A1,A2,G);
mux(~B1&~B2,~B1&B2,B1&~B2,B1&B2,A1,A2,E);
mux(B1|B2,B1,B1&B2,0,A1,A2,L);
endmodule

//8 bit comparator
module eightbcomp(X1,X2,X3,X4,X5,X6,X7,X8,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8,LL,E,G);
input X1,X2,X3,X4,X5,X6,X7,X8,Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8;
output LL,E,G;
wire a,b,c,d,e,f,g,h,i,j,k,l;
twobcomp(X1,X2,Y1,Y2,a,b,c);
twobcomp(X3,X4,Y3,Y4,d,e,f);
twobcomp(X5,X6,Y5,Y6,g,h,i);
twobcomp(X7,X8,Y7,Y8,j,k,l);
assign LL=a|(b&d)|(b&e&g)|(b&e&h&j);
assign E=b&e&h&k;
assign G=c|(b&f)|(b&e&i)|(b&e&h&l);
endmodule


//main code

module mainmodule(d1,d2,d3,d4,d5,d6,d7,d8,clk,led);
output led;
input d1,d2,d3,d4,d5,d6,d7,d8,clk;
wire a,b,c,d,e,f,g,h,s0,s1,s2,s3;
eightbcomp(d1,d2,d3,d4,d5,d6,d7,d8,0,0,1,0,1,0,1,1,s0,a,b);
eightbcomp(d1,d2,d3,d4,d5,d6,d7,d8,1,0,0,0,0,0,0,0,c,d,e);
eightbcomp(d1,d2,d3,d4,d5,d6,d7,d8,1,1,0,1,0,1,0,1,f,g,h);
assign s1=(b&c)|a;
assign s2=(f&e)|d;
assign s3=g|h;

reg[0:7] cnt=0;
//wire ss[0:3];
//deneme_01(a,b,c,d,ss[0],ss[1],ss[2],ss[3]);

reg[0:7] duty;
always@(posedge clk) begin
 if(cnt<100) cnt <=cnt+1;
 else cnt<=0;
 if(s0) duty<=0;
 if(s1) duty<=30;
 if(s2) duty<=60;
 if(s3) duty<=100;
 //if(ss[2]==0) duty<=10;
end
assign led=cnt<duty ? 1:0;
//else assign led=0;a

endmodule


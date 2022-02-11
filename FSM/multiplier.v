module test(counter,mc,ml,clk,state,temp,RESULTT);
reg [5:0]result;
output reg [5:0]RESULTT;

input [5:0]ml;//multiplier
output reg[1:0]counter;
input [1:0]mc;//multipicand
input clk;
initial begin
	counter=2'b01;//for ease of implementation we prefer to start it from 1 rather than zero
	a<=6'b111111;
	result=6'b000000;
end
output[1:0] temp;
assign temp=mc-counter;//difference betweeen counter and multipicand
wire tmp;
assign tmp=temp[0]|temp[1];/*we create a dummy variable  tmp (one bit) ,to store if the counter reached to multiplier or not ,
instead of using 2 bit*/

reg F;// to store state
output state;
reg[5:0] a;/*
why did we create 'a' as an array? because i will use(it will be ANDed with multiplier which has 6 element in it)
it to check system in operation mode or not if 
system is done with operation mode output will be the result which is RESULTT variable in our case else it will be zero

*/
always @(posedge clk)
begin

		F<=tmp;//if counter arrived to multiplier,changes the state
		if(temp==0)a<=6'b000000;//checks whether the counter reach multipicand or not if it reached reset the reg a
		else a<=6'b111111;//if system is still state-1(operation mode) continue to increase counter and update result
		counter<=(counter+1);
		result<=(ml+result);
		RESULTT<=result&~a;
		if(a==6'b000000)begin//while system is passing to state-0 , set the variable to suitable values.
			result<=6'b000000;
			counter<=2'b01;
		end
end
assign state=F;
endmodule

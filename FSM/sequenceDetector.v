module sequenceDt(x,clk,rst,z);// it detects '1011'
input clk,x,rst;
output reg z;
parameter S0=3'b000,S1=3'b001,S2=3'b011,S3=3'b010,S4=3'b110;
reg [2:0] curState,nextState;
always @(posedge clk,posedge rst)begin

	if(rst==1)curState<=S0;
	else curState<=nextState;
end
always @(curState,x)begin 
	case (curState)
	S0:begin
		if(x==1)nextState<=S1;
		else nextState<=S0;
		end
	S1:begin
		if(x==0)nextState<=S2;
		else nextState<=S1;
		end
	S2:begin
		if(x==1)nextState<=S3;
		else nextState<=S0;
		end
	S3:begin 
		if(x==1)nextState<=S4;
		else nextState<=S3;
		end
	S4:begin
		if(x==1)nextState<=S1;
		else nextState<=S2;
		end
	default: nextState<=S0;
	endcase
end
		
always @(curState)begin
	case(curState)
	S0:z<=0;
	S1:z<=0;
	S2:z<=0;
	S3:z<=0;
	S4:z<=1;
	default:z<=0;
	endcase
end

endmodule

		
		
		
		
		
		
		


 

/*
Reading data from the selected addres of a RAM via using SPI protocol*/
module ram(
 input [3:0] data,
 input [5:0] addr,
 
 input we,clk,
 output [3:0] q,
 output qq,
 output reg [3:0] temp
 );
 reg [7:0] ram [3:0];
 reg [7:0] addr_reg;
 
 always @ (posedge clk)
 begin
  if(we)  begin
   ram[addr]<=data;
	temp<=0;
	end
  else begin
	/*shifts the captured data to the right 
	*/
	ram[addr][2]<=ram[addr][3];
	ram[addr][3]<=0;
	ram[addr][1]<=ram[addr][2];
	ram[addr][0]<=ram[addr][1];
	/*ram register gives the LSB to  MSB of the temp device
	*/
	temp[3]<=ram[addr][0];
	temp[2]<=temp[3];
	temp[1]<=temp[2];
	temp[0]<=temp[1];
 end
 end
 assign q =temp;
 //assign qq=ram[addr][3];
endmodule
